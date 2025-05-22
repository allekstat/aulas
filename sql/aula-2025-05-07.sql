DROP DATABASE IF EXISTS alexsander;
CREATE DATABASE alexsander;
USE alexsander;
 
CREATE TABLE artistas (
   codigo INT NOT NULL,
   nome VARCHAR(100) NOT NULL,
   CONSTRAINT pk_artista PRIMARY KEY (codigo),
   CONSTRAINT uq_nome_artista UNIQUE (nome)
);
 
CREATE TABLE gravadoras (
   codigo INT NOT NULL,
   nome VARCHAR(50) NOT NULL,
   CONSTRAINT pk_gravadora PRIMARY KEY (codigo),
   CONSTRAINT uq_nome_gravadora UNIQUE (nome)
);
 
CREATE TABLE categorias (
   codigo INT NOT NULL,
   nome VARCHAR(100) NOT NULL,
   CONSTRAINT pk_categoria PRIMARY KEY (codigo),
   CONSTRAINT uq_nome_categoria UNIQUE (nome)
);
 
CREATE TABLE estados (
   sigla CHAR(2) NOT NULL,
   nome VARCHAR(100) NOT NULL,
   CONSTRAINT pk_estado PRIMARY KEY (sigla),
   CONSTRAINT uq_nome_estado UNIQUE (nome)
);
 
CREATE TABLE cidades (
   codigo INT NOT NULL,
   estado CHAR(2) NOT NULL,
   nome VARCHAR(100) NOT NULL,
   CONSTRAINT pk_cidade PRIMARY KEY (codigo),
   CONSTRAINT fk_estado_cidade FOREIGN KEY (estado) REFERENCES estados (sigla)
);
 
CREATE TABLE clientes (
   codigo INT NOT NULL,
   cidade INT NOT NULL,
   nome VARCHAR(100) NOT NULL,
   endereco VARCHAR(200) NOT NULL,
   renda DECIMAL(10, 2) NOT NULL,
   sexo CHAR(1) NOT NULL,
   CONSTRAINT pk_cliente PRIMARY KEY (codigo),
   CONSTRAINT fk_cidade_cliente FOREIGN KEY (cidade) REFERENCES cidades (codigo),
   CONSTRAINT ck_renda_cliente CHECK (renda >= 0),
   CONSTRAINT ck_sexo_cliente CHECK (sexo IN ('m', 'f'))
);
 
CREATE TABLE conjuges (
   cliente INT NOT NULL,
   nome VARCHAR(100) NOT NULL,
   renda DECIMAL(10, 2) NOT NULL,
   sexo CHAR(1) NOT NULL,
   CONSTRAINT pk_conjuge PRIMARY KEY (cliente),
   CONSTRAINT fk_cliente_conjuge FOREIGN KEY (cliente) REFERENCES clientes (codigo),
   CONSTRAINT ck_renda_conjuge CHECK (renda >= 0),
   CONSTRAINT ck_sexo_conjuge CHECK (sexo IN ('m', 'f'))
);
 
CREATE TABLE funcionarios (
   codigo INT NOT NULL,
   nome VARCHAR(100) NOT NULL,
   endereco VARCHAR(200) NOT NULL,
   salario DECIMAL(10, 2) NOT NULL,
   sexo CHAR(1) NOT NULL,
   CONSTRAINT pk_funcionario PRIMARY KEY (codigo),
   CONSTRAINT ck_salario_funcionario CHECK (salario >= 0),
   CONSTRAINT ck_sexo_funcionario CHECK (sexo IN ('m', 'f'))
);
 
CREATE TABLE dependentes (
   codigo INT NOT NULL,
   funcionario INT NOT NULL,
   nome VARCHAR(100) NOT NULL,
   sexo CHAR(1) NOT NULL,
   CONSTRAINT pk_dependente PRIMARY KEY (codigo),
   CONSTRAINT fk_funcionario_dependente FOREIGN KEY (funcionario) REFERENCES funcionarios (codigo),
   CONSTRAINT ck_sexo_dependente CHECK (sexo IN ('m', 'f'))
);
 
CREATE TABLE titulos (
   codigo INT NOT NULL,
   categoria INT NOT NULL,
   gravadora INT NOT NULL,
   nome VARCHAR(100) NOT NULL,
   valor DECIMAL(10, 2) NOT NULL,
   quantidade INT NOT NULL,
   CONSTRAINT pk_titulo PRIMARY KEY (codigo),
   CONSTRAINT fk_categoria_titulo FOREIGN KEY (categoria) REFERENCES categorias (codigo),
   CONSTRAINT fk_gravadora_titulo FOREIGN KEY (gravadora) REFERENCES gravadoras (codigo),
   CONSTRAINT uq_nome_titulo UNIQUE (nome),
   CONSTRAINT ck_valor_titulo CHECK (valor > 0),
   CONSTRAINT ck_quantidade_titulo CHECK (quantidade >= 0)
);
 
CREATE TABLE pedidos (
   numero INT NOT NULL,
   cliente INT NOT NULL,
   funcionario INT NOT NULL,
   data_pedido DATE NOT NULL,
   valor DECIMAL(10, 2) NOT NULL,
   CONSTRAINT pk_pedido PRIMARY KEY (numero),
   CONSTRAINT fk_cliente_pedido FOREIGN KEY (cliente) REFERENCES clientes (codigo),
   CONSTRAINT fk_funcionario_pedido FOREIGN KEY (funcionario) REFERENCES funcionarios (codigo),
   CONSTRAINT ck_valor_pedido CHECK (valor > 0)
);
 
CREATE TABLE titulos_pedidos (
   pedido INT NOT NULL,
   titulo INT NOT NULL,
   quantidade INT NOT NULL,
   valor DECIMAL(10, 2) NOT NULL,
   CONSTRAINT pk_titulo_pedido PRIMARY KEY (pedido, titulo),
   CONSTRAINT fk_pedido_titulo_pedido FOREIGN KEY (pedido) REFERENCES pedidos (numero),
   CONSTRAINT fk_titulo_titulo_pedido FOREIGN KEY (titulo) REFERENCES titulos (codigo),
   CONSTRAINT ck_quantidade_titulo_pedido CHECK (quantidade >= 1),
   CONSTRAINT ck_valor_titulo_pedido CHECK (valor > 0)
);
 
CREATE TABLE titulos_artistas (
   titulo INT NOT NULL,
   artista INT NOT NULL,
   CONSTRAINT pk_titulo_artista PRIMARY KEY (titulo, artista),
   CONSTRAINT fk_titulo_titulo_artista FOREIGN KEY (titulo) REFERENCES titulos (codigo),
   CONSTRAINT fk_artista_titulo_artista FOREIGN KEY (artista) REFERENCES artistas (codigo)
);

INSERT INTO artistas (codigo, nome) VALUES 
(1, 'Marisa Monte'),
(2, 'Gilberto Gil'),
(3, 'Caetano Veloso'),
(4, 'Milton Nascimento'),
(5, 'Legião Urbana'),
(6, 'The Beatles'),
(7, 'Rita Lee');
 
INSERT INTO gravadoras (codigo, nome) VALUES
(1, 'Polygram'),
(2, 'EMI'),
(3, 'Som Livre'),
(4, 'Sony Music');
 
INSERT INTO categorias (codigo, nome) VALUES
(1, 'MPB'),
(2, 'Trilha Sonora'),
(3, 'Rock Internacional'),
(4, 'Rock Nacional');
 
INSERT INTO estados (sigla, nome) VALUES
('SP', 'São Paulo'),
('MG', 'Minas Gerais'),
('RJ', 'Rio de Janeiro');
 
INSERT INTO cidades (codigo, estado, nome) VALUES
(1, 'SP', 'São Paulo'),
(2, 'SP', 'Sorocaba'),
(3, 'SP', 'Jundiaí'),
(4, 'SP', 'Americana'),
(5, 'SP', 'Araraquara'),
(6, 'MG', 'Ouro Preto'),
(7, 'SP', 'Cachoeiro de Itapemirim');
 
INSERT INTO clientes (codigo, cidade, nome, endereco, renda, sexo) VALUES
(1, 1, 'José Nogueira', 'Rua A', 1500.00, 'm'),
(2, 1, 'Angelo Pereira', 'Rua B', 2000.00, 'm'),
(3, 1, 'Além Mar paranhos', 'Rua C', 1500.00, 'f'),
(4, 1, 'Catarina Souza', 'Rua D', 892.00, 'f'),
(5, 1, 'Vagner Costa', 'Rua E', 950.00, 'm'),
(6, 2, 'Antenor da Costa', 'Rua F', 1582.00, 'm'),
(7, 2, 'Maria Amélia de Sousa', 'Rua G', 1152.00, 'f'),
(8, 2, 'Paulo Roberto Silva', 'Rua H', 3250.00, 'm'),
(9, 3, 'Fátima Souza', 'Rua I', 1632.00, 'f'),
(10, 3, 'Joel da Rocha', 'Rua J', 2000.00, 'm');
 
INSERT INTO conjuges (cliente, nome, renda, sexo) VALUES
(1, 'Carla Nogueira', 2500.00, 'f'),
(2, 'Emília Pereira', 5500.00, 'f'),
(6, 'Altiva da Costa', 3000.00, 'f'),
(7, 'Carlos de Souza', 3250.00, 'm');
 
INSERT INTO funcionarios (codigo, nome, endereco, salario, sexo) VALUES
(1, 'Vânia Gabriela Pereira', 'Rua A', 2500.00, 'f'),
(2, 'Norberto Pereira da Silva', 'Rua B', 3000.00, 'm'),
(3, 'Olavio Linhares', 'Rua C', 5800.00, 'm'),
(4, 'Paula da Silva', 'Rua D', 3000.00, 'f'),
(5, 'Rolando Rocha', 'Rua E', 2000.00, 'm');
 
INSERT INTO dependentes (codigo, funcionario, nome, sexo) VALUES
(1, 1, 'Ana Pereira', 'f'),
(2, 1, 'Roberto Pereira', 'm'),
(3, 1, 'Celso Pereira', 'm'),
(4, 3, 'Brisa Linhares', 'f'),
(5, 3, 'Mari Sol Linhares', 'f'),
(6, 4, 'Sonia da Silva', 'f');
 
INSERT INTO titulos (codigo, categoria, gravadora, nome, valor, quantidade) VALUES
(1, 1, 1, 'Tribalista', 30.00, 1500),
(2, 1, 2, 'Tropicália', 50.00, 500),
(3, 1, 1, 'Aquele Abraço', 50.00, 600),
(4, 1, 2, 'Refazenda', 60.00, 1000),
(5, 1, 3, 'Totalmente demais', 50.00, 2000),
(6, 1, 3, 'Travessia', 55.00, 500),
(7, 1, 2, 'Courage', 30.00, 200),
(8, 4, 3, 'Legião Urbana', 20.00, 100),
(9, 3, 2, 'The Beatles', 30.00, 300),
(10, 4, 1, 'Rita Lee', 30.00, 500);
 
INSERT INTO pedidos (numero, cliente, funcionario, data_pedido, valor) VALUES
(1, 1, 2, '2022-02-02', 1500.00),
(2, 3, 4, '2022-05-02', 50.00),
(3, 4, 3, '2022-06-02', 100.00),
(4, 1, 4, '2023-02-02', 200.00),
(5, 7, 5, '2023-03-02', 300.00),
(6, 4, 4, '2023-03-02', 100.00),
(7, 5, 5, '2023-03-02', 50.00),
(8, 8, 2, '2023-03-02', 50.00),
(9, 2, 2, '2023-03-02', 2000.00),
(10, 7, 1, '2023-03-02', 3000.00);
 
INSERT INTO titulos_artistas (titulo, artista) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 2),
(5, 3),
(6, 4),
(7, 4),
(8, 5),
(9, 6),
(10, 7);
 
INSERT INTO titulos_pedidos (pedido, titulo, quantidade, valor) VALUES
(1, 1, 2, 30.00),
(1, 2, 3, 20.00),
(2, 1, 1, 50.00),
(2, 2, 3, 30.00),
(3, 1, 2, 40.00),
(4, 2, 3, 20.00),
(5, 1, 2, 25.00),
(6, 2, 3, 30.00),
(7, 4, 2, 55.00),
(8, 1, 4, 60.00),
(9, 2, 3, 15.00),
(10, 7, 2, 15.00);

SELECT * FROM artistas;

SELECT * FROM gravadoras;

SELECT * FROM categorias;

SELECT * FROM estados;

SELECT * FROM cidades;

SELECT * FROM clientes;

SELECT * FROM conjuges;

SELECT * FROM funcionarios;

SELECT * FROM dependentes;

SELECT * FROM titulos;

SELECT * FROM pedidos;

SELECT * FROM titulos_pedidos;

SELECT * FROM titulos_artistas;