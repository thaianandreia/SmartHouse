using System;
using System.Collections.Generic;
using SmartHouse.SEG;
public partial class SEG001 : SmartHousePage
{
    protected TemperaturaBLL ctxTemperatura;
    protected int dias;
    protected DateTime data1;
    protected DateTime data2;
    protected List<TemperaturaVO> listaTemperatura;
    protected void Page_Load(object sender, EventArgs e)
    {
        ctxTemperatura = new SmartHouse.SEG.TemperaturaBLL();
        data1 = this.DataInicialPadrao.AddMonths(-1);
        data2 = this.DataFinalPadrao.AddMonths(-1);
        listaTemperatura = new List<TemperaturaVO>();

        if (Request["f_consultar"] == "S")
        {
            Response.Redirect("SEG001.aspx?retorno=S&f_data1=" + Request["f_data1"] + "&f_data2=" + Request["f_data2"]);
        }

        if (Request["retorno"] == "S")
        {

            if (!string.IsNullOrEmpty(Request["f_data1"]))
            {
                data1 = Convert.ToDateTime(Request["f_data1"]);
                data2 = Convert.ToDateTime(Request["f_data2"]);
            }

            listaTemperatura = ctxTemperatura.SelecionarPorData(data1, data2);
        }
    }
}