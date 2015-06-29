using System;
using System.Collections.Generic;
using System.Linq;

namespace SmartHouse.SEG
{
    internal class TemperaturaDAL : SmartHouseDAL
    {
        public List<TemperaturaVO> Selecionar()
        {
            return context.Database.SqlQuery<TemperaturaVO>(
                   @"SELECT 
                       Codigo,
                       Valor,
                       Data
                     FROM 
                       SEG.Temperatura "
                   ).ToList();
        }
        public TemperaturaVO SelecionarPorData(DateTime data1, DateTime data2)
        {
            return context.Database.SqlQuery<TemperaturaVO>(
                    @"SELECT 
                        Valor = ISNULL(SUM(Valor), 0),
                        Data = CAST(@p1 AS DATETIME)
                    FROM 
                        SEG.Temperatura 
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
                  SEG.Temperatura
               (Valor, Data, Excluido)
              VALUES 
               (@p0, @p1, 0) ",
              valor,
              DateTime.Now
            );
        }
    }
}
