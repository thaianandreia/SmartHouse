using System;

namespace SmartHouse.SEG
{
    public class GasesVO : SmartHouseVO
    {
        public int Codigo { get; set; }
        public decimal Valor { get; set; }
        public DateTime Data { get; set; }
    }
}