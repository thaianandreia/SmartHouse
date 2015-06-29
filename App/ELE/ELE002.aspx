<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ELE002.aspx.cs" Inherits="ELE002" MasterPageFile="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-header">Elétrica</div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <form id="form1" runat="server" action="ELE002.aspx">
        <div class="box">
            <div class="box-header">
                <i class="fa fa-bolt"></i>
                <h3 class="box-title text-blue">Controle Interativo</h3>
            </div>
            <div class="box-body">
                <div class="row">
                    <%  var listaReles = relesBLL.Selecionar();

                        foreach (var item in listaReles)
                        {  %>

                    <div class="col-lg-2 col-md-3 col-sm-3">
                        <label class="control-label" for="switch_<%= item.Codigo %>"><%= item.Descricao %></label>
                        <div class="box-group">
                            <input
                                type="checkbox"
                                id="switch_<%= item.Nome %>"
                                class="switch"
                                data-size="mini"
                                data-on-color="success"
                                data-codigo="<%= item.Nome %>"
                                <%= item.Ativo ? "checked" : "" %> />
                        </div>
                    </div>
                    <%  }  %>
                </div>
            </div>

            <div class="box-body"></div>
            <div class="box-header">
                <i class="fa fa-clock-o"></i>
                <h3 class="box-title text-blue">Timer</h3>
            </div>
            <div class="box-body">
            <div class="row">
                <%  
                    foreach (var item in listaReles)
                    {  %>
                <div class="col-lg-2 col-md-3 col-sm-3">
                    <label class="control-label" for="motion_<%= item.Codigo %>"><%= item.Descricao %></label>
                    <div class="box-group">
                        <input
                            type="checkbox"
                            id="motion_<%= item.Nome %>"
                            class="motion"
                            data-size="mini"
                            data-on-color="success"
                            data-codigo="<%= item.Nome %>"
                            <%= item.Ativo ? "checked" : "" %> />
                    </div>
                </div>
                <%  }  %>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="form-group">
                    <label>Delay em segundos (s)</label>
                    <input type="text" style="width:100px;text-align:right" class="form-control" id="delay" value="2" />
                </div>
                </div>
            </div>
        </div>
            </div>

        <div class="box">
            <div class="box-header">
                <i class="fa fa-bar-chart-o"></i>
                <h3 class="box-title text-blue">Gráfico em tempo real</h3>
            </div>
            <div class="box-body">
                <div class="nav-tabs-custom">
                    <div class="row">
                        <div class="col-xs-6">
                            <!-- interactive chart -->
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <i class="fa fa-bar-chart-o"></i>
                                    <h3 class="box-title">Tensão</h3>
                                    <div class="box-tools pull-right">
                                        Real time
                                    <div class="btn-group" id="f_tensao" data-toggle="btn-toggle">
                                        <button type="button" class="btn btn-default btn-xs active" data-toggle="on">On</button>
                                        <button type="button" class="btn btn-default btn-xs" data-toggle="off">Off</button>
                                    </div>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <div id="g_tensao" style="height: 300px;"></div>
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
                                    <h3 class="box-title">Corrente</h3>
                                    <div class="box-tools pull-right">
                                        Real time
                                    <div class="btn-group" id="f_corrente" data-toggle="btn-toggle">
                                        <button type="button" class="btn btn-default btn-xs active" data-toggle="on">On</button>
                                        <button type="button" class="btn btn-default btn-xs" data-toggle="off">Off</button>
                                    </div>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <div id="g_corrente" style="height: 300px;"></div>
                                </div>
                                <!-- /.box-body-->
                            </div>
                            <!-- /.box -->
                        </div>
                        <!-- /.col -->
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <script src="../assets/plugins/flot/jquery.flot.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        var listaTensao = [];
        var listaCorrente = [];

        $(document).ready(function () {

            SmartHouse.ELE.Metodos.Gravar("<%= IP_Energia %>");

            setInterval(function () {
                SmartHouse.ELE.Metodos.Gravar("<%= IP_Energia %>");
            }, 2000);

            tensao();
            corrente();
            $(".switch").bootstrapSwitch().on('switchChange.bootstrapSwitch', function (event, state) {
                var codigo = $("#" + event.currentTarget.id).data("codigo");
                if (codigo < 10)
                    codigo = codigo[1];

                $.ajax({
                    type: "POST",
                    url: "http://<%= IP_Energia %>/toggle/" + codigo,
                    contentType: "application/jsonp; charset=utf-8",
                    dataType: "jsonp"
                });
            });

            $(".motion").bootstrapSwitch().on('switchChange.bootstrapSwitch', function (event, state) {
                var codigo = $("#" + event.currentTarget.id).data("codigo");
                if (codigo < 10)
                    codigo = codigo[1];

                $.ajax({
                    type: "POST",
                    url: "http://<%= IP_Energia %>/motion/" + codigo + "/"+$("#delay").val(),
                    contentType: "application/jsonp; charset=utf-8",
                    dataType: "jsonp"
                });
            });
        });



        function tensao() {
            var data = [], totalPoints = 30;
            function getRandomData() {
                SmartHouse.ELE.Metodos.SelecionarTensao(function (retorno) {
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
                        listaTensao.push([i, data[i]]);
                    }
                });
            }
            getRandomData();

            setTimeout(function () {
                var interactive_plot = $.plot("#g_tensao", [listaTensao], {
                    grid: {
                        borderColor: "#f3f3f3",
                        borderWidth: 1,
                        tickColor: "#f3f3f3"
                    },
                    series: {
                        shadowSize: 0, // Drawing is faster without shadows
                        color: "#FFFF33"
                    },
                    lines: {
                        fill: true, //Converts the line chart to area chart
                        color: "#FFFF33"
                    },
                    yaxis: {
                        min: 150,
                        max: 300,
                        show: true
                    },
                    xaxis: {
                        show: true
                    }
                });

                var updateInterval = 2000;
                var realtime = "on";
                function update() {

                    interactive_plot.setData([listaTensao]);

                    interactive_plot.draw();
                    if (realtime === "on") {
                        listaTemperatura = []
                        getRandomData()
                        setTimeout(update, updateInterval);
                    }
                }

                if (realtime === "on") {
                    update();
                }

                $("#f_tensao .btn").click(function () {
                    if ($(this).data("toggle") === "on") {
                        realtime = "on";
                    }
                    else {
                        realtime = "off";
                    }
                    update();
                });
            }, 1000);
        }

        function corrente() {
            var data = [], totalPoints = 30;
            function getRandomData() {
                SmartHouse.ELE.Metodos.SelecionarCorrente(function (retorno) {
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
                        listaCorrente.push([i, data[i]]);
                    }
                });
            }
            getRandomData();

            setTimeout(function () {
                var interactive_plot = $.plot("#g_corrente", [listaCorrente], {
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
                        min: 0,
                        max: 300,
                        show: true
                    },
                    xaxis: {
                        show: true
                    }
                });

                var updateInterval = 2000;
                var realtime = "on";
                function update() {

                    interactive_plot.setData([listaCorrente]);

                    interactive_plot.draw();
                    if (realtime === "on") {
                        listaCorrente = []
                        getRandomData()
                        setTimeout(update, updateInterval);
                    }
                }

                if (realtime === "on") {
                    update();
                }

                $("#f_corrente .btn").click(function () {
                    if ($(this).data("toggle") === "on") {
                        realtime = "on";
                    }
                    else {
                        realtime = "off";
                    }
                    update();
                });
            }, 1000);
        }
    </script>
</asp:Content>
