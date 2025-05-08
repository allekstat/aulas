CREATE TABLE colaboradores (
codigo INT NOT NULL,
nome VARCHAR(40) NOT NULL,
rg VARCHAR(15) NOT NULL,
sexo CHAR(1) NOT NULL,
salario DECIMAL(10,2) NULL DEFAULT 1000,
CONSTRAINT c_pk PRIMARY KEY (codigo),
CONSTRAINT c_uq UNIQUE (rg),
CONSTRAINT c_ck_sx CHECK (sexo IN ('m', 'f')),
CONSTRAINT c_ck_sl CHECK (salario > 0)
);

CREATE TABLE dependentes (
codigo INT NOT NULL PRIMARY KEY,
dependente INT NOT NULL,
nome VARCHAR(40) NOT NULL,
nascimento DATE NOT NULL,
sexo CHAR(1) NOT NULL,
parentesco VARCHAR(20) NOT NULL,
CONSTRAINT d_fk FOREIGN KEY (dependente) REFERENCES colaboradores (codigo),
CONSTRAINT d_ck_sx CHECK (sexo IN ('m', 'f'))
);
