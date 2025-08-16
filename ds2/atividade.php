<?php

class Escola
{
    private $nome;
    private $endereco;
    private $diretor;
    private $alunos = array();
    private $professores = array();
    private $turmas = array();

    public function __construct($nome, $endereco, $diretor) {
        $this->nome = $nome;
        $this->endereco = $endereco;
        $this->diretor = $diretor;
    }

    public function addAluno($aluno) {
        $this->alunos[] = $aluno;
    }

    public function delAluno($aluno) {
        if (($posicao = array_search($aluno, $this->alunos)) !== false) {
            unset($this->alunos[$posicao]);
        }
    }

    public function showAluno() {
        foreach($this->alunos as $aluno) {
            echo $aluno . "\n";
        }
    }

    public function addProfessor($professor) {
        $this->professores[] = $professor;
    }

    public function delProfessor($professor) {
        if (($posicao = array_search($professor, $this->professores)) !== false) 
        {
            unset($this->professores[$posicao]);
        }
    }

    public function showProfessor() {
        foreach($this->professores as $professor) {
            echo $professor . "\n";
        }
    }

    public function addTurma($nomeTurma) {
        $this->turmas[$nomeTurma] = array();
    }

    public function addAlunoToTurma($nomeTurma, $aluno) {
        $this->turmas[$nomeTurma][] = $aluno;
    }

    public function showTurmas() {
        foreach ($this->turmas as $nomeTurma => $alunos) {
            echo "Turma: " . $nomeTurma . "\n";
            foreach ($alunos as $aluno) 
            {
                echo " - " . $aluno . "\n";
            }
        }
    }

    public function transA($x, $tO, $tD) {
        if (($k = array_search($x, $this->t[$tO])) !== false) {
            unset($this->t[$tO][$k]);
            $this->t[$tD][] = $x;
        }
    }

    public function avgG($ns) {
        return array_sum($ns) / count($ns);
    }

    public function showE() {
        echo "Nome: " . $this->n . "\nEndereço: " . $this->e . "\nDiretor: " . $this->d . "\nAlunos: " . count($this->a) . "\nProfessores: " . count($this->p) . "\n";
    }

    public function updE($e) {
        $this->e = $e;
    }

    public function getN() {
        return $this->n;
    }

    public function getD() {
        return $this->d;
    }

    public function setD($d) {
        $this->d = $d;
    }

    public function countA() {
        return count($this->a);
    }

    public function countP() {
        return count($this->p);
    }

    public function countT() {
        return count($this->t);
    }

    public function avgT($tN, $ns) {
        return array_sum($ns) / count($ns);
    }
}
