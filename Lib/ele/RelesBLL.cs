using System.Collections.Generic;

namespace SmartHouse.ELE
{
    public class RelesBLL : SmartHouseBLL
    {
        private RelesDAL relesDAL;

        public RelesBLL()
        {
            relesDAL = new RelesDAL();
        }

        public List<RelesVO> Selecionar()
        {
            return relesDAL.Selecionar();
        }

        public RelesVO SelecionarPorCodigo(int codigo)
        {
            return relesDAL.SelecionarPorCodigo(codigo);
        }

        public void Inserir(RelesVO sender)
        {
            using (ts = newTransactionScope())
            {
                relesDAL.Inserir(sender);
                ts.Complete();
            }
        }

        public void Atualizar(RelesVO sender)
        {
            using (ts = newTransactionScope())
            {
                relesDAL.Atualizar(sender);
                ts.Complete();
            }
        }

        public void Excluir(RelesVO sender)
        {
            using (ts = newTransactionScope())
            {
                relesDAL.Excluir(sender);
                ts.Complete();
            }
        }
    }
}
