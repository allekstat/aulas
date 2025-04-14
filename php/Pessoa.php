<?php
class Pessoa
{
 public $nome;
 public $idade;
 public $peso;
 public $altura;

 public function calcular_imc()
 {
  $imc = $this->peso / ($this->altura * $this->altura);
  if ($imc < 18.5) $condicao = 1;
  elseif ($imc < 25)  $condicao = 2;
  elseif ($imc < 30)  $condicao = 3;
  elseif ($imc < 35)  $condicao = 4;
  elseif ($imc < 40)  $condicao = 5;
  else $condicao = 6;
  switch ($condicao)
  {
    case 1:
        return "Abaixo do peso."; 
    case 2:
        return "Peso normal."; 
    case 3:
        return "Acima do peso."; 
    case 4:
        return "Obesidade grau 1."; 
    case 5:
        return "Obesidade grau 2."; 
    case 6:
        return "Obesidade grau 3."; 
  }
 }
}