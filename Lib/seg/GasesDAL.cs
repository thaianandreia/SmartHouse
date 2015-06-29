using System;
using System.Collections.Generic;
using System.Linq;

namespace SmartHouse.SEG
{
    internal class GasesDAL : SmartHouseDAL
    {
        public decimal Selecionar()
        {
            return context.Database.SqlQuery<decimal>(
                   @"SELECT TOP(1)
                       Valor
                     FROM 
                       SEG.Gases 
                     ORDER BY Data DESC "
                   ).FirstOrDefault();
        }

        public void Inserir(decimal valor)
        {
            context.Database.ExecuteSqlCommand(
            @"INSERT INTO 
                  SEG.Gases
               (Valor, Data, Excluido)
              VALUES 
               (@p0, @p1, 0) ",
              valor,
              DateTime.Now
            );
        }
    }
}
