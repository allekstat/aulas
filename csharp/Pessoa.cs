class Pessoa
{
    public string Nome;
    public int Idade;
    public string Cpf;
    public string Rg;
    public string Cnh;
    public float Peso;
    public float Altura;
    public string Etnia;
    public string Estado_civil;
    public string Profissao;
    public string Nacionalidade;

    public float MetrosPorSegundo;
    public float LitrosDeArNoPulmao;
    public float IdadeDoArNoPulmão;
    public void Andar() { MetrosPorSegundo = 1.2; }
    public void Correr() { MetrosPorSegundo = 6.5; }
    public void Parar() { MetrosPorSegundo = 0; }
    public void Inspirar() { LitrosDeArNoPulmao += 0.1; }
    public void Espirar() { MetrosPorSegundo = 0; }
}
