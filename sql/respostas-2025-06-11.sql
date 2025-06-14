# pergunta 1
update funcionarios 
  left join dependentes on funcionarios.codigo = dependentes.funcionario_codigo 
set funcionarios.salario = funcionarios.salario * 1.2
where dependentes.codigo is null;;



# pergunta 2
update funcionarios
  join dependentes on funcionarios.codigo = dependentes.funcionario_codigo 
set funcionarios.salario = funcionarios.salario * 1.1;



# pergunta 3
update clientes 
  left join conjuges on clientes.codigo = conjuges.cliente_codigo 
set clientes.renda = clientes.renda + 100
where conjuges.codigo is null;



# pergunta 4
update clientes 
  left join conjuges on clientes.codigo = conjuges.cliente_codigo
set clientes.renda = clientes.renda + 100
where clientes.sexo = 'f'
  and conjuges.codigo is null;



# pergunta 5
update clientes
  join pedidos on clientes.codigo = pedidos.cliente_codigo
set clientes.renda = clientes.renda + 200;



# pergunta 6
update pedidos
  join titulos_pedidos on pedidos.codigo = titulos_pedidos.pedido_codigo
set pedidos.valor = pedidos.valor * 0.9
where titulos_pedidos.titulo_codigo = 1;



# pergunta 7
update titulos
  left join titulos_pedidos on titulos.codigo = titulos_pedidos.titulo_codigo
set titulos.valor = titulos.valor * 0.9
where titulos_pedidos.titulo_codigo is null;



# pergunta 8
update funcionarios
  left join dependentes on funcionarios.codigo = dependentes.funcionario_codigo
set funcionarios.salario = funcionarios.salario * 1.2
where dependentes.codigo is null;
