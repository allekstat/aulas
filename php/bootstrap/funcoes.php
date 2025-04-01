<?php

function verificar(&$n1, &$n2, &$operacao, &$simbolo, &$resultado, &$erro)
{
 if (isset($_POST["numero1"]) and isset($_POST["numero2"]) and isset($_POST["operacao"])) {
  $n1 = (float) $_POST["numero1"];
  $n2 = (float) $_POST["numero2"];
  $operacao =   $_POST["operacao"];
 } else {
  $n1 = 0;
  $n2 = 0;
  $operacao = 0;
 }

 $resultado = 0;
 $simbolo = "";
 $erro = "";
}

function adicao($x, $y)
{
 return $x + $y;
}

function subtracao($x, $y)
{
 return $x - $y;
}

function multiplicacao($x, $y)
{
 return $x * $y;
}

function divisao($x, $y, &$erro)
{
 if ($y != 0) return $x / $y;
 else $erro = "erro 1";
}

function saida($n1, $n2, $simbolo, $resultado, $erro)
{
 if ($erro == "erro 1") return "$n1 $simbolo $n1 é indefinido";
 else if ($erro == "...") return "...";
 else return "$n1 $simbolo $n2 = $resultado";
}

function conta($n1, $n2, $operacao, &$simbolo, &$resultado, &$erro)
{
 switch ($operacao) {
  case "adicao":
   $simbolo = "+";
   $resultado = adicao($n1, $n2);
   break;

  case "subtracao":
   $simbolo = "-";
   $resultado = subtracao($n1, $n2);
   break;

  case "multiplicacao":
   $simbolo = "×";
   $resultado = multiplicacao($n1, $n2);
   break;

  case "divisao":
   $simbolo = "÷";
   $resultado = divisao($n1, $n2, $erro);
   break;

  default:
   $erro = "...";
   break;
 }
 return saida($n1, $n2, $simbolo, $resultado, $erro);
}
