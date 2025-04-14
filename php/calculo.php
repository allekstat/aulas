<?php
require "Pessoa.php";

$nova_pessoa = new Pessoa();
$nova_pessoa->nome = $_POST['nome'];
$nova_pessoa->idade = $_POST['idade'];
$nova_pessoa->peso = $_POST['peso'];
$nova_pessoa->altura = $_POST['altura'];

echo $nova_pessoa->calcular_imc();