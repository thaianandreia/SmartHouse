using System;
using System.Collections.Generic;
using SmartHouse;

namespace SmartHouse.SEG
{
    public class TemperaturaBLL : SmartHouseBLL
    {
        private TemperaturaDAL temperaturaDAL;
        public TemperaturaBLL()
        {
            temperaturaDAL = new TemperaturaDAL();
        }

        public List<TemperaturaVO> Selecionar()
        {
            return temperaturaDAL.Selecionar();
        }
        public List<TemperaturaVO> Selecionar(int tamanho)
        {
            return temperaturaDAL.Selecionar();
        }

        public List<TemperaturaVO> SelecionarPorData(DateTime data1, DateTime data2)
        {
            var lista = new List<TemperaturaVO>();

            int dif = Util.CalcularDiasEntreDatas(data1, data2);
            int parte = dif / 6;
            int resto = dif - (parte*6);
            int dias = parte;
            int i = 0;
            for (i = 0; i < 6; i++)
            {
                if (i == 5 && resto < 0)
                {
                    dias -= resto;
                }

                data1 = data1.AddDays(i != 0 ? 1 : 0);
                data2 = data1.AddDays(dias);
                lista.Add(temperaturaDAL.SelecionarPorData(data1, data2));
                data1 = data2;
            }

            if (resto > 0)
            {
                lista.Add(temperaturaDAL.SelecionarPorData(data1.AddDays(i + resto), data2));
            }



            return lista;
        }

        public void Inserir(decimal valor)
        {
            using (ts = newTransactionScope())
            {
                temperaturaDAL.Inserir(valor);
                ts.Complete();
            }
        }
    }
}
