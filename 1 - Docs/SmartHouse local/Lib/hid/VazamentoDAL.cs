using System;
using System.Collections.Generic;
using System.Linq;

namespace SmartHouse.HID
{
    internal class VazamentoDAL : SmartHouseDAL
    {
        public List<VazamentoVO> Selecionar()
        {
            return context.Database.SqlQuery<VazamentoVO>(
                @"SELECT 
                    Codigo,
                    CodigoValvula,
                    IndicadorVazamento,
                    Ativo,
                    Data
                  FROM 
                    HID.Vazamento 
                  WHERE
                    Excluido = 0"
                ).ToList();
        }

        public void Inserir(int valor)
        {
            context.Database.ExecuteSqlCommand(
            @"INSERT INTO 
                  HID.Vazamento
               (Valor, Data)
              VALUES 
               (@p0, @p1) ",
              valor,
              DateTime.Now
            );
        }

        public void Excluir(int codigoValvula)
        {
            context.Database.ExecuteSqlCommand(
            @"UPDATE 
                HID.Vazamento
              SET
                Excluido = 1
              WHERE
                CodigoValvula = @p0",
              codigoValvula
            );
        }
    }
}
