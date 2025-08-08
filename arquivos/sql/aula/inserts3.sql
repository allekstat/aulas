INSERT INTO clientes VALUES
(1,'Alexandre da Silva', 'Rua Direita,25','3288-8799','ale@gratis.com.br'),
(2,'Ana Claudia da Silva', 'Rua São Bento,89','6524-7788','ana@gratis.com.br'),
(3,'Bruno da Silva','Rua 7 de Abril, 100','8989-8887','bruno@gratis.com.br'),
(4,'Debora da Silva','Av. Paulista,1009','3123-1116','debora@gratis.com.br'),
(5,'Tatiane da Silva','Al.Santos, 12','5558-5777','taiane@gratis.com.br');

INSERT INTO treinamento VALUES
(1,'Excel',720),
(2,'Word',480),
(3,'PowerPoint',480);

INSERT INTO clientes VALUES
(6,'Tatiane da Silva','Al Jau,38','8787-6676','tati@gratis.com.br');

INSERT INTO funcionarios VALUES
(1,'Alexandre da Silva','Rua Direita,25','3288-8799','ale@gratis.com.br',1200.00,'20/07/05'),
(2,'Ana Claudia da Silva', 'Rua São Bento,89','6524-7788','ana@gratis.com.br',920.00,'24/07/05'),
(3,'Bruno da Silva','Rua 7 de Abril, 100','8989-8887','bruno@gratis.com.br',1400,'21/05/08'),
(4,'Debora da Silva','Av. Paulista,1009','3123-1116','debora@gratis.com.br',900.00,'18/08/05'),
(5,'Tatiane da Silva','Al.Santos, 12','5558-5777','taiane@gratis.com.br',1800.00,'17/08/28'),
(6,'Tatiane da Silva','Al Jau,38','8787-6676','tati@gratis.com.br',1200.00,'17/08/28');

INSERT INTO empregados VALUES
(10, 'Jailton Pires', '1985/03/09'),
(11, 'Matheus dos Santos', '1998/04/07'),
(12,'Zumira Alburquerque', '2000/12/10');

INSERT INTO produtos VALUES
(1,'Impressora','Informática',200,600.00),
(2,'Câmera Digital','Digitais',300,400.00),
(3,'DVD Player', 'Eletrônicos',250,500.00),
(4,'Monitor','informática',400,900.00),
(5,'Televisor','Eletrômico',350,650.00),
(6,'Filmadora Digital','Digitais',500,700.00),
(7,'Celular','Telefone',450,850.00),
(8,'Teclador','Informática',200,450.00),
(9,'Tablet','Informática',200,900.00),
(10,'Mouse','Informática',400,60.00);

INSERT funcionarios
SELECT cod_emp, nome_emp, 'não tem endereço','0000-0000','Não tem e-mail', 0, data_emp FROM empregados;

SELECT * FROM funcionarios;
