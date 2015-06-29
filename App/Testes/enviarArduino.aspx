<%@ Page Language="C#" AutoEventWireup="true" CodeFile="enviarArduino.aspx.cs" Inherits="enviarArduino" MasterPageFile="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Dashboard</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <form id="form1" runat="server">
        <input type="hidden" name="gravar" value="S" />

        <div class="row">
            <div class="col-xs-3">
                <div class="form-group">
                    <label>Nome</label>
                    <input type="text" class="form-control" id="f_nome" required="required" name="f_nome" value="" />
                </div>
            </div>
            <div class="col-xs-3">
                <div class="form-group">
                    <label>&nbsp;</label>
                    <button id="btn-enviar" type="button" class="btn btn-block btn-success">Salvar</button>
                </div>
            </div>
        </div>

    </form>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <script type="text/javascript">

        $(document).ready(function () {
            $("#btn-enviar").click(function () {
                var dto = {};
                dto.nome = $("#f_nome").val();
                $.ajax({
                    type: "POST",
                    url: "http://192.168.0.200:1433/Testes/TesteWS.asmx/Enviar?",
                    data: dto,
                    contentType: "application/jsonp; charset=utf-8",
                    dataType: "jsonp"
                });
            });



        });

    </script>
</asp:Content>
