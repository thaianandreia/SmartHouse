using System;
using System.Collections.Generic;
using SmartHouse;

namespace SmartHouse.SEG
{
    public class GasesBLL : SmartHouseBLL
    {
        private GasesDAL gasesDAL;
        public GasesBLL()
        {
            gasesDAL = new GasesDAL();
        }

        public decimal Selecionar()
        {
            return gasesDAL.Selecionar();
        }

        public void Inserir(decimal valor)
        {
            using (ts = newTransactionScope())
            {
                gasesDAL.Inserir(valor);
                ts.Complete();
            }
        }
    }
}
