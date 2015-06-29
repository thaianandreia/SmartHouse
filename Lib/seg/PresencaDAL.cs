using System;
using System.Collections.Generic;
using System.Linq;

namespace SmartHouse.SEG
{
    internal class PresencaDAL : SmartHouseDAL
    {
        public List<PresencaVO> Selecionar()
        {
            return context.Database.SqlQuery<PresencaVO>(
                @"SELECT 
                    Codigo,
                    CodigoComodo,
                    IndicadorPresenca,
                    Ativo,
                    Data
                  FROM 
                    SEG.Presenca 
                  WHERE
                    Excluido = 0"
                ).ToList();
        }

        public void Inserir(PresencaVO presenca)
        {
            context.Database.ExecuteSqlCommand(
            @"INSERT INTO 
                  SEG.Presenca
               (    CodigoComodo,
                    IndicadorPresenca,
                    Ativo,
                    Data,
                    Excluido)
              VALUES 
               (@p0, @p1, 1, @p2, 0) ",
              presenca.CodigoComodo,
              presenca.IndicadorPresenca,
              DateTime.Now
            );
        }

        public void Excluir(int codigoComodo)
        {
            context.Database.ExecuteSqlCommand(
            @"UPDATE 
                SEG.Presenca
              SET
                Excluido = 1
              WHERE
                CodigoComodo = @p0",
              codigoComodo
            );
        }
    }
}
