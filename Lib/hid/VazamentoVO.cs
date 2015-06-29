using System;

namespace SmartHouse.HID
{
    public class VazamentoVO : SmartHouseVO
    {
        public int Codigo { get; set; }
        public int CodigoValvula { get; set; }
        public bool? IndicadorVazamento { get; set; }
        public bool Ativo { get; set; }
        public DateTime Data { get; set; }
    }
}