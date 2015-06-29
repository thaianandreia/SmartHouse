using System;

namespace SmartHouse.SEG
{
    public class IncendioVO : SmartHouseVO
    {
        public int Codigo { get; set; }
        public decimal Valor { get; set; }
        public DateTime Data { get; set; }
    }
}