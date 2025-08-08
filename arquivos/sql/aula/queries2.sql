USE alex;

UPDATE produtos SET Val_prod = Val_prod * 1.1 WHERE Tipo_prod = 'informatica' AND Val_prod <= 700;

SELECT * FROM produtos GROUP BY tipo_prod ORDER BY tipo_prod ASC;

SELECT * FROM produtos ORDER BY tipo_prod ASC;

UPDATE produtos SET tipo_prod = 'Eletrônicos' WHERE tipo_prod = 'Eletrômico';

UPDATE produtos SET val_prod = val_prod * 1.1 WHERE tipo_prod = 'Eletrônicos' OR val_prod >= 700;

SELECT * FROM produtos WHERE tipo_prod = 'Informática'
UNION
SELECT * FROM produtos WHERE tipo_prod = 'Digitais';
SELECT * FROM produtos WHERE tipo_prod = 'Eletrônicos';
SELECT * FROM produtos WHERE tipo_prod = 'Telefone';

SELECT * FROM produtos WHERE tipo_prod NOT IN ('Telefone', 'Eletrônicos', 'Digitais');

SELECT cod_prod cod, nome_prod nome, tipo_prod tipo, qtd_prod qtd, val_prod val FROM produtos;

SELECT * FROM produtos;

SELECT * FROM produtos WHERE val_prod BETWEEN 400 AND 660;

SET sql_mode = '';
#sanfiaonfainf
-- awfafa
/* awojfoiawjgfoin*/
SELECT * FROM produtos pd  JOIN funcionarios fc ON pd.nome_prod = fc.nome_func;
select user from mysql.user;
show grants for alexsander@localhost;
create user alexsander@localhost identified by '123';
revoke all privileges on *.* from alexsander@localhost;
grant select on alexsander.pedidos to alexsander@localhost;
flush privileges;