<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HID001.aspx.cs" Inherits="HID001" MasterPageFile="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-header">Hidráulica</div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="box box-header">
        <div class="box-body">
            <form id="form1" runat="server">
                <div class="row">

                    <div class="col-xs-12">
                        <table class="table table-condensed">
                            <thead>
                                <tr>
                                    <th colspan="4">
                                        <h3 class="box-title">Valvulas</h3>
                                    </th>
                                </tr>
                            </thead>
                            <tr>
                                <th style="width: 10px">#</th>
                                <th>Válvulas</th>
                                <th class="text-center">Status</th>
                                <th class="text-center">Aparelho</th>
                                <th class="text-center"></th>
                            </tr>
                            <%foreach (var item in ctxValvula.Selecionar())
                              { %>
                            <tr>
                                <td><%= item.Codigo %></td>
                                <td><%= item.Nome %></td>
                                <td class="text-center"><span class="badge bg-blue" id="f_status_<%= item.Codigo %>"></span></td>
                                <td class="text-center"><span class="badge bg-green" id="f_aparelho_<%= item.Codigo %>"></span></td>
                                <td class="text-center">
                                    <input
                                        type="checkbox"
                                        id="switch_<%= item.Codigo %>"
                                        class="switch"
                                        data-size="mini"
                                        data-on-color="success"
                                        data-codigo="<%= item.Codigo %>"
                                        <%= item.Ativo ? "checked" : "" %> />
                                </td>
                            </tr>
                            <%} %>
                        </table>

                    </div>

                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <!-- interactive chart -->
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <i class="fa fa-bar-chart-o"></i>
                                <h3 class="box-title">Hidrômetro em mililitros (ml)</h3>
                                <div class="box-tools pull-right">
                                    Real time
                                    <div class="btn-group" id="f_hidrometro" data-toggle="btn-toggle">
                                        <button type="button" class="btn btn-default btn-xs active" data-toggle="on">On</button>
                                        <button type="button" class="btn btn-default btn-xs" data-toggle="off">Off</button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <div id="g_hidrometro" style="height: 300px;"></div>
                            </div>
                            <!-- /.box-body-->
                        </div>
                        <!-- /.box -->
                    </div>
                    <!-- /.col -->
                </div>
            </form>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <!-- FLOT CHARTS -->
    <script src="../../assets/plugins/flot/jquery.flot.min.js" type="text/javascript"></script>
    <!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
    <script src="../../assets/plugins/flot/jquery.flot.resize.min.js" type="text/javascript"></script>
    <!-- FLOT PIE PLUGIN - also used to draw donut charts -->
    <script src="../../assets/plugins/flot/jquery.flot.pie.min.js" type="text/javascript"></script>
    <!-- FLOT CATEGORIES PLUGIN - Used to draw bar charts -->
    <script src="../../assets/plugins/flot/jquery.flot.categories.min.js" type="text/javascript"></script>
    <!-- AdminLTE App -->
    <script src="../assets/dist/js/app.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        var listaHidrometro = [];
        var listaUmidade = [];
        $(function () {

            SmartHouse.HID.Metodos.Gravar("<%= IP_Hidraulica %>");

            setInterval(function () {
                SmartHouse.HID.Metodos.Gravar("<%= IP_Hidraulica %>");
            }, 2000000);

            hidrometro();
            vazamentos();

            setInterval(function () {
                vazamentos();
            }, 1 * 3000)

            $(".switch").bootstrapSwitch().on('switchChange.bootstrapSwitch', function (event, state) {
                var codigo = $("#" + event.currentTarget.id).data("codigo");

                var comando = state ? "reset" : "set";
                $.ajax({
                    type: "POST",
                    url: "http://<%= IP_Hidraulica %>/V1/" + comando,
                    //data: dto,
                    contentType: "application/jsonp; charset=utf-8",
                    dataType: "jsonp"
                });
            });

        });

        function hidrometro() {
            var data = [], totalPoints = 50;
            function getRandomData() {
                SmartHouse.HID.Metodos.SelecionarHidrometro(function (retorno) {
                    if (data.length > 0)
                        data = data.slice(1);

                    // Do a random walk
                    var y = 0;
                    while (data.length < totalPoints) {
                        data.push(retorno[y]);
                        y++;
                    }

                    // Zip the generated y values with the x values

                    for (var i = 0; i < data.length; ++i) {
                        listaHidrometro.push([i, data[i]]);
                    }
                });
            }
            getRandomData();

            setTimeout(function () {
                var interactive_plot = $.plot("#g_hidrometro", [listaHidrometro], {
                    grid: {
                        borderColor: "#f3f3f3",
                        borderWidth: 1,
                        tickColor: "#f3f3f3"
                    },
                    series: {
                        shadowSize: 0, // Drawing is faster without shadows
                        color: "#FFFF00"
                    },
                    lines: {
                        fill: true, //Converts the line chart to area chart
                        color: "#FFFF00"
                    },
                    yaxis: {
                        min: <%= Request["min"]%>,
                        max: <%= Request["max"]%>,
                        show: true
                    },
                    xaxis: {
                        show: true
                    }
                });

                var updateInterval = 3000; //Fetch data ever x milliseconds
                var realtime = "on"; //If == to on then fetch data every x seconds. else stop fetching
                function update() {

                    interactive_plot.setData([listaHidrometro]);

                    // Since the axes don't change, we don't need to call plot.setupGrid()
                    interactive_plot.draw();
                    if (realtime === "on") {
                        listaHidrometro = []
                        getRandomData()
                        setTimeout(update, updateInterval);
                    }
                }

                //INITIALIZE REALTIME DATA FETCHING
                if (realtime === "on") {
                    update();
                }
                //REALTIME TOGGLE
                $("#f_hidrometro .btn").click(function () {
                    if ($(this).data("toggle") === "on") {
                        realtime = "on";
                    }
                    else {
                        realtime = "off";
                    }
                    update();
                });
            }, 1000);
            /*
             * END INTERACTIVE CHART
             */
        }

        function vazamentos() {
            SmartHouse.HID.Metodos.SelecionarVazamento(function (data) {
                for (var x = 0; x < data.length; x++) {
                    if (data[x].IndicadorVazamento) {
                        $("#f_status_" + data[x].CodigoValvula).text("Vazamento");
                        $("#f_status_" + data[x].CodigoValvula).removeClass().addClass("badge bg-orange");
                    }
                    if (!data[x].IndicadorVazamento) {
                        $("#f_status_" + data[x].CodigoValvula).text("OK");
                        $("#f_status_" + data[x].CodigoValvula).removeClass().addClass("badge bg-blue");
                    }
                    if (data[x].IndicadorVazamento == null) {
                        $("#f_status_" + data[x].CodigoValvula).text(" ---- ");
                        $("#f_status_" + data[x].CodigoValvula).removeClass().addClass("badge bg-grey");
                    }

                    if (data[x].Ativo) {
                        $("#f_aparelho_" + data[x].CodigoValvula).text("Em Funcionamento");
                        $("#f_aparelho_" + data[x].CodigoValvula).removeClass().addClass("badge bg-green");
                    }
                    if (!data[x].Ativo) {
                        $("#f_aparelho_" + data[x].CodigoValvula).text("Não Identificado");
                        $("#f_aparelho_" + data[x].CodigoValvula).removeClass().addClass("badge bg-red");
                    }
                }
            });
        }
    </script>
</asp:Content>
