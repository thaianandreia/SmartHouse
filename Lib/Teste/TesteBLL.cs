using System.Collections.Generic;

namespace SmartHouse.Teste
{
    public class TesteBLL : SmartHouseBLL
    {
        private TesteDAL testeDAL;
        public TesteBLL()
        {
            testeDAL = new TesteDAL();
        }
        public List<TesteVO> Selecionar()
        {
            return testeDAL.Selecionar();
        }

        public void Inserir(string nome)
        {
            using (ts = newTransactionScope())
            {
                testeDAL.Inserir(nome);
                ts.Complete();
            }
        }
    }
}
