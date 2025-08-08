DROP DATABASE IF EXISTS alexsander;
CREATE DATABASE alexsander;
USE alexsander;
CREATE TABLE cargos (
	codigo INT UNSIGNED,
	nome VARCHAR(100),
	CONSTRAINT pk_cargo PRIMARY KEY (codigo),
	CONSTRAINT uq_nome UNIQUE (nome)
);
CREATE TABLE funcionarios (
	codigo INT UNSIGNED,
	cargo INT UNSIGNED,
	nome VARCHAR(100),
	salario DECIMAL(10, 2),
	rg VARCHAR(100),
	CONSTRAINT pk_funcionario PRIMARY KEY (codigo),
	CONSTRAINT fk_cargo FOREIGN KEY (cargo) REFERENCES cargos (codigo)
);
CREATE TABLE dependentes (
	codigo INT UNSIGNED,
	funcionario INT UNSIGNED,
	nome VARCHAR(100),
	CONSTRAINT pk_dependente PRIMARY KEY (codigo),
	CONSTRAINT fk_funcionario FOREIGN KEY (funcionario) REFERENCES funcionarios (codigo)
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
(6, 1, 'Carolina Ferreira', 9000, '18.154.578'),
(7, NULL, 'Jefferson Carvalho', 2000.00, '15.754.159');
INSERT INTO dependentes VALUES
(1, 1, 'Mariana Leme'),
(2, 1, 'Camila Leme'),
(3, 1, 'Josival Leme'),
(4, 2, 'Clovis Almeida'),
(5, 2, 'Durval Almeida'),
(6, 5, 'Fabiana Duarte'),
(7, 5, 'Joana Duarte');
# lista os funcionarios
SELECT f.nome AS funcionario, c.nome AS cargo FROM funcionarios f JOIN cargos c ON f.cargo = c.codigo;
# lista contagem de funcionarios em cada cargo
SELECT c.nome AS cargo, COUNT(f.codigo) AS 'numero de funcionarios' FROM funcionarios f RIGHT JOIN cargos c ON f.cargo = c.codigo GROUP BY c.codigo;
# codigo com inner join
SELECT cargos.nome AS cargo, funcionarios.nome AS funcionario FROM cargos RIGHT JOIN funcionarios ON funcionarios.cargo = cargos.codigo;
# codigo com where
SELECT cargos.nome, funcionarios.nome FROM cargos, funcionarios WHERE funcionarios.cargo < cargos.codigo;
# lista dependentes dos funcionarios
SELECT d.nome AS dependente, f.nome AS funcionario FROM funcionarios f LEFT JOIN dependentes d ON d.funcionario = f.codigo;
# lista funcionarios, cargos e seus dependentes
SELECT f.nome AS funcionario, c.nome AS cargo, d.nome AS dependentes FROM funcionarios f LEFT JOIN cargos c ON c.codigo = f.cargo INNER JOIN dependentes d ON d.funcionario = f.codigo