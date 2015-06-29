namespace SmartHouse.ELE
{
    using System.Collections.Generic;
    using System.Linq;

    internal class TipoEnergiaDAL : SmartHouseDAL
    {
        public List<TipoEnergiaVO> Selecionar()
        {
            return context.Database.SqlQuery<TipoEnergiaVO>(
                   @"SELECT 
                        Codigo, Nome, Descricao, Ativo
                     FROM 
                        ENE.TipoEnergia 
                     WHERE 
                        Ativo = 1
                     ORDER BY 
                        1 "
                   ).ToList();
        }

        public TipoEnergiaVO SelecionarPorCodigo(int codigo)
        {
            return context.Database.SqlQuery<TipoEnergiaVO>(
                   @"SELECT 
                        Codigo, Nome, Descricao, Ativo
                     FROM 
                        ENE.TipoEnergia
                     WHERE
                        Codigo = @p0
                     ORDER BY 
                        1 ",
                     codigo
                   ).FirstOrDefault();
        }
    }
}
