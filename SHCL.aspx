<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SHCL.aspx.cs" Inherits="test.Views.SYSModel.SHCL" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 27px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <th></th>
            </tr>
            <tr><td>按订单号查询：</td><td>
                <asp:TextBox ID="order_id" runat="server" TextMode="Number"></asp:TextBox></td></tr>
            <tr><td>按售货号查询：</td><td>
                <asp:TextBox ID="Id" runat="server" TextMode="Number"></asp:TextBox></td></tr>
            <tr><td>按卖家查询：</td><td>
                <asp:TextBox ID="saler_id" runat="server" TextMode="Number"></asp:TextBox></td></tr>
            <tr><td>按买家查询：</td><td>
                <asp:TextBox ID="buyer_id" runat="server" TextMode="Number"></asp:TextBox></td></tr>
            <tr><td>
                <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click" /></td></tr>
            <tr><td class="auto-style1">更新售后进度：</td><td class="auto-style1">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="d_type" DataValueField="d_type"></asp:DropDownList></td></tr>
            <tr><td>
                <asp:Button ID="Button2" runat="server" Text="更新" OnClick="Button2_Click" /></td></tr>
        </table>
         <div style="text-align:center;">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" Width="98%" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" >
                        </asp:BoundField>
                        <asp:BoundField DataField="order_id" HeaderText="order_id" SortExpression="order_id">
                        </asp:BoundField>
                        <asp:BoundField DataField="process" HeaderText="process" SortExpression="process" >
                        </asp:BoundField>
                        <asp:BoundField DataField="reason" HeaderText="reason" SortExpression="reason" >
                        </asp:BoundField>
                        <asp:BoundField DataField="saler_id" HeaderText="saler_id" SortExpression="saler_id" >
                        </asp:BoundField>
                        <asp:BoundField DataField="buyer_id" HeaderText="buyer_id" SortExpression="buyer_id" >
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GMS %>" SelectCommand="SELECT * FROM [sh_to_show]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GMS %>" SelectCommand="SELECT * FROM [D_P]"></asp:SqlDataSource>
                </div>                
            <!--有无订单显示-->
                <div style="text-align:center;font-size:30px;"></div>
         
    </form>
</body>
</html>
