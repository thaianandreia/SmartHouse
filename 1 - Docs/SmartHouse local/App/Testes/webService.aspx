<%@ Page Language="C#" AutoEventWireup="true" CodeFile="webService.aspx.cs" Inherits="webService" MasterPageFile="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Dashboard</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <form id="form1" runat="server">
        <input type="hidden" name="gravar" value="S" />
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Hover Data Table</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="grid1" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Nome</th>
                                </tr>
                            </thead>
                            <tbody id="tabela">
                            </tbody>
                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
        </div>
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
                    <button type="submit" class="btn btn-block btn-success">Salvar</button>
                </div>
            </div>
        </div>

    </form>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            Carregar();
        });
        function Carregar() {
            setTimeout(function () {
                Carregar();
            }, 10000);
            $("#tabela td").remove();
            $.ajax({
                type: "POST",
                url: "../Testes/TesteWS.asmx/Selecionar",
                data: "",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var teste = "";
                    for (var i = 0; i < data.d.length; i++) {
                        teste += "<tr><td>" + data.d[i].Codigo + "</td><td>" + data.d[i].Nome + "</td></tr>";
                    }
                    $("#tabela").append(teste);

                }
            });
        }
    </script>
</asp:Content>


