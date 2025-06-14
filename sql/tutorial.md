> tutorial de sql básico pra pessoas tipo o rômulo
> feito já com pensamento investigativo educacional
> atualizado em 14/06/2025 às 13:19

# primeiros comandos

## SELECT

o select traz dados, de alguma tabela ou de alguma outra coisa que provê dados, como uma função pra mostrar que horas são por exemplo.

### estrutura

a estrutura do select é basicamente

`SELECT colunas FROM tabela`

### usando

eu tenho uma tabela e estou trazendo os dados dessa tabela das colunas que eu especifiquei

você pode trazer tudo

`SELECT * FROM tabela`

ou trazer apenas aquilo que você quer

`SELECT coluna1, coluna2, coluna3 FROM tabela`

uma busca em uma tabela que contém pessoas

`SELECT nome, idade, sexo, endereco FROM clientes`

os dados que você vai receber se parecem com isso

```
+---------------------------------+
|  nome | idade | sexo | endereco |
+---------------------------------+
|  joao |    20 |    m |  rua abc |
| maria |    26 |    f |    rua 5 |
+---------------------------------+
```

## WHERE

o where serve pra filtrar os os resultados e mostrar só os dados quem se encaixam nas condições que você escrever

### estrutura

`SELECT colunas FROM tabela WHERE condicoes`

### usando

vamos pegar os alunos e suas notas em uma avaliação aí

`SELECT aluno, nota FROM avaliacoes`

```
+----------------+
|   aluno | nota |
+----------------+
|    joao |    7 |
|   maria |    8 |
|   pedro |    3 |
| claudio |    9 |
|  welson |    4 |
|    enzo |    5 |
+----------------+
```

agora filtrando só os que estão de recuperação

`SELECT aluno, nota FROM avaliacoes WHERE nota < 5`

esses são os de recuperação

```
+---------------+
|  aluno | nota |
+---------------+
|  pedro |    3 |
| welson |    4 |
+---------------+
```

os outros não apareceram porque não atendem à condição nota < 5

você pode colocar mais condições

`SELECT aluno, nota FROM avaliacoes WHERE nota > 4 AND nota < 7`

eu usei a palavra AND pra determinar que as condições nota > 4 e nota < 7 têm que ser verdadeiras pra que o aluno possa aparecer nos resultados

```
+--------------+
| aluno | nota |
+--------------+
|  enzo |    5 |
+--------------+
```

só o enzo que se encaixa nessas condições
