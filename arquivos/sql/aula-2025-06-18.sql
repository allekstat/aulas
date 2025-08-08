# exepmlo 1
select cod_cli as cod_pes,
    'cliente' as tipo_pes,
    nome_cli as nome_pes,
    sexo_cli as sexo_pes,
    salario_cli as sal_pes
from cliente
    union all
select cod_prof,
    'professor',
    nome_prof,
    'nd',
    salario_prof
from professor
    union all
select cod_aluno,
    'aluno',
    nome_aluno,
    sexo_aluno,
    null
from aluno;

# exemplo 2
-- order by

# exemplo 3
-- subquery

# exemplo 4
select *
from cargo
where cod_cargo not in ( select cod_cargo from funcionario);
# usando join
select *
from cargo
    join funcionario on funcionario.cod

# exemplo 5
select *
from cargo
where cod_cargo in (select cod_cargo from funcionario)
order by cod_cargo;

# exemplo 6
# cargos dos funcionarios que tem dependentes
select *
from cargo
where cod_cargo in
(
    select cod_cargo
    from funcionario
    where cod_fun in
    (
        select cod_fun
        from dependente
    )
);
# usando join
select *
from cargo c
    left join funcionario f on f.cod_cargo = c.cod_cargo
    left join dependente d on d.cod_fun = f.cod_fun;

# usando sinal de =, max() e min()
# =, subquery e max
select *
from funcionario
where salario_func =
(
    select max(salario_func)
    from funcionario
);
# =, subquery e min
select *
from funcionario
where salario_func =
(
    select min(salario_func)
    from funcionario
);
# max()
select cod_fun, cod_cargo, nome_func, max(salario_func) as salario_func
from funcionario;
# min()
select min(salario_func)
from funcionario;
# com dependente
select *
from funcionario
where salario_func =
(
    select min(salario_func)
    from funcionario
    where cod_fun in
    (
        select cod_fun
        from dependente
    )
);
# buscar quantidade de dependentes de funcionarios
select *,
    (
        select count(*)
        from dependente
        where cod_fun = funcionario.cod_fun
    ) as qtd_dep
from funcionario;
# update subquery
update funcionario
set salario_func = salario_func * 1.1
where cod_fun not in
(
    select cod_fun
    from dependente
);
# delete subquery
delete from funcionario
where cod_fun not in
(
    select cod_fun
    from dependente
);