using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aula25032025
{
    internal class Pessoa
    {
        public string nome;
        public string email;
        public int idade;
        public string cpf;
        public void mostraNome()
        {
            Console.WriteLine("Nome:" + nome);
        }
    }
}
