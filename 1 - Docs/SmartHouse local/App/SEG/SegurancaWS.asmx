<%@ WebService Language="C#" Class="SegurancaWS" %>
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
public class SegurancaWS : System.Web.Services.WebService
{
    public SmartHouse.SEG.GasesBLL ctxGases = new SmartHouse.SEG.GasesBLL();
    public SmartHouse.SEG.IncendioBLL ctxIncendio = new SmartHouse.SEG.IncendioBLL();
    public SmartHouse.SEG.TemperaturaBLL ctxTemperatura = new SmartHouse.SEG.TemperaturaBLL();
    public SmartHouse.SEG.UmidadeBLL ctxUmidade = new SmartHouse.SEG.UmidadeBLL();
    public SmartHouse.SEG.PresencaBLL ctxPresenca = new SmartHouse.SEG.PresencaBLL();

    [WebMethod]
    public List<Morris> Selecionar()
    {
        //List<Seguranca.TemperaturaVO> listaTemperatura = temperatura.Selecionar();
        List<Morris> listaMorris = new List<Morris>();
        Random rand = new Random();
        DateTime data = DateTime.Now;
        for (int i = 0; i < 10; i++)
        {
            data = data.AddMonths(4);
            listaMorris.Add(new Morris
            {
                nome = data.Year.ToString() + " Q" + (i + 1).ToString(),
                valor = Convert.ToDecimal(rand.Next(7000, 8000))
            });
        }
        return listaMorris;

    }
    [WebMethod]
    public List<decimal> SelecionarTemperatura()
    {
        List<decimal> lista = new List<decimal>();
        Random rand = new Random();
        int i = 0;
        foreach (var item in ctxTemperatura.Selecionar().OrderByDescending(p => p.Data).Take(50))
        {
            i++;
            lista.Add(item.Valor);
        }

        return lista;

    }

    [WebMethod]
    public List<int> SelecionarUmidade()
    {
        List<int> lista = new List<int>();
        Random rand = new Random();
        int i = 0;
        foreach (var item in ctxUmidade.Selecionar().OrderByDescending(p => p.Data).Take(50))
        {
            i++;
            lista.Add(Convert.ToInt32(item.Valor));
        }
        return lista;

    }

    [WebMethod]
    public List<SmartHouse.SEG.PresencaVO> SelecionarPresenca()
    {
        return ctxPresenca.Selecionar();
    }

    [WebMethod]
    public bool SelecionarGases()
    {
        return ctxGases.Selecionar() > 20;
    }

    [WebMethod]
    public bool SelecionarIncendio()
    {
        return ctxIncendio.Selecionar() < 800;
    }

    [WebMethod]
    public int Teste()
    {
        return 1;
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public List<string> Mostrar(string texto)
    {
        return new List<string>() { texto };
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public void Gravar(decimal temperatura, decimal umidade, int fogo, int gases, int presenca)
    {
        ctxTemperatura.Inserir(temperatura);

        ctxUmidade.Inserir(umidade);

        ctxGases.Inserir(gases);

        ctxIncendio.Inserir(fogo);
        
        SmartHouse.SEG.PresencaVO senderP = new SmartHouse.SEG.PresencaVO();
        senderP.CodigoComodo = 1;
        senderP.IndicadorPresenca = presenca == 1;
        ctxPresenca.Inserir(senderP);
    }

}

public class Morris
{
    public string nome { get; set; }
    public decimal valor { get; set; }

}