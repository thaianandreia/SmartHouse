<%@ WebService Language="C#" Class="HidraulicaWS" %>
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Web.Script.Services;
using System.ServiceModel.Web;

[WebService(Namespace = "http://tempuri.org/")]
[System.Web.Script.Services.ScriptService]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class HidraulicaWS : System.Web.Services.WebService
{
    public SmartHouse.HID.HidrometroBLL ctxHidrometro = new SmartHouse.HID.HidrometroBLL();
    public SmartHouse.HID.VazamentoBLL ctxVazamento = new SmartHouse.HID.VazamentoBLL();

    [WebMethod]
    public List<decimal> SelecionarHidrometro()
    {
        List<decimal> lista = new List<decimal>();
        Random rand = new Random();
        int i = 0;
        foreach (var item in ctxHidrometro.Selecionar().OrderByDescending(p => p.Data).Take(50))
        {
            i++;
            lista.Add(item.Valor);
        }
        return lista;

    }

    [WebMethod]
    public List<SmartHouse.HID.VazamentoVO> SelecionarVazamento()
    {
        return ctxVazamento.Selecionar();
    }


    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public void Gravar(decimal valor)
    {
        ctxHidrometro.Inserir(valor);
    }


    [WebMethod]
    public int Pegar()
    {
        return 522;
    }

}

public class Morris
{
    public string nome { get; set; }
    public decimal valor { get; set; }

}