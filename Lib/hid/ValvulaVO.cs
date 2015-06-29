namespace SmartHouse.HID
{
    public class ValvulaVO : SmartHouseVO
    {
        public int Codigo { get; set; }
        public string Nome { get; set; }
        public string Descricao { get; set; }
        public bool Ativo { get; set; }
    }
}