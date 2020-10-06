<%@ Page Title="个人中心" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PersonalCenter.aspx.cs" Inherits="test.PersonalCenter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
    <li><a href="Home.aspx">交易狗</a></li>
    <li class="active">个人中心</li>
</ul>
        <div class="row clearfix">
		<div class="container" style="width:50%;">
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
                <a href="Personal_Info.aspx">
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
        <div id="collapseOne" class="panel-collapse collapse">
            <div class="panel-heading">
            <h4 class="panel-title">
                <a href="Order.aspx?uid=<%=Session["uid"].ToString()%>">我的订单</a>                
            </h4>
                </div>
        
            <div class="panel-heading">
            <h4 class="panel-title">
                <a href="SH.aspx">
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
        <div id="collapseTwo" class="panel-collapse collapse">
            <div class="panel-heading">
            <h4 class="panel-title">
                <a  href="Products.aspx?uid=<%=Session["uid"].ToString()%>">
                我的商品
                </a>
            </h4>
        </div>
            <div class="panel-heading">
            <h4 class="panel-title">
                <a href="SHCL.aspx">
                我的售后
                </a>
            </h4>
        </div>
            <div class="panel-heading">
            <h4 class="panel-title">
                <a href="FH.aspx">
                待发货
                </a>
            </h4>
        </div>
        </div>
        
    </div>
    </div>
    </div>
	</div>
    <script>

    </script>
</asp:Content>
