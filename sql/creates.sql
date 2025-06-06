DROP DATABASE IF EXISTS alexsander;
CREATE DATABASE alexsander;
USE alexsander;

CREATE TABLE autores ( -- id, nome
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(30) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE gravadoras ( -- id, nome
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(30) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE dvds ( -- id, nome, titulo, valor, quantidade, categoria, gravadora
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(30) NOT NULL,
  titulo VARCHAR(100) NOT NULL,
  valor DECIMAL(6,2) NOT NULL,
  quantidade INTEGER UNSIGNED NOT NULL,
  categoria VARCHAR(30) NOT NULL,
  gravadora INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(id),
  INDEX dvd_FKIndex1(gravadora)
);

CREATE TABLE dvd_tem_autor ( -- dvd, autor
  dvd INTEGER UNSIGNED NOT NULL,
  autor INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(dvd, autor),
  INDEX dvd_has_autor_FKIndex1(dvd),
  INDEX dvd_has_autor_FKIndex2(autor)
);

CREATE TABLE enderecos ( -- id, estado, cidade, logradouro
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  estado VARCHAR(30) NOT NULL,
  cidade VARCHAR(30) NOT NULL,
  logradouro VARCHAR(30) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE clientes ( -- id, nome, sexo, renda, estado-civil, endereco
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(60) NOT NULL,
  sexo VARCHAR(30) NOT NULL,
  renda DECIMAL(8,2) NULL,
  estado_civil VARCHAR(30) NOT NULL,
  endereco INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(id),
  INDEX cliente_FKIndex1(endereco)
);

CREATE TABLE conjuges ( -- id, nome, renda, sexo, cliente
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(60) NOT NULL,
  renda DECIMAL(8,2) NULL,
  sexo VARCHAR(30) NOT NULL,
  cliente INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(id),
  INDEX conjuge_FKIndex1(cliente)
);

CREATE TABLE funcionarios ( -- id, nome, sexo, salario, endereco
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(30) NOT NULL,
  sexo VARCHAR(30) NOT NULL,
  salario DECIMAL(8,2) NOT NULL,
  endereco INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(id),
  INDEX funcionario_FKIndex1(endereco)
);

CREATE TABLE dependentes ( -- id, nome, sexo, tipo, funcionario
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(60) NOT NULL,
  sexo VARCHAR(30) NOT NULL,
  tipo VARCHAR(30) NOT NULL,
  funcionario INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(id),
  INDEX dependente_FKIndex1(funcionario)
);

CREATE TABLE pedidos ( -- id, cliente, dvd
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  cliente INTEGER UNSIGNED NULL,
  dvd INTEGER UNSIGNED NULL,
  PRIMARY KEY(id),
  INDEX pedido_FKIndex1(dvd),
  INDEX pedido_FKIndex2(cliente)
);


