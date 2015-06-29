using System;
using System.Collections.Generic;
using System.Linq;

namespace SmartHouse.HID
{
    internal class HidrometroDAL : SmartHouseDAL
    {
        public List<HidrometroVO> Selecionar()
        {
            return context.Database.SqlQuery<HidrometroVO>(
                   @"SELECT 
                       Codigo,
                       Valor,
                       Data
                     FROM 
                       HID.Hidrometro "
                   ).ToList();
        }
        public HidrometroVO SelecionarPorData(DateTime data1, DateTime data2)
        {
            return context.Database.SqlQuery<HidrometroVO>(
                    @"SELECT 
                        Valor = ISNULL(SUM(Valor), 0),
                        Data = CAST(@p1 AS DATETIME)
                    FROM 
                        HID.Hidrometro 
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
                  HID.Hidrometro
               (Valor, Data, Excluido)
              VALUES 
               (@p0, @p1, 0) ",
              valor,
              DateTime.Now
            );
        }
    }
}
