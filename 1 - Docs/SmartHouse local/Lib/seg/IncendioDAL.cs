using System;
using System.Collections.Generic;
using System.Linq;

namespace SmartHouse.SEG
{
    internal class IncendioDAL : SmartHouseDAL
    {

        public decimal Selecionar()
        {
            return context.Database.SqlQuery<decimal>(
                   @"SELECT TOP(1)
                       Valor
                     FROM 
                       SEG.Incendio
                     ORDER BY Data DESC"
                   ).FirstOrDefault();
        }
        public IncendioVO SelecionarPorData(DateTime data1, DateTime data2)
        {
            return context.Database.SqlQuery<IncendioVO>(
                    @"SELECT 
                        Valor = ISNULL(SUM(Valor), 0),
                        Data = CAST(@p1 AS DATETIME)
                    FROM 
                        SEG.Incendio 
                    WHERE
                        Data >= CAST(@p0 AS DATETIME) AND
                        Data <= CAST(@p1 AS DATETIME) AND
                        Excluido = 0",
                    data1.ToString("yyyy-MM-dd"),
                    data2.ToString("yyyy-MM-dd")
                   ).FirstOrDefault();
        }

        public void Inserir(decimal valor)
        {
            context.Database.ExecuteSqlCommand(
            @"INSERT INTO 
                  SEG.Incendio
               (Valor, Data, Excluido)
              VALUES 
               (@p0, @p1, 0) ",
              valor,
              DateTime.Now
            );
        }
    }
}
