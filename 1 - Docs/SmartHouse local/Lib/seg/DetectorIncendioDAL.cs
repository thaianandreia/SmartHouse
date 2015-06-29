using System;
using System.Collections.Generic;
using System.Linq;

namespace SmartHouse.SEG
{
    internal class DetectorIncendioDAL : SmartHouseDAL
    {
        public List<DetectorIncendioVO> Selecionar(int? codigoComodo)
        {
            return context.Database.SqlQuery<DetectorIncendioVO>(
                   @"SELECT 
                       Codigo,
                       CodigoComodo,
                       Nome
                     FROM 
                       SEG.DetectorIncendio 
                     WHERE
                        CodigoComodo = ISNULL(@p0, CodigoComodo)
                        Excluido = 0",
                     codigoComodo
                   ).ToList();
        }

        public void Inserir(DetectorIncendioVO sender)
        {
            context.Database.ExecuteSqlCommand(
            @"INSERT INTO 
                  SEG.DetectorIncendio
               (Valor, Data)
              VALUES 
               (@p0, @p1) ",
              sender.Valor,
              DateTime.Now
            );
        }
    }
}
