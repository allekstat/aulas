<?php

include 'cabecalho.php';

require 'Pessoa.php';

$pessoa = new Pessoa();
$pessoa->nome = $_POST['nome'];
$pessoa->idade = $_POST['idade'];
$pessoa->peso = $_POST['peso'];
$pessoa->altura = $_POST['altura'];
$pessoa->calcular_imc();
$pessoa->condicao_imc();

$classificacao = $pessoa->classificar_imc();

$icone = $pessoa->icone_imc();

echo "<div class='border border-light-subtle rounded p-3 text-center container bg-$icone-subtle'>";

echo "$pessoa->nome, com $pessoa->idade anos, pesando $pessoa->peso (kg) e com altura de $pessoa->altura (m) está na condição $classificacao com o imc valendo $pessoa->imc";

echo '</div>';
include 'rodape.php';
