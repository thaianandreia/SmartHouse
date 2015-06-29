namespace SmartHouse.ELE
{
    using System.Collections.Generic;
    using System.Linq;

    internal class RelesDAL : SmartHouseDAL
    {
        public List<RelesVO> Selecionar()
        {
            return context.Database.SqlQuery<RelesVO>(
                   @"SELECT 
                        Codigo, Nome, Descricao, Ativo
                     FROM 
                        ELE.Reles 
                     WHERE 
                        Excluido = 0
                     ORDER BY 
                        1 "
                   ).ToList();
        }

        public RelesVO SelecionarPorCodigo(int codigo)
        {
            return context.Database.SqlQuery<RelesVO>(
                   @"SELECT 
                        Codigo, Nome, Descricao, Ativo
                     FROM 
                        ELE.Reles
                     WHERE
                        Codigo = @p0 AND
                        Excluido = 0
                     ORDER BY 
                        1 ",
                     codigo
                   ).FirstOrDefault();
        }

        public void Inserir(RelesVO sender)
        {
            context.Database.ExecuteSqlCommand(
            @"INSERT INTO
                  ELE.Reles
               (Nome, Descricao, Ativo, Excluido)
              VALUES
               (@p0, @p1, @p2, @p3)",
              sender.Nome,
              sender.Descricao,
              sender.Ativo,
              false
            );
        }

        public void Atualizar(RelesVO sender)
        {
            context.Database.ExecuteSqlCommand(
            @"UPDATE
                 ELE.Reles
              SET
                 Nome = @p1,
                 Descricao = @p2,
                 Ativo = @p3
              WHERE
                 Codigo = @p0",
              sender.Codigo,
              sender.Nome,
              sender.Descricao,
              sender.Ativo
            );
        }

        public void Excluir(RelesVO sender)
        {
            context.Database.ExecuteSqlCommand(
            @"UPDATE
                 ELE.Reles
              SET
                 Excluido = @p1
              WHERE
                 Codigo = @p0",
              sender.Codigo,
              true
            );
        }
    }
}
