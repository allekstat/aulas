DROP DATABASE IF EXISTS alexsander;
CREATE DATABASE alexsander;
USE alexsander;
CREATE TABLE cargos (
	codigo INT UNSIGNED NOT NULL AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	CONSTRAINT pk_cargo PRIMARY KEY (codigo),
	CONSTRAINT uq_nome UNIQUE (nome)
);
CREATE TABLE funcionarios (
	codigo INT UNSIGNED NOT NULL AUTO_INCREMENT,
	cargo INT UNSIGNED NOT NULL,
	nome VARCHAR(100) NOT NULL,
	salario DECIMAL(10, 2) NOT NULL,
	rg VARCHAR(100) NOT NULL,
	CONSTRAINT pk_funcionario PRIMARY KEY (codigo),
	CONSTRAINT fk_cargo FOREIGN KEY (cargo) REFERENCES cargos (codigo)
);
INSERT INTO cargos VALUES
(1, 'Presidente'),
(2, 'Gerente'),
(3, 'Supervisor'),
(4, 'Revisor'),
(5, 'Redator');
INSERT INTO funcionarios VALUES
(1, 5, 'Luiz Pereira', 3000, '27.291.905'),
(2, 5, 'Antonio Almeida', 3000, '15.970.247'),
(3, 3, 'Donizete Ribeiro', 2800, '27.151.908'),
(4, 3, 'Gabriela Moura', 4700, '255.279.145'),
(5, 2, 'Emilio Duarte', 5000, '17.278.246'),
(6, 1, 'Carolina Ferreira', 9000, '18.154.578');
# lista os funcionarios
SELECT f.nome AS funcionario, c.nome AS cargo FROM funcionarios f LEFT JOIN cargos c ON f.cargo = c.codigo;
# lista contagem de funcionarios em cada cargo
SELECT COUNT(f.codigo) AS 'numero de funcionarios', c.nome AS cargo FROM funcionarios f RIGHT JOIN cargos c ON f.cargo = c.codigo GROUP BY c.codigo;
# codigo com inner join
SELECT cargos.nome, funcionarios.nome FROM cargos INNER JOIN funcionarios ON funcionarios.cargo = cargos.codigo;
# codigo com where
SELECT cargos.nome, funcionarios.nome FROM cargos, funcionarios WHERE funcionarios.cargo = cargos.codigo;