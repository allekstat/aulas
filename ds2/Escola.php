<?php

class Escola
{
    private $nome;
    private $endereco;
    private $diretor;
    private $professores = [];
    private $turmas = [];
    
    public function __construct(String $nome, String $endereco, String $diretor) {
        $this->nome = $nome;
        $this->endereco = $endereco;
        $this->diretor = $diretor;
    }
    public function mostarEscola() {
        $quantidadeAlunos = 0;

        foreach ($this->turmas as $turma) {
            foreach ($turma->alunos as $aluno) {
                $quantidadeAlunos++;
            }
        }

        $quantidadeProfessores = count($this->professores);
        echo "Nome: $this->nome\n
            Endereço: $this->endereco\n
            Diretor: $this->diretor\n
            Alunos: $quantidadeAlunos\n
            Professores: $quantidadeProfessores\n";
    }

    
    public function adicionarProfessor(Professor $professor) {
        $this->professores[] = $professor;
    }

    public function removerProfessor(Professor $professor) {
        if (($posicao = array_search($professor, $this->professores)) !== false) {
            unset($this->professores[$posicao]);
        }
    }

    public function mostrarProfessores() {
        foreach($this->professores as $professor) {
            echo $professor . '\n';
        }
    }

    public function adicionarTurma(Turma $turma) {
        $this->turmas[] = $turma;
    }

    public function removerTurma(Turma $turma) {
        if (($posicao = array_search($turma, $this->turmas)) !== false) {
            unset($this->turmas[$posicao]);
        }
    }

    public function mostrarTurmas() {
        foreach ($this->turmas as $turma) {
            foreach ($turma->alunos as $aluno) {
                echo 'Turma: ' . $turma->nome . '\n';
                echo ' - ' . $aluno . '\n';
            }
        }
    }

    public function transferirAluno(Aluno $aluno, Turma $turmaOrigem, Turma $turmaDestino) {
        if (($posicao = array_search($aluno, $turmaOrigem->alunos)) !== false) {
            unset($this->turmaOrigem[$posicao]);
            $turmaDestino[] = $aluno;
        }
    }

    public function atualizarEndereco(String $endereco) {
        $this->endereco = $endereco;
    }

    public function trazerNome() {
        return $this->nome;
    }

    public function trazerDiretor() {
        return $this->diretor;
    }

    public function definirDiretor(Diretor $diretor) {
        $this->diretor = $diretor;
    }

    public function contarAlunos() {
        $quantidadeAlunos = 0;
        foreach ($this->turmas as $turma) {
            $quantidadeAlunos += count($turma->alunos);
        }
    }

    public function contarProfessores() {
        return count($this->professores);
    }

    public function contarTurmas() {
        return count($this->turmas);
    }
}
