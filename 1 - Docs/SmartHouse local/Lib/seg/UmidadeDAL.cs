using System;
using System.Collections.Generic;
using System.Linq;

namespace SmartHouse.SEG
{
    internal class UmidadeDAL : SmartHouseDAL
    {
        public List<UmidadeVO> Selecionar()
        {
            return context.Database.SqlQuery<UmidadeVO>(
                   @"SELECT 
                       Codigo,
                       Valor,
                       Data
                     FROM 
                       SEG.Umidade "
                   ).ToList();
        }
        public UmidadeVO SelecionarPorData(DateTime data1, DateTime data2)
        {
            return context.Database.SqlQuery<UmidadeVO>(
                    @"SELECT 
                        Valor = ISNULL(SUM(Valor), 0),
                        Data = CAST(@p1 AS DATETIME)
                    FROM 
                        SEG.Umidade 
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
                  SEG.Umidade
               (Valor, Data, Excluido)
              VALUES 
               (@p0, @p1, 0) ",
              valor,
              DateTime.Now
            );
        }
    }
}
