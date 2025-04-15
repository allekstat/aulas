<?php
class Pessoa
{
    public $nome;
    public $idade;
    public $peso;
    public $altura;
    public $imc;
    public $condicao;

    public function calcular_imc()
    {
        $this->imc = $this->peso / ($this->altura * $this->altura);
    }
    public function condicao_imc()
    {
        if ($this->imc < 18.5) $this->condicao = 1;
        elseif ($this->imc < 25)  $this->condicao = 2;
        elseif ($this->imc < 30)  $this->condicao = 3;
        elseif ($this->imc < 35)  $this->condicao = 4;
        elseif ($this->imc < 40)  $this->condicao = 5;
        else $this->condicao = 6;
    }
    public function classificar_imc()
    {
        switch ($this->condicao) {
            case 1:
                return 'Abaixo do peso.';
            case 2:
                return 'Peso normal.';
            case 3:
                return 'Acima do peso.';
            case 4:
                return 'Obesidade grau 1.';
            case 5:
                return 'Obesidade grau 2.';
            case 6:
                return 'Obesidade grau 3.';
        }
    }
    public function icone_imc()
    {
        switch ($this->condicao) {
            case 1:
                return 'warning';
                break;
            case 2:
                return 'success';
                break;
            case 3:
                return 'warning';
                break;
            case 4:
                return 'danger';
                break;
            case 5:
                return 'danger';
                break;
            case 6:
                return 'danger';
                break;
        }
    }
}
