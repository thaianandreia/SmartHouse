namespace SmartHouse.HID
{
    using System.Collections.Generic;
    using System.Linq;

    internal class ValvulaDAL : SmartHouseDAL
    {
        public List<ValvulaVO> Selecionar()
        {
            return context.Database.SqlQuery<ValvulaVO>(
                   @"SELECT 
                        Codigo, Nome, Descricao, Ativo
                     FROM 
                        HID.Valvula
                     WHERE 
                        Ativo = 1
                     ORDER BY 
                        1 "
                   ).ToList();
        }

        public ValvulaVO SelecionarPorCodigo(int codigo)
        {
            return context.Database.SqlQuery<ValvulaVO>(
                   @"SELECT 
                        Codigo, Nome, Descricao, Ativo
                     FROM 
                        HID.Valvula
                     WHERE
                        Codigo = @p0
                     ORDER BY 
                        1 ",
                     codigo
                   ).FirstOrDefault();
        }
    }
}
