<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Buyer_Main.aspx.cs" Inherits="test.Views.SYSModel.Buyer_Main" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
    <div class="container" style="width:25%;float:left;">
        <div class="panel-group" id="accordion">
    <div class="panel panel-default">
        <!--Personal Center-->
        <div class="panel-heading" id="person">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" 
                href="#collapseThree">
                个人信息管理
                </a>
            </h4>
        </div>
        <div id="collapseThree" class="panel-collapse collapse in">
            <div class="panel-heading">
            <h4 class="panel-title">
                <a >
                修改个人信息
                </a>
            </h4>
        </div>
            
        </div>
        <!--buyer-->
        <div class="panel-heading" id="buyer">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" 
                href="#collapseOne">
                我是买家
                </a>
            </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in">
            <div class="panel-heading">
            <h4 class="panel-title">
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">我的订单</asp:LinkButton>                
            </h4>
                </div>
        
            <div class="panel-heading">
            <h4 class="panel-title">
                <a >
                我的售后
                </a>
            </h4>
        </div>
        </div>
        <!--saler-->
        <div class="panel-heading" id="saler">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" 
                href="#collapseTwo">
                我是卖家
                </a>
            </h4>
        </div>
        <div id="collapseTwo" class="panel-collapse collapse in">
            <div class="panel-heading">
            <h4 class="panel-title">
                <a >
                我的商品
                </a>
            </h4>
        </div>
            <div class="panel-heading">
            <h4 class="panel-title">
                <a >
                我的售后
                </a>
            </h4>
        </div>
        </div>
        
    </div>
    </div>
    </div>
        <!--main page-->
        <div class="container" style="width:75%;height:100%;float:right;">
            <asp:Panel ID="Panel1" runat="server" BorderStyle="None" Height="1000px" Width="1000px">
                <iframe id = "iframe" style="border:none;height:inherit;width:inherit;" src="AddGame.aspx"></iframe>
            </asp:Panel>
            
            <div id="Order" class="panel-collapse collapse">
            <div class="panel-body">
                Order anim keffiyeh helvetica, craft beer labore wes anderson cred 
                nesciunt sapiente ea proident. Ad vegan excepteur butcher vice 
                lomo.
            </div>
        </div>
            <div id="SH" class="panel-collapse collapse">
            <div class="panel-body">
                SH anim keffiyeh helvetica, craft beer labore wes anderson cred 
                nesciunt sapiente ea proident. Ad vegan excepteur butcher vice 
                lomo.
            </div>
        </div>
             <div id="Goods" class="panel-collapse collapse">
            <div class="panel-body">
                Goods anim keffiyeh helvetica, craft beer labore wes anderson cred 
                nesciunt sapiente ea proident. Ad vegan excepteur butcher vice 
                lomo.
            </div>
        </div>
             <div id="SHCL" class="panel-collapse collapse">
            <div class="panel-body">
                SHCL anim keffiyeh helvetica, craft beer labore wes anderson cred 
                nesciunt sapiente ea proident. Ad vegan excepteur butcher vice 
                lomo.
            </div>
        </div>
             <div id="PC" class="panel-collapse collapse">
            <div class="panel-body">
                PC anim keffiyeh helvetica, craft beer labore wes anderson cred 
                nesciunt sapiente ea proident. Ad vegan excepteur butcher vice 
                lomo.
            </div>
        </div>
        </div>
        </div>
    
<script>
</script>
</asp:Content>
