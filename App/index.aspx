<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" MasterPageFile="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Dashboard - Período 05/2015</h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
        <li class="active">Dashboard</li>
    </ol>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <form id="form1" runat="server">

        <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-aqua"><i class="fa fa-tint white"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Consumo de àgua</span>
                        <span class="info-box-number">26<small>m³</small></span>
                        <span class="info-box-number">R$ 121,00</span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-yellow"><i class="fa fa-bolt"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Consumo de energia</span>
                        <span class="info-box-number">157,8 Kwh</span>
                        <span class="info-box-number">R$ 210,00</span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->
            <!-- fix for small devices only -->
            <div class="clearfix visible-sm-block"></div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-green"><i class="fa fa-money"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Comparação 04/2015</span>
                        <span class="info-box-number"> -2,7<small>%</small></span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->
            <div class="col-md-3 col-sm-6 col-xs-12">                
                <div class="info-box">
                    <span class="info-box-icon bg-orange"><i class="fa fa-clock-o"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Previsão 06/2015</span>
                        <span class="info-box-number">R$ 327,89</span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Consumo Semestral</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-8">
                                <p class="text-center">
                                    <strong>Período: 1 Dez, 2014 - 31 Mai, 2015</strong>
                                </p>
                                <div class="chart">
                                    <!-- Sales Chart Canvas -->
                                    <canvas id="salesChart" height="180"></canvas>
                                </div>
                                <!-- /.chart-responsive -->
                            </div>
                            <!-- /.col -->
                            <div class="col-md-4">
                                <p class="text-center">
                                    <strong>Metas de Consumo</strong>
                                </p>
                                <div class="progress-group">
                                    <span class="progress-text">Água</span>
                                    <span class="progress-number"><b>R$ 1.257,00</b>/R$ 1.500,00</span>
                                    <div class="progress sm">
                                        <div class="progress-bar progress-bar-aqua" style="width: 83.8%"></div>
                                    </div>
                                </div>
                                <!-- /.progress-group -->
                                <div class="progress-group">
                                    <span class="progress-text">Energia</span>
                                    <span class="progress-number"><b>R$ 1.389,00</b>/R$ 1.500,00</span>
                                    <div class="progress sm">
                                        <div class="progress-bar progress-bar-red" style="width: 92.6%"></div>
                                    </div>
                                </div>
                                <!-- /.progress-group -->
                                <div class="progress-group">
                                    <span class="progress-text">Consumo Total</span>
                                    <span class="progress-number"><b>R$ 2.646,00</b>/R$ 3.000,00</span>
                                    <div class="progress sm">
                                        <div class="progress-bar progress-bar-green" style="width: 88.2%"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- ./box-body -->
                    <div class="box-footer">
                        <div class="row">
                            <div class="col-sm-3 col-xs-6">
                                <div class="description-block border-right">
                                    <span class="description-percentage text-green"><i class="fa fa-caret-down"></i>6,9%</span>
                                    <h5 class="description-header">R$ 2.829,00</h5>
                                    <span class="description-text">Comparação semestre anterior</span>
                                </div>
                                <!-- /.description-block -->
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-3 col-xs-6">
                                <div class="description-block border-right">
                                    <span class="description-percentage text-red"><i class="fa fa-caret-up"></i>1,03%</span>
                                    <h5 class="description-header">R$ 2.750,00</h5>
                                    <span class="description-text">Previsao próximo semestre</span>
                                </div>
                                <!-- /.description-block -->
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-3 col-xs-6">
                                <div class="description-block border-right">
                                    <span class="description-percentage text-blue"><i class="fa fa-circle"></i></span>
                                    <h5 class="description-header">R$ 471,50</h5>
                                    <span class="description-text">Média Mensal</span>
                                </div>
                                <!-- /.description-block -->
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-3 col-xs-6">
                                <div class="description-block">
                                    <span class="description-percentage text-blue"><i class="fa fa-circle"></i></span>
                                    <h5 class="description-header">R$ 2.741,00</h5>
                                    <span class="description-text">Média Semestral</span>
                                </div>
                                <!-- /.description-block -->
                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.box-footer -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">    
    <!-- ChartJS 1.0.1 -->
    <script type="text/javascript">
        $(document).ready(function () {
            var salesChartCanvas = $("#salesChart").get(0).getContext("2d");
            // This will get the first returned node in the jQuery collection.
            var salesChart = new Chart(salesChartCanvas);

            var salesChartData = {
                labels: ["Dezembro", "Janeiro", "Fevereiro", "Março", "Abril", "Maio"],
                datasets: [
                  {
                      label: "Água",
                      fillColor: "rgb(210, 214, 222)",
                      strokeColor: "rgb(210, 214, 222)",
                      pointColor: "rgb(210, 214, 222)",
                      pointStrokeColor: "#c1c7d1",
                      pointHighlightFill: "#fff",
                      pointHighlightStroke: "rgb(220,220,220)",
                      data: [230, 270, 215, 230, 179, 180]
                  },
                  {
                      label: "Luz",
                      fillColor: "rgba(60,141,188,0.9)",
                      strokeColor: "rgba(60,141,188,0.8)",
                      pointColor: "#3b8bba",
                      pointStrokeColor: "rgba(60,141,188,1)",
                      pointHighlightFill: "#fff",
                      pointHighlightStroke: "rgba(60,141,188,1)",
                      data: [228, 236, 247, 205, 198, 203]
                  }
                ]
            };


            var salesChartOptions = {
                //Boolean - If we should show the scale at all
                showScale: true,
                //Boolean - Whether grid lines are shown across the chart
                scaleShowGridLines: false,
                //String - Colour of the grid lines
                scaleGridLineColor: "rgba(0,0,0,.05)",
                //Number - Width of the grid lines
                scaleGridLineWidth: 1,
                //Boolean - Whether to show horizontal lines (except X axis)
                scaleShowHorizontalLines: true,
                //Boolean - Whether to show vertical lines (except Y axis)
                scaleShowVerticalLines: true,
                //Boolean - Whether the line is curved between points
                bezierCurve: true,
                //Number - Tension of the bezier curve between points
                bezierCurveTension: 0.3,
                //Boolean - Whether to show a dot for each point
                pointDot: false,
                //Number - Radius of each point dot in pixels
                pointDotRadius: 4,
                //Number - Pixel width of point dot stroke
                pointDotStrokeWidth: 1,
                //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
                pointHitDetectionRadius: 20,
                //Boolean - Whether to show a stroke for datasets
                datasetStroke: true,
                //Number - Pixel width of dataset stroke
                datasetStrokeWidth: 2,
                //Boolean - Whether to fill the dataset with a color
                datasetFill: true,
                //String - A legend template
               
                //Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
                maintainAspectRatio: false,
                //Boolean - whether to make the chart responsive to window resizing
                responsive: true
            };

            //Create the line chart
            salesChart.Line(salesChartData, salesChartOptions);

        });
           
    </script>
</asp:Content>
