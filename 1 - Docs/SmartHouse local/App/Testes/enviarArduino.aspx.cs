using System;
using System.Collections.Generic;
using SmartHouse.Teste;
public partial class enviarArduino : SmartHousePage
{
    protected List<TesteVO> lista;
    protected TesteBLL ctxConexao;
    protected void Page_Load(object sender, EventArgs e)
    {
        ctxConexao = new TesteBLL();

    }
}