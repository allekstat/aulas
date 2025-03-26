UPDATE produtos
SET Val_prod = Val_prod * 1.1
WHERE tipo_prod = "Informática";
select * from produtos;

UPDATE produtos
SET Qtd_prod = Qtd_prod + 50
WHERE Qtd_prod <= 300;
select * from produtos;