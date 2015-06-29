using System.Collections.Generic;

namespace SmartHouse.ELE
{
    public class EnergiaBLL : SmartHouseBLL
    {
        private EnergiaDAL energiaDAL;
        private TipoEnergiaDAL tipoEnergiaDAL;

        public EnergiaBLL()
        {
            energiaDAL = new EnergiaDAL();
            tipoEnergiaDAL = new TipoEnergiaDAL();
        }

        public List<EnergiaVO> Selecionar()
        {
            return Selecionar(false);
        }
        public List<EnergiaVO> Selecionar(bool carregarRelacionamentos)
        {
            List<EnergiaVO> sender = energiaDAL.Selecionar();

            if (carregarRelacionamentos)
                sender = CarregarRelacionamentos(sender);

            return sender;
        }

        public EnergiaVO SelecionarPorCodigo(int codigo)
        {
            return SelecionarPorCodigo(codigo, false);
        }
        public EnergiaVO SelecionarPorCodigo(int codigo, bool carregarRelacionamentos)
        {
            EnergiaVO sender = energiaDAL.SelecionarPorCodigo(codigo);

            if (carregarRelacionamentos)
                sender = CarregarRelacionamentos(sender);

            return sender;
        }

        public void Inserir(EnergiaVO sender)
        {
            using (ts = newTransactionScope())
            {
                energiaDAL.Inserir(sender);
                ts.Complete();
            }
        }

        public List<EnergiaVO> CarregarRelacionamentos(List<EnergiaVO> sender)
        {
            for (int i = 0; i < sender.Count; i++)
                sender[i] = CarregarRelacionamentos(sender[i]);

            return sender;
        }

        public EnergiaVO CarregarRelacionamentos(EnergiaVO sender)
        {
            sender.TipoEnergia = tipoEnergiaDAL.SelecionarPorCodigo(sender.CodigoTipoEnergia);

            return sender;
        }
    }
}
