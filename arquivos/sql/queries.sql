/*
SELECT * FROM autores;
SELECT * FROM gravadoras;
SELECT * FROM dvds;
SELECT * FROM dvd_tem_autor;
SELECT * FROM enderecos;
SELECT * FROM clientes;
SELECT * FROM conjuges;
SELECT * FROM funcionarios;
SELECT * FROM dependentes;
SELECT * FROM pedidos;
*/

-- SELECT clientes.nome AS CLIENTE, dvds.titulo AS DVD FROM pedidos JOIN clientes ON pedidos.cliente = clientes.id JOIN dvds ON pedidos.dvd = dvds.id ORDER BY pedidos.dvd;

 /*
DROP PROCEDURE IF EXISTS GetCliente;
CREATE PROCEDURE GetCliente (IN id INT) BEGIN
DELIMITER ;;
SELECT clientes.id AS ID, clientes.nome AS NOME, clientes.sexo AS SEXO, clientes.renda AS RENDA, clientes.estado_civil AS ESTADO_CIVIL, enderecos.estado AS ESTADO, enderecos.cidade AS CIDADE, enderecos.logradouro AS LOGRADOURO FROM clientes JOIN enderecos ON clientes.endereco = enderecos.id WHERE clientes.id = id;
END;

CALL GetCliente(5);
*/