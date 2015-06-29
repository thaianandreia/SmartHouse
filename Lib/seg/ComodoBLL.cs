using System.Collections.Generic;

namespace SmartHouse.SEG
{
    public class ComodoBLL
    {
        private ComodoDAL comodoDAL;

        public ComodoBLL()
        {
            comodoDAL = new ComodoDAL();
        }

        public List<ComodoVO> Selecionar()
        {
            return comodoDAL.Selecionar();
        }

        public ComodoVO SelecionarPorCodigo(int codigo)
        {
            return comodoDAL.SelecionarPorCodigo(codigo);
        }
    }
}
