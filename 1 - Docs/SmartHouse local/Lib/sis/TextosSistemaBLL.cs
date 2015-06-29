using System.Collections.Generic;

namespace SmartHouse.SIS
{
    public class TextosSistemaBLL
    {
        private TextosSistemaDAL textosSistemaDAL;

        public TextosSistemaBLL()
        {
            textosSistemaDAL = new TextosSistemaDAL();
        }

        public List<TextosSistemaVO> Selecionar()
        {
            return textosSistemaDAL.Selecionar();
        }

        public TextosSistemaVO SelecionarParaUso(TextosSistemaEN texto)
        {
            return SelecionarPorCodigo((int)texto);
        }

        public TextosSistemaVO SelecionarPorCodigo(int codigo)
        {
            return textosSistemaDAL.SelecionarPorCodigo(codigo);
        }
    }
}
