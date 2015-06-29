<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SEG002.aspx.cs" Inherits="SEG002" MasterPageFile="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-header">Segurança</div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="box box-header">
        <div class="box-body">
            <form id="form1" runat="server">
                <div class="row">

                    <div class="col-xs-6">
                        <table class="table table-condensed">
                            <thead>
                                <tr>
                                    <th colspan="4">
                                        <h3 class="box-title">Dectector de Presença</h3>
                                    </th>
                                </tr>
                            </thead>
                            <tr>
                                <th style="width: 10px">#</th>
                                <th>Cômodo</th>
                                <th class="text-center">Status</th>
                                <th class="text-center">Aparelho</th>
                            </tr>
                            <%foreach (var item in ctxComodo.Selecionar())
                              { %>
                            <tr>
                                <td><%= item.Codigo %></td>
                                <td><%= item.Nome %></td>
                                <td class="text-center"><span class="badge bg-blue" id="f_status_<%= item.Codigo %>"></span></td>
                                <td class="text-center"><span class="badge bg-green" id="f_aparelho_<%= item.Codigo %>"></span></td>
                            </tr>
                            <%} %>
                        </table>

                    </div>
                    <div class="col-xs-6">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="info-box">
                                    <span id="span-gas" class="info-box-icon bg-green"><i id="i-gas" class="fa fa-check"></i></span>
                                    <div class="info-box-content">
                                        <span class="info-box-text">Vazamento de Gás</span>
                                        <span id="texto-gas" class="info-box-more">Não identificado</span>
                                    </div>
                                    <!-- /.info-box-content -->
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="info-box">
                                    <span id="span-incendio" class="info-box-icon bg-red"><i id="i-incendio" class="glyphicon glyphicon-fire"></i></span>
                                    <div class="info-box-content">
                                        <span class="info-box-text">Focos de Incêndio</span>
                                        <span id="texto-incendio" class="info-box-more">Identificado</span>
                                    </div>
                                    <!-- /.info-box-content -->
                                </div>
                                <!-- /.info-box -->
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-xs-6">
                        <!-- interactive chart -->
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <i class="fa fa-bar-chart-o"></i>
                                <h3 class="box-title">Temperatura</h3>
                                <div class="box-tools pull-right">
                                    Real time
                                    <div class="btn-group" id="f_temperatura" data-toggle="btn-toggle">
                                        <button type="button" class="btn btn-default btn-xs active" data-toggle="on">On</button>
                                        <button type="button" class="btn btn-default btn-xs" data-toggle="off">Off</button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <div id="g_temperatura" style="height: 300px;"></div>
                            </div>
                            <!-- /.box-body-->
                        </div>
                        <!-- /.box -->
                    </div>
                    <!-- /.col -->
                    <div class="col-xs-6">
                        <!-- interactive chart -->
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <i class="fa fa-bar-chart-o"></i>
                                <h3 class="box-title">Umidade</h3>
                                <div class="box-tools pull-right">
                                    Real time
                                    <div class="btn-group" id="f_umidade" data-toggle="btn-toggle">
                                        <button type="button" class="btn btn-default btn-xs active" data-toggle="on">On</button>
                                        <button type="button" class="btn btn-default btn-xs" data-toggle="off">Off</button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <div id="g_umidade" style="height: 300px;"></div>
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

        var listaTemperatura = [];
        var listaUmidade = [];
        $(function () {

            temperatura();
            umidade();
            presenca();
            gases();
            incendio();

            setInterval(function () {
                presenca();
            }, 1 * 3000)

            setInterval(function () {
                gases();
            }, 1 * 3000)

            setInterval(function () {
                incendio();
            }, 1 * 3000)

        });

        function temperatura() {
            var data = [], totalPoints = 30;
            function getRandomData() {
                SmartHouse.SEG.Metodos.SelecionarTemperatura(function (retorno) {
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
                        listaTemperatura.push([i, data[i]]);
                    }
                });
            }
            getRandomData();

            setTimeout(function () {
                var interactive_plot = $.plot("#g_temperatura", [listaTemperatura], {
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
                        min: 20,
                        max: 45,
                        show: true
                    },
                    xaxis: {
                        show: true
                    }
                });

                var updateInterval = 2000; //Fetch data ever x milliseconds
                var realtime = "on"; //If == to on then fetch data every x seconds. else stop fetching
                function update() {

                    interactive_plot.setData([listaTemperatura]);

                    // Since the axes don't change, we don't need to call plot.setupGrid()
                    interactive_plot.draw();
                    if (realtime === "on") {
                        listaTemperatura = []
                        getRandomData()
                        setTimeout(update, updateInterval);
                    }
                }

                //INITIALIZE REALTIME DATA FETCHING
                if (realtime === "on") {
                    update();
                }
                //REALTIME TOGGLE
                $("#f_temperatura .btn").click(function () {
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

        function umidade() {
            var data = [], totalPoints = 50;
            function getRandomData() {
                SmartHouse.SEG.Metodos.SelecionarUmidade(function (retorno) {
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
                        listaUmidade.push([i, data[i]]);
                    }
                });
            }

            getRandomData();
            setTimeout(function () {
                var interactive_plot = $.plot("#g_umidade", [listaUmidade], {
                    grid: {
                        borderColor: "#f3f3f3",
                        borderWidth: 1,
                        tickColor: "#f3f3f3"
                    },
                    series: {
                        shadowSize: 0, // Drawing is faster without shadows
                        color: "#3c8dbc"
                    },
                    lines: {
                        fill: true, //Converts the line chart to area chart
                        color: "#3c8dbc"
                    },
                    yaxis: {
                        min: 0,
                        max: 70,
                        show: true
                    },
                    xaxis: {
                        show: true
                    }
                });

                var updateInterval = 2000; //Fetch data ever x milliseconds
                var realtime = "on"; //If == to on then fetch data every x seconds. else stop fetching
                function update() {

                    interactive_plot.setData([listaUmidade]);

                    // Since the axes don't change, we don't need to call plot.setupGrid()
                    interactive_plot.draw();
                    if (realtime === "on") {
                        listaUmidade = []
                        getRandomData()
                        setTimeout(update, updateInterval);
                    }
                }

                //INITIALIZE REALTIME DATA FETCHING
                if (realtime === "on") {
                    update();
                }
                //REALTIME TOGGLE
                $("#f_umidade .btn").click(function () {
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

        function presenca() {
            SmartHouse.SEG.Metodos.SelecionarPresenca(function (data) {
                for (var x = 0; x < data.length; x++) {
                    if (data[x].IndicadorPresenca) {
                        $("#f_status_" + data[x].CodigoComodo).text("Ocupado");
                        $("#f_status_" + data[x].CodigoComodo).removeClass().addClass("badge bg-orange");
                    }
                    if (!data[x].IndicadorPresenca) {
                        $("#f_status_" + data[x].CodigoComodo).text("Livre");
                        $("#f_status_" + data[x].CodigoComodo).removeClass().addClass("badge bg-blue");
                    }
                    if (data[x].IndicadorPresenca == null) {
                        $("#f_status_" + data[x].CodigoComodo).text(" ---- ");
                        $("#f_status_" + data[x].CodigoComodo).removeClass().addClass("badge bg-grey");
                    }

                    if (data[x].Ativo) {
                        $("#f_aparelho_" + data[x].CodigoComodo).text("Em Funcionamento");
                        $("#f_aparelho_" + data[x].CodigoComodo).removeClass().addClass("badge bg-green");
                    }
                    if (!data[x].Ativo) {
                        $("#f_aparelho_" + data[x].CodigoComodo).text("Não Identificado");
                        $("#f_aparelho_" + data[x].CodigoComodo).removeClass().addClass("badge bg-red");
                    }
                }
            });
        }

        function gases() {
            SmartHouse.SEG.Metodos.SelecionarGases(function (data) {
                if (data) {
                    $("#span-gas").removeClass("bg-green").addClass("bg-red");
                    $("#i-gas").removeClass("fa fa-check").addClass("fa fa-fire");
                    $("#texto-gas").text("Identificado");
                } else {
                    $("#span-gas").removeClass("bg-red").addClass("bg-green");
                    $("#i-gas").removeClass("fa fa-fire").addClass("fa fa-check");
                    $("#texto-gas").text("Não Identificado");
                }
            });
        }

        function incendio() {
            SmartHouse.SEG.Metodos.SelecionarIncendio(function (data) {
                if (data) {
                    $("#span-incendio").removeClass("bg-green").addClass("bg-red");
                    $("#i-incendio").removeClass("fa fa-check").addClass("glyphicon glyphicon-fire");
                    $("#texto-incendio").text("Identificado");
                } else {
                    $("#span-incendio").removeClass("bg-red").addClass("bg-green");
                    $("#i-incendio").removeClass("glyphicon glyphicon-fire").addClass("fa fa-check");
                    $("#texto-incendio").text("Não Identificado");
                }
            });
        }
    </script>
</asp:Content>
