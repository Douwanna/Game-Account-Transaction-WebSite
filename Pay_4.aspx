<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pay_4.aspx.cs" Inherits="test.Pay_4" %>
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
                        style="width: 99.999999%;">
                    </div>
                </div>
            </td>
        </tr>
    </table>
     <div style="padding-left: 80px; padding-right: 80px; width: 80%; margin: 0 auto;">
        <div class="panel panel-default">
    <div class="panel-body" style="padding-left:80px;">
        <table>
            <tr><td><img src="image/right.png"/></td><td>恭喜，交易成功!</td></tr>
            <tr><td>订单号：</td><td>
                <asp:Label ID="oid" runat="server" Text="Label"></asp:Label></td></tr>
            <tr><td>操作系统：</td><td>
                <asp:Label ID="pname" runat="server" Text="Label"></asp:Label></td></tr>
            <tr><td>服务器：</td><td>
                <asp:Label ID="sname" runat="server" Text="Label"></asp:Label></td></tr>
            <tr><td>商品名称：</td><td>
                <asp:Label ID="title" runat="server" Text="Label"></asp:Label></td></tr>
        </table>
        密码：<asp:Label ID="Label1" runat="server" Text="" BackColor="#CCCCCC"></asp:Label>
        <br />
        <div id="AutoJumpPage">
            欢迎您，本页将在<span id="time" style="color: #FF0000"></span>秒后自动跳转至<a href="Home.aspx">首页</a>
            <br />
            <br />
            如需立即跳转，请直接点击 <a href="Home.aspx" style="color: #FF00FF">立即跳转>></a>
        </div>
    </div>
</div>
    </div>
    <script type="text/javascript">
        var i = 5;

        // 获取登录事件，并处理自动跳转
        window.onload = function JumpPage() {
            if (i > 0) {
                document.getElementById("time").innerText = i;
                i--;
            }                
            else {
                document.getElementById("time").innerText = 0;
                location.replace("Home.aspx");
            }
            // 计时为0后，立即跳转           

            setTimeout(JumpPage, 1000);
        }
    </script>
</asp:Content>
