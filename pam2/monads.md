### monad either

um teste em que o resultado tem dois valores possíveis: tipo da esquerda (left), ou da direita (right). geralmente o da esquerda é para erros e o da direita é para sucessos.

```javascript
class Left
{
    constructor(value)
    {
        this.value = value;
    }
    map(f)
    {
        return this;
    }
    chain(f)
    {
        return this;
    }
    getOrElse(defaultValue)
    {
        return defaultValue;
    }
}

class Right
{
    constructor(value)
    {
        this.value = value;
    }
    map(f)
    {
        return new Right(f(this.value));
    }
    chain(f)
    {
        return f(this.value);
    }
    getOrElse(defaultValue)
    {
        return this.value;
    }
}
```
