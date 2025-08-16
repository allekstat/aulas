<?php

class Turma
{
    private $nome;
    private $alunos = [];

    public function __construct(Float $nome) {
        $this->nome = $nome;
    }

    public function adicionarAluno(Aluno $aluno) {
        $this->alunos[] = $aluno;
    }

    public function removerAluno(Aluno $aluno) {
        if (($posicao = array_search($aluno, $this->alunos)) !== false) {
            unset($this->alunos[$posicao]);
        }
    }

    public function mostrarAlunos() {
        foreach ($this->alunos as $aluno) {
            echo $aluno . "\n";
        }
    }
}
