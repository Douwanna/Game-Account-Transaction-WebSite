<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FH.aspx.cs" Inherits="test.FH" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr><td>买家ID：</td><td>
                    <asp:TextBox ID="uid" runat="server" Text=""></asp:TextBox>
                                  </td></tr>
                <tr><td>买家昵称：</td><td>
                    <asp:TextBox ID="uname" runat="server" Text=""></asp:TextBox>
                                  </td></tr>
                <tr><td>title：</td><td>
                    <asp:TextBox ID="title" runat="server" Text=""></asp:TextBox>
                                  </td></tr>
                <tr><td>订单状态：</td><td>
                                <asp:DropDownList ID="dp_FH" runat="server" AutoPostBack="True" DataSourceID="Order_State_name" DataTextField="type" DataValueField="type"></asp:DropDownList>
                                  </td></tr>
            </table>
            <asp:Button ID="submit" runat="server" Text="提交" /><asp:Button ID="fahuo" runat="server" Text="发货" OnClick="fahuo_Click" /><asp:Button ID="search" runat="server" Text="查询" />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="Order_State" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" DataKeyNames="order_id">
                <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="order_id" HeaderText="order_id" SortExpression="order_id" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                    <asp:BoundField DataField="good_id" HeaderText="good_id" SortExpression="good_id"></asp:BoundField>
                    <asp:BoundField DataField="brief" HeaderText="brief" SortExpression="brief"></asp:BoundField>
                    <asp:BoundField DataField="buyer_id" HeaderText="buyer_id" SortExpression="buyer_id"></asp:BoundField>
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name"></asp:BoundField>
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price"></asp:BoundField>
                    <asp:BoundField DataField="state" HeaderText="state" SortExpression="state"></asp:BoundField>
                    <asp:BoundField DataField="created_at" HeaderText="created_at" SortExpression="created_at"></asp:BoundField>
                </Columns>
                <EditRowStyle BackColor="#2461BF"></EditRowStyle>

                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>

                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

                <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>

                <RowStyle BackColor="#EFF3FB"></RowStyle>

                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

                <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

                <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

                <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="Order_State" ConnectionString='<%$ ConnectionStrings:GMS %>' SelectCommand="SELECT o.id AS order_id, o.good_id, g.brief, o.buyer_id, a.name, o.price, s.type AS state, o.created_at FROM [Order] AS o INNER JOIN Goods AS g ON o.good_id = g.Id INNER JOIN State AS s ON o.state = s.state_id INNER JOIN admin_user AS a ON o.buyer_id = a.id"></asp:SqlDataSource>
            <asp:SqlDataSource runat="server" ID="Order_State_name" ConnectionString='<%$ ConnectionStrings:GMS %>' SelectCommand="SELECT * FROM [State]"></asp:SqlDataSource>
            <asp:SqlDataSource runat="server" ID="Order_State1"></asp:SqlDataSource>
            <asp:SqlDataSource runat="server" ID="Order_State2"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
