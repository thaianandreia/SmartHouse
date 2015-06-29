<%@ WebService Language="C#" Class="EletricaWS" %>
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Web.Script.Services;
using System.ServiceModel.Web;
using System.Linq;

[WebService(Namespace = "http://tempuri.org/")]
[System.Web.Script.Services.ScriptService]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class EletricaWS : System.Web.Services.WebService
{
    public SmartHouse.ELE.EnergiaBLL ctxEnergia = new SmartHouse.ELE.EnergiaBLL();

    [WebMethod]
    public List<decimal> SelecionarTensao()
    {
        List<decimal> lista = new List<decimal>();
        int i = 0;
        foreach (var item in ctxEnergia.Selecionar().OrderByDescending(p => p.Data).Take(50))
        {
            i++;
            lista.Add(item.Tensao);
        }
        return lista;

    }
    
    [WebMethod]
    public List<decimal> SelecionarCorrente()
    {
        List<decimal> lista = new List<decimal>();
        int i = 0;
        
        foreach (var item in ctxEnergia.Selecionar().OrderByDescending(p => p.Data).Take(50))
        {
            i++;
            lista.Add(item.Corrente);
        }
        return lista;

    }


    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public void Gravar(int tensao, int corrente)
    {
        var sender = new SmartHouse.ELE.EnergiaVO();
        sender.Tensao = tensao;
        sender.Corrente = corrente;
        sender.Data = DateTime.Now;
        sender.Excluido = false;
        sender.CodigoTipoEnergia = 1;
        ctxEnergia.Inserir(sender);
    }
}