using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aula25032025
{
    internal class Aluno : Pessoa
    {
        public int rm;
        public string curso;
        public string periodo;
        public void mostraDados()
        {
            Console.WriteLine("RM:" + rm);
            Console.WriteLine("Curso:" + curso);
            Console.WriteLine("Período:" + periodo);
        }
    }
}
