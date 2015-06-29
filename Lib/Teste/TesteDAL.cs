namespace SmartHouse.Teste
{
    using System.Collections.Generic;
    using System.Linq;
    using System.Transactions;

    internal class TesteDAL : SmartHouseDAL
    {
        public List<TesteVO> Selecionar()
        {
            return context.Database.SqlQuery<TesteVO>(
                @"SELECT 
                    Codigo,
                    Nome
                FROM 
                    Teste "
                ).ToList();
        }

        public void Inserir(string nome)
        {
            context.Database.ExecuteSqlCommand(
            @"INSERT INTO 
                  Teste
               (Nome) 
              VALUES 
               (@p0) ",
              nome
            );
        }
    }
}
