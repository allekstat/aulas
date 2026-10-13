import { createServer, type IncomingMessage, type ServerResponse } from 'node:http';
import { URL } from 'node:url';
import mysql, { type RowDataPacket, type ResultSetHeader } from 'mysql2/promise';

// ---------------------------------------------------------------------------
// Configuração do pool MySQL
// ---------------------------------------------------------------------------
const pool = mysql.createPool({
  host: process.env.DB_HOST ?? 'localhost',
  port: Number(process.env.DB_PORT ?? 3306),
  user: process.env.DB_USER ?? 'root',
  password: process.env.DB_PASS ?? '',
  database: process.env.DB_NAME ?? 'skillbridge',
  waitForConnections: true,
  connectionLimit: 10,
});

// ---------------------------------------------------------------------------
// Descrição genérica dos recursos (tabelas) da base
// ---------------------------------------------------------------------------
interface Resource {
  table: string;
  fields: string[];
  /** Chave primária simples; `null` significa chave composta. */
  pk: string | null;
  /** Campos que formam a chave composta (quando pk === null). */
  composite?: string[];
}

const resources: Record<string, Resource> = {
  usuarios: {
    table: 'usuarios',
    pk: 'id',
    fields: ['nome', 'email', 'senha', 'descricao', 'endereco', 'contato'],
  },
  empresas: { table: 'empresas', pk: 'id', fields: ['cnpj', 'usuario'] },
  instituicoes: { table: 'instituicoes', pk: 'id', fields: ['cnpj', 'usuario'] },
  cursos: { table: 'cursos', pk: 'id', fields: ['nome'] },
  alunos: {
    table: 'alunos',
    pk: 'id',
    fields: ['ra', 'periodo', 'usuario', 'curso', 'instituicao'],
  },
  vagas: {
    table: 'vagas',
    pk: 'id',
    fields: [
      'tipo',
      'descricao',
      'salario',
      'horario_inicio',
      'horario_termino',
      'numero_de_vagas',
      'empresa',
    ],
  },
  candidaturas: {
    table: 'candidaturas',
    pk: 'id',
    fields: ['aceito', 'aluno', 'vaga'],
  },
  categorias: { table: 'categorias', pk: 'id', fields: ['nome'] },
  tags: { table: 'tags', pk: 'id', fields: ['nome'] },
  tags_x_categorias: {
    table: 'tags_x_categorias',
    pk: null,
    composite: ['tag', 'categoria'],
    fields: ['tag', 'categoria'],
  },
  tags_x_vagas: {
    table: 'tags_x_vagas',
    pk: null,
    composite: ['tag', 'vaga'],
    fields: ['tag', 'vaga'],
  },
  tags_x_alunos: {
    table: 'tags_x_alunos',
    pk: null,
    composite: ['tag', 'aluno'],
    fields: ['tag', 'aluno'],
  },
};

// ---------------------------------------------------------------------------
// Helpers HTTP
// ---------------------------------------------------------------------------
const sendJson = (res: ServerResponse, status: number, data: unknown): void => {
  const body = JSON.stringify(data);
  res.writeHead(status, {
    'Content-Type': 'application/json; charset=utf-8',
    'Content-Length': Buffer.byteLength(body),
  });
  res.end(body);
};

const sendError = (res: ServerResponse, status: number, message: string): void => {
  sendJson(res, status, { error: message });
};

const readJsonBody = async (req: IncomingMessage): Promise<Record<string, unknown>> => {
  const chunks: Buffer[] = [];
  for await (const chunk of req) chunks.push(chunk as Buffer);
  if (chunks.length === 0) return {};
  const raw = Buffer.concat(chunks).toString('utf8');
  return JSON.parse(raw);
};

const pickFields = (
  resource: Resource,
  body: Record<string, unknown>,
): Record<string, unknown> => {
  const out: Record<string, unknown> = {};
  for (const f of resource.fields) {
    if (body[f] !== undefined) out[f] = body[f];
  }
  return out;
};

// ---------------------------------------------------------------------------
// Handlers para recursos com PK simples
// ---------------------------------------------------------------------------
const handleList = async (res: ServerResponse, resource: Resource): Promise<void> => {
  const [rows] = await pool.query(`SELECT * FROM \`${resource.table}\``);
  sendJson(res, 200, rows);
};

const handleGet = async (
  res: ServerResponse,
  resource: Resource,
  id: string,
): Promise<void> => {
  const [rows] = await pool.query(
    `SELECT * FROM \`${resource.table}\` WHERE \`${resource.pk}\` = ?`,
    [id],
  );
  const row = (rows as RowDataPacket[])[0];
  if (!row) return sendError(res, 404, 'registro não encontrado');
  sendJson(res, 200, row);
};

const handleCreate = async (
  res: ServerResponse,
  resource: Resource,
  body: Record<string, unknown>,
): Promise<void> => {
  const data = pickFields(resource, body);
  const cols = Object.keys(data);
  if (cols.length === 0) return sendError(res, 400, 'nenhum campo válido informado');

  const colList = cols.map((c) => `\`${c}\``).join(', ');
  const placeholders = cols.map(() => '?').join(', ');

  const [result] = await pool.query(
    `INSERT INTO \`${resource.table}\` (${colList}) VALUES (${placeholders})`,
    cols.map((c) => data[c]),
  );
  const info = result as ResultSetHeader;
  sendJson(res, 201, { id: info.insertId, affectedRows: info.affectedRows });
};

const handleUpdate = async (
  res: ServerResponse,
  resource: Resource,
  id: string,
  body: Record<string, unknown>,
): Promise<void> => {
  const data = pickFields(resource, body);
  const cols = Object.keys(data);
  if (cols.length === 0) return sendError(res, 400, 'nenhum campo válido informado');

  const setClause = cols.map((c) => `\`${c}\` = ?`).join(', ');
  const [result] = await pool.query(
    `UPDATE \`${resource.table}\` SET ${setClause} WHERE \`${resource.pk}\` = ?`,
    [...cols.map((c) => data[c]), id],
  );
  const info = result as ResultSetHeader;
  if (info.affectedRows === 0) return sendError(res, 404, 'registro não encontrado');
  sendJson(res, 200, { affectedRows: info.affectedRows });
};

const handleDelete = async (
  res: ServerResponse,
  resource: Resource,
  id: string,
): Promise<void> => {
  const [result] = await pool.query(
    `DELETE FROM \`${resource.table}\` WHERE \`${resource.pk}\` = ?`,
    [id],
  );
  const info = result as ResultSetHeader;
  if (info.affectedRows === 0) return sendError(res, 404, 'registro não encontrado');
  sendJson(res, 200, { affectedRows: info.affectedRows });
};

// ---------------------------------------------------------------------------
// Handlers para tabelas de junção (chave composta via query string)
// ---------------------------------------------------------------------------
const compositeKeyFromQuery = (url: URL, keys: string[]): unknown[] | null => {
  const values: unknown[] = [];
  for (const k of keys) {
    const v = url.searchParams.get(k);
    if (v === null) return null;
    values.push(v);
  }
  return values;
};

const handleCompositeGet = async (
  res: ServerResponse,
  resource: Resource,
  url: URL,
): Promise<void> => {
  const values = compositeKeyFromQuery(url, resource.composite!);
  if (!values) return sendError(res, 400, 'chaves ausentes na query string');

  const where = resource.composite!.map((k) => `\`${k}\` = ?`).join(' AND ');
  const [rows] = await pool.query(
    `SELECT * FROM \`${resource.table}\` WHERE ${where}`,
    values,
  );
  const row = (rows as RowDataPacket[])[0];
  if (!row) return sendError(res, 404, 'registro não encontrado');
  sendJson(res, 200, row);
};

const handleCompositeCreate = async (
  res: ServerResponse,
  resource: Resource,
  body: Record<string, unknown>,
): Promise<void> => {
  const data = pickFields(resource, body);
  const missing = resource.composite!.filter((k) => data[k] === undefined);
  if (missing.length > 0)
    return sendError(res, 400, `campos obrigatórios: ${missing.join(', ')}`);

  const cols = resource.composite!;
  const colList = cols.map((c) => `\`${c}\``).join(', ');
  const placeholders = cols.map(() => '?').join(', ');

  await pool.query(
    `INSERT INTO \`${resource.table}\` (${colList}) VALUES (${placeholders})`,
    cols.map((c) => data[c]),
  );
  sendJson(res, 201, { ok: true });
};

const handleCompositeDelete = async (
  res: ServerResponse,
  resource: Resource,
  url: URL,
): Promise<void> => {
  const values = compositeKeyFromQuery(url, resource.composite!);
  if (!values) return sendError(res, 400, 'chaves ausentes na query string');

  const where = resource.composite!.map((k) => `\`${k}\` = ?`).join(' AND ');
  const [result] = await pool.query(
    `DELETE FROM \`${resource.table}\` WHERE ${where}`,
    values,
  );
  const info = result as ResultSetHeader;
  if (info.affectedRows === 0) return sendError(res, 404, 'registro não encontrado');
  sendJson(res, 200, { affectedRows: info.affectedRows });
};

// ---------------------------------------------------------------------------
// Roteador
// ---------------------------------------------------------------------------
const server = createServer(async (req, res) => {
  try {
    if (!req.url || !req.method) return sendError(res, 400, 'requisição inválida');

    const url = new URL(req.url, `http://${req.headers.host ?? 'localhost'}`);
    const path = url.pathname.replace(/\/+$/, '');
    const parts = path.split('/').filter(Boolean);

    // Raiz de cortesia
    if (parts.length === 0) {
      return sendJson(res, 200, {
        name: 'SkillBridge API',
        endpoints: Object.keys(resources).map((r) => `/api/${r}`),
      });
    }

    if (parts[0] !== 'api') return sendError(res, 404, 'rota não encontrada');

    // /api -> lista de recursos disponíveis
    if (parts.length === 1) {
      return sendJson(res, 200, { recursos: Object.keys(resources) });
    }

    const resourceName = parts[1];
    const resource = resources[resourceName];
    if (!resource) return sendError(res, 404, `recurso '${resourceName}' não existe`);

    const idPart = parts[2];

    // ----- Recursos com chave composta -----
    if (resource.pk === null) {
      if (idPart) return sendError(res, 404, 'recurso não possui id simples');

      switch (req.method) {
        case 'GET':
          return await handleCompositeGet(res, resource, url);
        case 'POST': {
          const body = await readJsonBody(req);
          return await handleCompositeCreate(res, resource, body);
        }
        case 'DELETE':
          return await handleCompositeDelete(res, resource, url);
        default:
          return sendError(res, 405, 'método não permitido');
      }
    }

    // ----- Recursos com PK simples -----
    if (!idPart) {
      switch (req.method) {
        case 'GET':
          return await handleList(res, resource);
        case 'POST': {
          const body = await readJsonBody(req);
          return await handleCreate(res, resource, body);
        }
        default:
          return sendError(res, 405, 'método não permitido');
      }
    }

    switch (req.method) {
      case 'GET':
        return await handleGet(res, resource, idPart);
      case 'PUT':
      case 'PATCH': {
        const body = await readJsonBody(req);
        return await handleUpdate(res, resource, idPart, body);
      }
      case 'DELETE':
        return await handleDelete(res, resource, idPart);
      default:
        return sendError(res, 405, 'método não permitido');
    }
  } catch (err) {
    const e = err as { code?: string; message?: string };
    console.error('[SkillBridge] erro:', err);

    if (e.code === 'ER_DUP_ENTRY')
      return sendError(res, 409, 'registro duplicado (violação de UNIQUE)');
    if (e.code === 'ER_NO_REFERENCED_ROW_2')
      return sendError(res, 400, 'referência inválida (FK não encontrada)');
    if (e.code === 'ER_ROW_IS_REFERENCED_2')
      return sendError(res, 409, 'registro possui dependentes (FK)');
    if (e instanceof SyntaxError)
      return sendError(res, 400, 'JSON inválido no corpo da requisição');

    return sendError(res, 500, e.message ?? 'erro interno');
  }
});

const PORT = Number(process.env.PORT ?? 3000);
server.listen(PORT, () => {
  console.log(`SkillBridge API ouvindo em http://localhost:${PORT}`);
});