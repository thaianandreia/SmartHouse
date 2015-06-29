<%@ Page Language="C#" AutoEventWireup="true" CodeFile="conexao.aspx.cs" Inherits="conexao" MasterPageFile="~/Site.master" %> 

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
                            <tbody>
                                <% lista = ctxConexao.Selecionar();
                                   foreach (var item in lista)
                                   { %>
                                <tr>
                                    <td><%=item.Codigo %></td>
                                    <td><%= item.Nome %></td>
                                </tr>
                                <%} %>
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
        $(function () {
            $('#grid1').dataTable({
                "bPaginate": true,
                "bLengthChange": false,
                "bFilter": false,
                "bSort": true,
                "bInfo": true,
                "bAutoWidth": false
            });
        });
    </script>
</asp:Content>
