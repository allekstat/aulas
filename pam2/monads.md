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
