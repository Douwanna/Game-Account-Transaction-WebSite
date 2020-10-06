<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pay_2.aspx.cs" Inherits="test.Pay_2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="padding-left: 80px; padding-right: 80px; width: 80%; margin: 0 auto;">
        <tr>
            <td
                style="width: 25%; text-align: center;">1、确认商品信息，填写订单
            </td>
            <td
                style="width: 25%; text-align: center;">2、选择支付方式
            </td>
            <td
                style="width: 25%; text-align: center;">3、联系客服收货
            </td>
            <td
                style="width: 25%; text-align: center;">4、交易成功
            </td>
        </tr>
    </table>
    <table style="padding-left: 80px; padding-right: 80px; width: 80%; margin: 0 auto;">
        <tr>
            <td>
                <div class="progress">
                    <div class="progress-bar progress-bar-success" role="progressbar"
                        aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                        style="width: 50%;">
                    </div>
                </div>
            </td>
        </tr>
    </table>
     <div style="padding-left: 80px; padding-right: 80px; width: 80%; margin: 0 auto;">
        <div class="panel panel-default" style="padding-left:80px;">
    <div class="panel-body">
       <table>
            <tr><td><img src="image/right.png"/></td><td>订单提交成功，请及时付款!</td></tr>
            <tr><td>订单号：</td><td>
                <asp:Label ID="oid" runat="server" Text="Label"></asp:Label></td></tr>
            <tr><td>操作系统：</td><td>
                <asp:Label ID="pname" runat="server" Text="Label"></asp:Label></td></tr>
            <tr><td>服务器：</td><td>
                <asp:Label ID="sname" runat="server" Text="Label"></asp:Label></td></tr>
            <tr><td>商品名称：</td><td>
                <asp:Label ID="title" runat="server" Text="Label"></asp:Label></td></tr>
        </table>
    </div>
            </div>
            <div class="panel panel-default">
    <div class="panel-heading">
        请选择以下支付方式完成付款
    </div>
    <div class="panel-body" style="padding-left:80px;">
        <asp:RadioButton ID="RadioButton1" runat="server" Checked="true" Text="支付宝"/>
        <br />
        总价：
        <br />
        实付：
        <br />
        <asp:Button CssClass="btn btn-warning" ID="Button1" runat="server" Text="确认支付" OnClick="Button1_Click" />
    </div>
                </div>

    </div>
</asp:Content>
