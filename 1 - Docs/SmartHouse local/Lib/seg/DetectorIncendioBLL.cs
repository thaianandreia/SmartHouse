using System.Collections.Generic;
using System.Linq;

namespace SmartHouse.SEG
{
    public class DetectorIncendioBLL : SmartHouseBLL
    {
        private DetectorIncendioDAL detectorIncendioDAL;
        private ComodoDAL comodoDAL;
        public DetectorIncendioBLL()
        {
            detectorIncendioDAL = new DetectorIncendioDAL();
            comodoDAL = new ComodoDAL();
        }

        public List<DetectorIncendioVO> Selecionar(int? codigoComodo, bool carregarRelacionamentos)
        {
            var lista = detectorIncendioDAL.Selecionar(codigoComodo);

            if (carregarRelacionamentos)
            {
                foreach (var item in lista)
                {
                    item.Comodo = comodoDAL.SelecionarPorCodigo(item.CodigoComodo);
                }
            }
            return lista;
        }

        public void Inserir(DetectorIncendioVO sender)
        {
            using (ts = newTransactionScope())
            {
                if (sender.IndicadorIncendio)
                {
                    detectorIncendioDAL.Inserir(sender);
                    ts.Complete();
                }

            }
        }
    }
}
