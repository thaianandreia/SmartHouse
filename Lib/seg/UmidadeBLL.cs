using System;
using System.Collections.Generic;
using SmartHouse;

namespace SmartHouse.SEG
{
    public class UmidadeBLL : SmartHouseBLL
    {
        private UmidadeDAL umidadeDAL;
        public UmidadeBLL()
        {
            umidadeDAL = new UmidadeDAL();
        }

        public List<UmidadeVO> Selecionar()
        {
            return umidadeDAL.Selecionar();
        }
        public List<UmidadeVO> Selecionar(int tamanho)
        {
            return umidadeDAL.Selecionar();
        }

        public List<UmidadeVO> SelecionarPorData(DateTime data1, DateTime data2)
        {
            var lista = new List<UmidadeVO>();

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
                lista.Add(umidadeDAL.SelecionarPorData(data1, data2));
                data1 = data2;
            }

            if (resto > 0)
            {
                lista.Add(umidadeDAL.SelecionarPorData(data1.AddDays(i + resto), data2));
            }



            return lista;
        }

        public void Inserir(decimal valor)
        {
            using (ts = newTransactionScope())
            {
                umidadeDAL.Inserir(valor);
                ts.Complete();
            }
        }
    }
}
