using System.Collections.Generic;

namespace SmartHouse.HID
{
    public class ValvulaBLL
    {
        private ValvulaDAL valvulaDAL;

        public ValvulaBLL()
        {
            valvulaDAL = new ValvulaDAL();
        }

        public List<ValvulaVO> Selecionar()
        {
            return valvulaDAL.Selecionar();
        }

        public ValvulaVO SelecionarPorCodigo(int codigo)
        {
            return valvulaDAL.SelecionarPorCodigo(codigo);
        }
    }
}
