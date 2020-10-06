<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="test.Products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container" style="height:1000px;width:1000px;">
        <table>
            <tr><td>
                <asp:Button ID="Button3" runat="server" Text="批量上新" OnClick="Button3_Click" /></td><td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                                                           </td></tr></table>
        <table id="control" runat="server">
            <tr><td>游戏平台：</td><td>
                <asp:DropDownList ID="platform_id" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="pname" DataValueField="id"></asp:DropDownList></td></tr>
            <tr><td>游戏名：</td><td>
                <asp:DropDownList ID="game_id" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="game_name" DataValueField="id"></asp:DropDownList></td></tr>
            <tr><td>游戏服务器：</td><td>
                <asp:DropDownList ID="service_id" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="service_name" DataValueField="id"></asp:DropDownList></td></tr>
            <tr><td>角色名称：</td><td>
                <asp:TextBox ID="role_name" runat="server"></asp:TextBox></td></tr>
            <tr><td>角色ID：</td><td>
                <asp:TextBox ID="role_id" runat="server"></asp:TextBox></td></tr>
            <tr><td>title</td><td>
                <asp:TextBox ID="title" runat="server"></asp:TextBox></td></tr>
            <tr><td>brief</td><td>
                <asp:TextBox ID="brief" runat="server"></asp:TextBox></td></tr>
            <tr><td>金额：</td><td>
                <asp:TextBox ID="price" runat="server"></asp:TextBox></td></tr>
            <tr><td>密码：</td><td>
                <asp:TextBox ID="password" runat="server"></asp:TextBox></td></tr>
            </table>
            <table>
                <tr>
                <td>
                <asp:Button ID="insert" runat="server" Text="上新" OnClick="insert_Click" /></td><td>
                    <asp:Button ID="select" runat="server" Text="查询" OnClick="select_Click" />
                        &nbsp;<asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="模板" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="update" runat="server" Text="修改" OnClick="update_Click" /></td></tr>
            </table>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="900px" AllowPaging="True" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" EmptyDataText="没有商品，快上新">
                   
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField DeleteText="下架" InsertText="上新" ShowDeleteButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="game_id" HeaderText="游戏" SortExpression="game_id" />
                        <asp:BoundField DataField="service_id" HeaderText="服务器" SortExpression="service_id" />
                        <asp:BoundField DataField="platform_id" HeaderText="平台" SortExpression="platform_id" />
                        <asp:BoundField DataField="role_id" HeaderText="角色ID" SortExpression="role_id" />
                        <asp:BoundField DataField="role_name" HeaderText="角色名" SortExpression="role_name" />
                        <asp:BoundField DataField="title" HeaderText="标题" SortExpression="title" />
                        <asp:BoundField DataField="brief" HeaderText="简介" SortExpression="brief" />
                        <asp:BoundField DataField="password" HeaderText="密码" SortExpression="password" />
                        <asp:BoundField DataField="created_at" HeaderText="上架时间" SortExpression="created_at" />
                        <asp:BoundField DataField="price" HeaderText="金额" SortExpression="price" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <PagerSettings Mode="NextPreviousFirstLast" FirstPageText="第一页" PreviousPageText="上一页" NextPageText="下一页" LastPageText="最后一页" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GMS %>" SelectCommand="SELECT [Id], [game_id], [service_id], [platform_id], [role_id], [role_name], [title], [brief], [password], [created_at], [price] FROM [Goods] WHERE ([saler_id] = @saler_id)" DeleteCommand="DELETE FROM [Goods] WHERE [Id] = @original_Id" InsertCommand="INSERT INTO [Goods] ([game_id], [service_id], [platform_id], [role_id], [role_name], [title], [brief], [password], [created_at], [price]) VALUES (@game_id, @service_id, @platform_id, @role_id, @role_name, @title, @brief, @password, @created_at, @price)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Goods] SET [game_id] = @game_id, [service_id] = @service_id, [platform_id] = @platform_id, [role_id] = @role_id, [role_name] = @role_name, [title] = @title, [brief] = @brief, [password] = @password, [created_at] = @created_at, [price] = @price WHERE [Id] = @original_Id">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="game_id" Type="Int32" />
                        <asp:Parameter Name="service_id" Type="Int32" />
                        <asp:Parameter Name="platform_id" Type="Int32" />
                        <asp:Parameter Name="role_id" Type="String" />
                        <asp:Parameter Name="role_name" Type="String" />
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter Name="brief" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="created_at" DbType="Date" />
                        <asp:Parameter Name="price" Type="Decimal" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="20204" Name="saler_id" SessionField="uid" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="game_id" Type="Int32" />
                        <asp:Parameter Name="service_id" Type="Int32" />
                        <asp:Parameter Name="platform_id" Type="Int32" />
                        <asp:Parameter Name="role_id" Type="String" />
                        <asp:Parameter Name="role_name" Type="String" />
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter Name="brief" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="created_at" DbType="Date" />
                        <asp:Parameter Name="price" Type="Decimal" />
                        <asp:Parameter Name="original_Id" Type="Int32" />
                    </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GMS %>" SelectCommand="SELECT game_name, id, platform_id FROM Game WHERE (platform_id = @id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="platform_id" DefaultValue="3001" Name="id" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:GMS %>" SelectCommand="SELECT service_name, id FROM GameService WHERE (game_id = @gid) AND (platform_id = @pid)">
            <SelectParameters>
                <asp:ControlParameter ControlID="game_id" Name="gid" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="platform_id" Name="pid" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:GMS %>" SelectCommand="SELECT * FROM [Platform]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
