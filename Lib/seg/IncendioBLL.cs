using System;
using System.Collections.Generic;
using SmartHouse;

namespace SmartHouse.SEG
{
    public class IncendioBLL : SmartHouseBLL
    {
        private IncendioDAL incendioDAL;
        public IncendioBLL()
        {
            incendioDAL = new IncendioDAL();
        }

        public decimal Selecionar()
        {
            return incendioDAL.Selecionar();
        }

        public void Inserir(decimal valor)
        {
            using (ts = newTransactionScope())
            {
                incendioDAL.Inserir(valor);
                ts.Complete();
            }
        }
    }
}
