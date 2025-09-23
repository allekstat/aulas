### monad either

um teste em que o resultado tem dois valores possíveis: tipo da esquerda (left), ou da direita (right). geralmente o da esquerda é para erros e o da direita é para sucessos.

```javascript
class esquerda
{
    constructor(valor)
    {
        this.valor = valor;
    }
    mapear(funcao)
    {
        return this;
    }
    encadear(funcao)
    {
        return this;
    }
    valor_senao(valor_padrao)
    {
        return valor_padrao;
    }
}
class direita
{
    constructor(valor)
    {
        this.valor = valor;
    }
    mapear(funcao)
    {
        return new direita(funcao(this.valor));
    }
    encadear(funcao)
    {
        return funcao(this.valor);
    }
    valor_senao(valor_padrao)
    {
        return this.valor;
    }
}
```

### monad io

permite um encadeamento de execuções que retornam a entrada para o próximo método, uma recursão 'inline' de funções diferentes, uma pegando o output da chamada precedente e usando como input.

```javascript
class io
{
    constructor(efeito)
    {
        this.efeito = efeito;
    }
    rodar()
    {
        return this.efeito();
    }
    mapear(funcao)
    {
        return new io(() => funcao(this.rodar()));
    }
    encadear(funcao)
    {
        return new io(() => funcao(this.rodar()).rodar());
    }
}
```

### monad async

aparentemente é o próprio conceito de async do javascript, onde você tem os .then e os .catch, fazendo os encadeamentos de acordo com o retorno da execução de cada .then.

