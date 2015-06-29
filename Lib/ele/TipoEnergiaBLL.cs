using System.Collections.Generic;

namespace SmartHouse.ELE
{
    public class TipoEnergiaBLL : SmartHouseBLL
    {
        private TipoEnergiaDAL tipoEnergiaDAL;

        public TipoEnergiaBLL()
        {
            tipoEnergiaDAL = new TipoEnergiaDAL();
        }

        public List<TipoEnergiaVO> Selecionar()
        {
            return tipoEnergiaDAL.Selecionar();
        }

        public TipoEnergiaVO SelecionarPorCodigo(int codigo)
        {
            return tipoEnergiaDAL.SelecionarPorCodigo(codigo);
        }
    }
}
