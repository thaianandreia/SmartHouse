<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SEG001.aspx.cs" Inherits="SEG001" MasterPageFile="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-header">Segurança</div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="box box-header">
        <div class="box-body">
            <form id="form1" runat="server">
                <div class="row">
                    <span id="btn-filtro" class="btn btn-primary btn-lg margin">Filtro</span>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <!-- AREA CHART -->
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Area Chart</h3>
                                <div class="box-tools pull-right">
                                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                </div>
                            </div>
                            <div class="box-body chart-responsive">
                                <div class="chart" id="revenue-chart" style="height: 300px;"></div>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="modal fade" id="modal-filtro">
        <div class="modal-dialog">
            <div class="modal-content">
                <form id="form-modal" method="post" action="SEG001.aspx">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Filtros</h4>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="f_consultar" value="S" />

                        <div class="row">
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label>Data Inicial</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input
                                            type="text"
                                            class="form-control datepicker"
                                            required="required"
                                            id="f_data1"
                                            name="f_data1"
                                            value="<%= this.data1.ToShortDateString() %>" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label>Data Final</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input
                                            type="text"
                                            class="form-control datepicker"
                                            required="required"
                                            id="f_data2"
                                            name="f_data2"
                                            value="<%= this.data2.ToShortDateString() %>" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Fechar</button>
                        <span id="btn-consultafiltro" class="btn btn-success">Consultar</span>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">

    <!-- ChartJS 1.0.1 -->
    <script src="../assets/plugins/chartjs/Chart.min.js"></script>
    <script src="../assets/plugins/morris/morris.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            // AREA CHART
            var area = new Morris.Line({
                element: 'revenue-chart',
                resize: true,
                data: [
                    <% int i = 0;
                       var rand = new Random();
                       foreach (var item in listaTemperatura)
                       {%>
                            { y: '<%= item.Data.ToShortDateString() %> <%= i%>', Temperatura: <%= item.Valor%>, Umidade: <%= rand.Next(20,200)%> }<%= item != listaTemperatura.Last()? "," : ""%>
                  <%        i++;
                       }%>
                ],
                xkey: 'y',
                ykeys: ['Temperatura', 'Umidade'],
                labels: ['Temperatura', 'Umidade'],
                lineColors: ['#a0d0e0', '#3c8dbc'],
                hideHover: 'auto'
            });
        });
    </script>
</asp:Content>
