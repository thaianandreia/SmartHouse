namespace SmartHouse.SIS
{
    using System.Collections.Generic;
    using System.Linq;

    internal class ComponenteDAL : SmartHouseDAL
    {
        public List<ComponenteVO> Selecionar(string Pagina)
        {
            return context.Database.SqlQuery<ComponenteVO>(
                   @"SELECT 
                        Codigo, Pagina, Titulo, Nome, Descricao, Ativo
                     FROM 
                        SIS.Componente
                     WHERE
                        Pagina = @p0 AND
                        Ativo = 1
                     ORDER BY 
                        1 ",
                    Pagina
                   ).ToList();
        }

        public ComponenteVO SelecionarPorCodigo(string Pagina, string Titulo)
        {
            return context.Database.SqlQuery<ComponenteVO>(
                   @"SELECT 
                        Codigo, Pagina, Titulo, Nome, Descricao, Ativo
                     FROM 
                        SIS.Componente
                     WHERE
                        Pagina = @p0 AND
                        Titulo = @p1 AND
                        Ativo = 1
                     ORDER BY 
                        1 ",
                     Pagina,
                     Titulo
                   ).FirstOrDefault();
        }
    }
}
