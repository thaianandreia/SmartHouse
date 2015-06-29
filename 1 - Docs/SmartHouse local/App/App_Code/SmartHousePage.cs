using System;
using System.Linq;

public class SmartHousePage : System.Web.UI.Page
{
    protected string PageName;
    protected string IP_Energia;
    protected string IP_Hidraulica;
    protected string IP_Seguranca;

    public SmartHousePage()
    {
        DataAtualSistema = DateTime.Now;
        DataInicialPadrao = new DateTime(DataAtualSistema.Year, DataAtualSistema.Month, 1);
        DataFinalPadrao = DataInicialPadrao.AddMonths(1).AddDays(-1);

        PageName = this.Page.ToString().ToUpper().Replace("ASP.", "").Replace("_ASPX", "").Split('_').LastOrDefault();
        IP_Energia = "192.168.0.202";
        IP_Hidraulica = "192.168.0.225";
        IP_Seguranca = "192.168.0.250";
    }

    public DateTime DataAtualSistema { get; private set; }
    public DateTime DataInicialPadrao { get; private set; }
    public DateTime DataFinalPadrao { get; private set; }
}

