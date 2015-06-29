using System.Collections.Generic;

namespace SmartHouse.SIS
{
    public class ComponenteBLL
    {
        private ComponenteDAL textosSistemaDAL;

        public ComponenteBLL()
        {
            textosSistemaDAL = new ComponenteDAL();
        }

        public List<ComponenteVO> Selecionar(string Pagina)
        {
            return textosSistemaDAL.Selecionar(Pagina);
        }

        public string SelecionarParaUso(string Pagina, string Titulo)
        {
            return textosSistemaDAL.SelecionarPorCodigo(Pagina, Titulo).Nome;
        }
    }
}
