using System;

namespace SmartHouse.HID
{
    public class HidrometroVO : SmartHouseVO
    {
        public int Codigo { get; set; }
        public decimal Valor { get; set; }
        public DateTime Data { get; set; }
    }
}