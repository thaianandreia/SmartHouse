using System;
using System.Transactions;

namespace SmartHouse
{
    public class Util
    {
        public static int CalcularDiasEntreDatas(DateTime data1, DateTime data2)
        {
            int dias = 0;

            while (data1 <= data2)
            {
                data1 = data1.AddDays(1);
                dias++;

            }
            return dias;
        }
        public static void Excecao(string mensagem)
        {
            Exception ex = new Exception(mensagem);
            throw ex;
        }
    }
}
