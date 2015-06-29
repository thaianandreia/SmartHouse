using System.Collections.Generic;

namespace SmartHouse.SEG
{
    public class PresencaBLL : SmartHouseBLL
    {
        private PresencaDAL presencaDAL;
        public PresencaBLL()
        {
            presencaDAL = new PresencaDAL();
        }

        public List<PresencaVO> Selecionar()
        {
            return presencaDAL.Selecionar();
        }

        public void Inserir(PresencaVO sender)
        {
            using (ts = newTransactionScope())
            {
                presencaDAL.Excluir(sender.CodigoComodo);
                presencaDAL.Inserir(sender);
                ts.Complete();
            }
        }
    }
}
