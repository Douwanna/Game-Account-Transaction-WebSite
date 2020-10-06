<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pay_1.aspx.cs" Inherits="test.Pay_1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--进度条-->
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
                        style="width: 25%;">
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <!--内容-->
    <div style="padding-left: 80px; padding-right: 80px; width: 80%; margin: 0 auto;">
        <div class="panel panel-default">
    <div class="panel-heading">
        商品信息
    </div>
    <div class="panel-body" style="padding-left:80px;">
        <table>
            <tr>
                <td>商品名称：</td>
                <td>
                    <asp:Label ID="title" runat="server" Text="title"></asp:Label></td>
            </tr>
            <tr>
                <td>游戏：</td>
                <td>
                    <asp:Label ID="gname" runat="server" Text="gname"></asp:Label></td>
            </tr>
            <tr>
                <td>操作系统：</td>
                <td>
                    <asp:Label ID="pname" runat="server" Text="pname"></asp:Label></td>
            </tr>
            <tr>
                <td>服务器：</td>
                <td>
                    <asp:Label ID="sname" runat="server" Text="sname"></asp:Label></td>
            </tr>
            <tr>
                <td>单价：</td>
                <td style="color: red;">
                    <asp:Label ID="price" runat="server" Text="price"></asp:Label></td>
            </tr>
        </table>
    </div>
</div>
         <div class="panel panel-default">
    <div class="panel-heading">
        收货信息
    </div>
    <div class="panel-body" style="padding-left:80px;">
        <table>
            <tr><td>手机号码:</td><td>
                <asp:TextBox ID="TextBox1" runat="server" Enabled="False" TextMode="Phone"></asp:TextBox></td></tr>
        </table>
    </div>
</div>
        
         <div class="panel panel-default">
    <div class="panel-heading">
        选择客服(交易失败不收取服务费)
    </div>
    <div class="panel-body" style="padding-left:80px;">
        <asp:CheckBox ID="CheckBox1"  runat="server" AutoPostBack="True" Text="高级客服(100%顾客的选择，官方值得信赖)">
        </asp:CheckBox>
        <p style="color:gray">网站建站初期，只有一位客服，请谅解</p>
    </div>
</div>
         <div class="panel panel-default">
    <div class="panel-heading">
        提交订单
    </div>
    <div class="panel-body" style="padding-left:80px;">
        <table class="table">
            <tr><td>购买数</td><td>
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td></tr>
            <tr><td>原价格</td><td>
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td></tr>
            <tr><td>服务费</td><td>0</td></tr>
            
        </table>
        点击提交订单表示已阅读并同意 <a>《交易猫平台虚拟物品交易规则》</a> <a>《交易猫用户服务协议及规则》</a><a>《保险购买须知》</a>
        <div style="float:right;width:100%;">
            实付款:<h4>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h4>
            <asp:Button CssClass="btn btn-warning" ID="Button1" runat="server" Text="提交订单" OnClick="Button1_Click" />            

        </div>
    </div>
</div>
    </div>
</asp:Content>
