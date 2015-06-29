<%@ WebService Language="C#" Class="TesteWS" %>
using System;
using System.Collections.Generic;
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
public class TesteWS  : System.Web.Services.WebService {
    [WebMethod]
    public List<SmartHouse.Teste.TesteVO> Selecionar() {
        return new SmartHouse.Teste.TesteBLL().Selecionar();
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public List<string> Mostrar(string texto)
    {
        return new List<string>() { texto };
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public void Gravar(string nome)
    {
        new SmartHouse.Teste.TesteBLL().Inserir(nome);
    }

    [WebMethod]
    [WebInvoke(Method="POST", ResponseFormat=WebMessageFormat.Json)]
    [ScriptMethod(UseHttpGet = true)]
    public void Enviar(string nome)
    {
        new SmartHouse.Teste.TesteBLL().Inserir(nome);
    }
    
}