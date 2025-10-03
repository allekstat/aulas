### migrations

#### o que são

são versionamentos de arquivos de imagens do banco de dados, igual ao versionamento do código fonte de um projeto.

são scripts php pra automatizar a manutenção de tabelas de um banco de dados. criando, alterando, inserindo, removendo e configurando.

- criar uma migração

```bash
php artisan make:migration nome_da_migracao
```

```php
public function subir()
{
    Schema::create('usuarios', function (Blueprint $tabela)
    {
        $tabela -> id();
        $tabela -> string('nome');
        $tabela -> string('email') -> unique();
        $tabela -> timestamps();
    });
}

public function tirar()
{
    Schema::dropIfExists('usuarios');
}
```

```bash
php artisan migrate
```

```bash
php artisan migrate:rollback
```

```bash
php artisan migrate:reset
```
