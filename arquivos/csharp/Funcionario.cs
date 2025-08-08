using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aula25032025
{
    internal class Funcionario : Pessoa
    {
        public float salario;
        public string cargo;
        public void mostraSalario()
        {
            Console.WriteLine("Salário:" + salario);
        }
    }
}
