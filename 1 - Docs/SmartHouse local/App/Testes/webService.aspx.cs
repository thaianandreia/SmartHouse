using System;
using System.Collections.Generic;
using SmartHouse.Teste;

public partial class webService : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Request["gravar"] == "S")
        {
            new TesteBLL().Inserir(Request["f_nome"]);
        }
    }
}