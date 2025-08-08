CREATE DATABASE DB_CDs;

USE DB_CDs;

CREATE TABLE artistas (
   codigo INT NOT NULL AUTO_INCREMENT,
   nome VARCHAR(100) NOT NULL,
   CONSTRAINT pk_artista PRIMARY KEY (codigo),
   CONSTRAINT uq_nome UNIQUE (nome)
);

CREATE TABLE gravadoras (
   codigo INT NOT NULL AUTO_INCREMENT,
   nome VARCHAR(50) NOT NULL,
   CONSTRAINT pk_gravadora PRIMARY KEY (codigo),
   CONSTRAINT uq_nome UNIQUE (nome)
);

CREATE TABLE categorias (
   codigo INT NOT NULL AUTO_INCREMENT,
   nome VARCHAR(100) NOT NULL,
   CONSTRAINT pk_categoria PRIMARY KEY (codigo),
   CONSTRAINT uq_nome UNIQUE (nome)
);

CREATE TABLE estados (
   sigla CHAR(2) NOT NULL,
   nome VARCHAR(100) NOT NULL,
   CONSTRAINT pk_estado PRIMARY KEY (sigla),
   CONSTRAINT uq_nome UNIQUE (nome)
);

CREATE TABLE cidades (
   codigo INT NOT NULL AUTO_INCREMENT,
   estado CHAR(2) NOT NULL,
   nome VARCHAR(100) NOT NULL,
   CONSTRAINT pk_cidade PRIMARY KEY (codigo),
   CONSTRAINT fk_estado FOREIGN KEY (estado) REFERENCES estados (sigla)
);

CREATE TABLE clientes (
   codigo INT NOT NULL AUTO_INCREMENT,
   cidade INT NOT NULL,
   nome VARCHAR(100) NOT NULL,
   endereco VARCHAR(200) NOT NULL,
   renda DECIMAL(10, 2) NOT NULL,
   sexo CHAR(1) NOT NULL,
   CONSTRAINT pk_cliente PRIMARY KEY (codigo),
   CONSTRAINT fk_cidade FOREIGN KEY (cidade) REFERENCES cidades (codigo),
   CONSTRAINT ck_renda CHECK (renda >= 0),
   CONSTRAINT ck_sexo CHECK (sexo IN ('m', 'f'))
);

CREATE TABLE conjuges (
   codigo INT NOT NULL AUTO_INCREMENT,
   cliente INT NOT NULL,
   nome VARCHAR(100) NOT NULL,
   renda DECIMAL(10, 2) NOT NULL,
   sexo CHAR(1) NOT NULL,
   CONSTRAINT pk_conjuge PRIMARY KEY (cliente),
   CONSTRAINT fk_cliente FOREIGN KEY (cliente) REFERENCES clientes (codigo),
   CONSTRAINT ck_renda CHECK (renda >= 0),
   CONSTRAINT ck_sexo CHECK (sexo IN ('m', 'f'))
);

CREATE TABLE funcionarios (
   codigo INT NOT NULL,
   nome VARCHAR(100) NOT NULL,
   endereco VARCHAR(200) NOT NULL,
   salario DECIMAL(10, 2) NOT NULL,
   sexo CHAR(1) NOT NULL,
   CONSTRAINT pk_funcionario PRIMARY KEY (codigo),
   CONSTRAINT ck_salario CHECK (salario >= 0),
   CONSTRAINT ck_sexo CHECK (sexo IN ('m', 'f'))
);

CREATE TABLE dependentes (
   codigo INT NOT NULL AUTO_INCREMENT,
   funcionario INT NOT NULL,
   nome VARCHAR(100) NOT NULL,
   sexo CHAR(1) NOT NULL,
   CONSTRAINT pk_dependente PRIMARY KEY (codigo),
   CONSTRAINT fk_funcionario FOREIGN KEY (funcionario) REFERENCES funcionarios (codigo),
   CONSTRAINT ck_sexo CHECK (sexo IN ('m', 'f'))
);

CREATE TABLE titulos (
   codigo INT NOT NULL AUTO_INCREMENT,
   categoria INT NOT NULL,
   gravadora INT NOT NULL,
   nome VARCHAR(100) NOT NULL,
   valor DECIMAL(10, 2) NOT NULL,
   quantidade INT NOT NULL,
   CONSTRAINT pk_titulo PRIMARY KEY (codigo),
   CONSTRAINT fk_categoria FOREIGN KEY (categoria) REFERENCES categorias (codigo),
   CONSTRAINT fk_gravadora FOREIGN KEY (gravadora) REFERENCES gravadoras (codigo),
   CONSTRAINT uq_nome_titulo UNIQUE (nome),
   CONSTRAINT ck_valor CHECK (valor > 0),
   CONSTRAINT ck_quantidade CHECK (quantidade >= 0)
);

CREATE TABLE pedidos (
   numero INT NOT NULL AUTO_INCREMENT,
   cliente INT NOT NULL,
   funcionario INT NOT NULL,
   data_pedido DATETIME NOT NULL,
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
   CONSTRAINT fk_pedido FOREIGN KEY (pedido) REFERENCES pedidos (numero),
   CONSTRAINT fk_titulo_pedido FOREIGN KEY (titulo) REFERENCES titulos (codigo),
   CONSTRAINT ck_quantidade_pedido CHECK (quantidade >= 1),
   CONSTRAINT ck_valor_titulo CHECK (valor > 0)
);

CREATE TABLE titulos_artistas (
   titulo INT NOT NULL,
   artista INT NOT NULL,
   CONSTRAINT pk_titulo_artista PRIMARY KEY (titulo, artista),
   CONSTRAINT fk_titulo_artista FOREIGN KEY (titulo) REFERENCES titulos (codigo),
   CONSTRAINT fk_artista_titulo FOREIGN KEY (artista) REFERENCES artistas (codigo)
);