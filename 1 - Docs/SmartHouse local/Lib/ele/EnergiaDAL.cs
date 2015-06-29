namespace SmartHouse.ELE
{
    using System.Collections.Generic;
    using System.Linq;

    internal class EnergiaDAL : SmartHouseDAL
    {
        public List<EnergiaVO> Selecionar()
        {
            return context.Database.SqlQuery<EnergiaVO>(
                   @"SELECT 
                        Codigo, CodigoTipoEnergia, Tensao, Corrente, Data
                     FROM 
                        ELE.Energia 
                     WHERE 
                        Excluido = 0
                     ORDER BY 
                        1 "
                   ).ToList();
        }

        public EnergiaVO SelecionarPorCodigo(int codigo)
        {
            return context.Database.SqlQuery<EnergiaVO>(
                   @"SELECT 
                        Codigo, CodigoTipoEnergia, Tensao, Corrente, Data
                     FROM 
                        ELE.Energia
                     WHERE
                        Codigo = @p0 AND
                        Excluido = 0
                     ORDER BY 
                        1 ",
                     codigo
                   ).FirstOrDefault();
        }

        public void Inserir(EnergiaVO sender)
        {
            context.Database.ExecuteSqlCommand(
            @"INSERT INTO
                  ELE.Energia
               (CodigoTipoEnergia, Tensao, Corrente, Data, Excluido)
              VALUES
               (@p0, @p1, @p2, @p3, @p4)",
              sender.CodigoTipoEnergia,
              sender.Tensao,
              sender.Corrente,
              sender.Data,
              false
            );
        }
    }
}
