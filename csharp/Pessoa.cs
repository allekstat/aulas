class Pessoa
{
    public string Nome;
    public int Idade;
    public string Cpf;
    public string Rg;
    public string Cnh;
    public double Peso;
    public double Altura;
    public string Etnia;
    public string Estado_civil;
    public string Profissao;
    public string Nacionalidade;

    public double MetrosPorSegundo;
    public double LitrosDeArNoPulmao;
    public double IdadeDoArNoPulmao;
    public void Andar() { MetrosPorSegundo = 1.2; }
    public void Correr() { MetrosPorSegundo = 6.5; }
    public void Parar() { MetrosPorSegundo = 0; }
    public void Inspirar() { LitrosDeArNoPulmao += 0.1; }
    public void Espirar() { LitrosDeArNoPulmao *= 0.9; }
    public void Respirar()
    {
        if (LitrosDeArNoPulmao < 1.4 && IdadeDoArNoPulmao < 1.8)
        {
            Inspirar();
            IdadeDoArNoPulmao += 0.2;
        }
        else if (LitrosDeArNoPulmao > 0.15)
        {
            Espirar();
            IdadeDoArNoPulmao += 0.2;
        }
        else
        {
            IdadeDoArNoPulmao += 0.2;
        }
    }

    public void Falar() { Espirar(); }
}