using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aula25032025
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Aluno a1 = new Aluno();
            a1.nome = "Alexsander";
            a1.mostraNome();
            a1.rm = 13375;
            a1.curso = "Desenvolvimento";
            a1.periodo = "Noturno";
            a1.mostraDados();
            Professor pf1 = new Professor();
            pf1.nome = "Jeferson";
            pf1.mostraNome();
            pf1.salario = 1050;
            pf1.mostraSalario();
        }
    }
}
