using System;

public partial class SEG002 : SmartHousePage
{
    protected SmartHouse.SEG.ComodoBLL ctxComodo;
    protected void Page_Load(object sender, EventArgs e)
    {
        ctxComodo = new SmartHouse.SEG.ComodoBLL();
    }
}