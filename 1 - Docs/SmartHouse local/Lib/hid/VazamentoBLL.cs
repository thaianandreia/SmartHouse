using System.Collections.Generic;

namespace SmartHouse.HID
{
    public class VazamentoBLL : SmartHouseBLL
    {
        private VazamentoDAL vazamentoDAL;
        public VazamentoBLL()
        {
            vazamentoDAL = new VazamentoDAL();
        }

        public List<VazamentoVO> Selecionar()
        {
            return vazamentoDAL.Selecionar();
        }

        public void Inserir(VazamentoVO sender)
        {
            using (ts = newTransactionScope())
            {
                vazamentoDAL.Excluir(sender.CodigoValvula);
                vazamentoDAL.Inserir(sender.Codigo);
                ts.Complete();
            }
        }
    }
}
