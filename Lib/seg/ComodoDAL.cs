namespace SmartHouse.SEG
{
    using System.Collections.Generic;
    using System.Linq;

    internal class ComodoDAL : SmartHouseDAL
    {
        public List<ComodoVO> Selecionar()
        {
            return context.Database.SqlQuery<ComodoVO>(
                   @"SELECT 
                        Codigo, Nome, Descricao, Ativo
                     FROM 
                        SEG.Comodo
                     WHERE 
                        Ativo = 1
                     ORDER BY 
                        1 "
                   ).ToList();
        }

        public ComodoVO SelecionarPorCodigo(int codigo)
        {
            return context.Database.SqlQuery<ComodoVO>(
                   @"SELECT 
                        Codigo, Nome, Descricao, Ativo
                     FROM 
                        SEG.Comodo
                     WHERE
                        Codigo = @p0
                     ORDER BY 
                        1 ",
                     codigo
                   ).FirstOrDefault();
        }
    }
}
