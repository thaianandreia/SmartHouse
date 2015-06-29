using System;

namespace SmartHouse.SEG
{
    public class PresencaVO : SmartHouseVO
    {
        public int Codigo { get; set; }
        public int CodigoComodo { get; set; }
        public bool? IndicadorPresenca { get; set; }
        public bool Ativo { get; set; }
        public DateTime Data { get; set; }
    }
}