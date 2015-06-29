using System;

namespace SmartHouse.SEG
{
    public class DetectorIncendioVO : SmartHouseVO
    {
        public int Codigo { get; set; }
        public int CodigoComodo { get; set; }
        public decimal Valor { get; set; }
        public DateTime Data { get; set; }
        public bool IndicadorIncendio { get; set; }

        public virtual ComodoVO Comodo { get; set; }
    }
}