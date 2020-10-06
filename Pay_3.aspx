<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pay_3.aspx.cs" Inherits="test.Pay_3" %>
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
                        style="width: 75%;">
                    </div>
                </div>
            </td>
        </tr>
    </table>
     <div style="padding-left: 80px; padding-right: 80px; width: 80%; margin: 0 auto;">
        <div class="panel panel-default">
    <div class="panel-body">
        <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2::53" alt="点击这里联系客服" title="点击这里联系客服"/></a>
        <br />
        <br />
        <br />
        <br />
        <asp:Button CssClass="btn btn-warning" ID="Button1" runat="server" Text="我已经沟通完毕" OnClick="Button1_Click" />
        <span style="width:90px;"></span>
        <asp:Button CssClass="btn btn-info" ID="Button2" runat="server" Text="取消订单" OnClick="Button2_Click" />
    </div>
</div>
    </div>
</asp:Content>
