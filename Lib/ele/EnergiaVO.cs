using System;

namespace SmartHouse.ELE
{
    public class EnergiaVO : SmartHouseVO
    {
        public int Codigo { get; set; }
        public int CodigoTipoEnergia { get; set; }
        public int Tensao { get; set; }
        public int Corrente { get; set; }
        public DateTime Data { get; set; }

        public virtual TipoEnergiaVO TipoEnergia { get; set; }
    }
}