<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ELE001.aspx.cs" Inherits="ELE001" MasterPageFile="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-header">Elétrica</div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <form id="form1" runat="server" action="ELE001.aspx">
        <div class="box">
            <div class="box-header">
                <i class="fa fa-bar-chart-o"></i>
                <h3 class="box-title text-blue">Gráficos em Tempo Real</h3>
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
        });
    </script>
</asp:Content>
