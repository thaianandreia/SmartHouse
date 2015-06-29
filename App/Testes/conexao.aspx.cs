using System;
using System.Collections.Generic;
public partial class conexao : SmartHousePage
{
    protected List<SmartHouse.Teste.TesteVO> lista;
    protected SmartHouse.Teste.TesteBLL ctxConexao;
    protected void Page_Load(object sender, EventArgs e)
    {
        ctxConexao = new SmartHouse.Teste.TesteBLL();

        if (Request["gravar"] == "S")
        {
            ctxConexao.Inserir(Request["f_nome"]);
            Response.Redirect("conexao.aspx");
        }
    }
}