using System;

public partial class HID001 : SmartHousePage
{
    protected SmartHouse.HID.ValvulaBLL ctxValvula;
    protected void Page_Load(object sender, EventArgs e)
    {
        ctxValvula = new SmartHouse.HID.ValvulaBLL();
    }
}