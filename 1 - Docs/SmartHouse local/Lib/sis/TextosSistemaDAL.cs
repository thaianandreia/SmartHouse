namespace SmartHouse.SIS
{
    using System.Collections.Generic;
    using System.Linq;

    internal class TextosSistemaDAL : SmartHouseDAL
    {
        public List<TextosSistemaVO> Selecionar()
        {
            return context.Database.SqlQuery<TextosSistemaVO>(
                   @"SELECT 
                        Codigo, Nome, Descricao, Ativo
                     FROM 
                        SIS.TextosSistema
                     WHERE 
                        Ativo = 1
                     ORDER BY 
                        1 "
                   ).ToList();
        }

        public TextosSistemaVO SelecionarPorCodigo(int codigo)
        {
            return context.Database.SqlQuery<TextosSistemaVO>(
                   @"SELECT 
                        Codigo, Nome, Descricao, Ativo
                     FROM 
                        SIS.TextosSistema
                     WHERE
                        Codigo = @p0
                     ORDER BY 
                        1 ",
                     codigo
                   ).FirstOrDefault();
        }
    }
}
