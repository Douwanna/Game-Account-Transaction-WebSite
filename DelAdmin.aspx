<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DelAdmin.aspx.cs" Inherits="test.Views.SYSModel.DelAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title> 
</head>
<body>
    <div>
    <form id="form1" runat="server">
   <table>
       <tr><th></th><th></th><th></th></tr>
       <tr><td>用户编号：</td><td><asp:TextBox ID="user_id" runat="server"></asp:TextBox></td><td></td></tr>
       <tr><td>用户名：</td><td><asp:TextBox ID="user_name" runat="server"></asp:TextBox></td><td></td></tr>
       <tr><td>用户权限权限：</td><td>
           <asp:CheckBoxList ID="authoraty" runat="server" RepeatDirection="Horizontal">
               <asp:ListItem>卖家</asp:ListItem>
               <asp:ListItem>代练</asp:ListItem>
           </asp:CheckBoxList></td><td></td></tr>
       <tr><td>信誉：</td><td><asp:TextBox ID="credit" runat="server" Enabled="false"></asp:TextBox></td>
           <td>
               <asp:Button ID="Button2" runat="server" Text="查找" />    </tr>
   </table>  
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" AllowSorting="True">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
            <asp:BoundField DataField="sex" HeaderText="sex" SortExpression="sex" />
            <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
            <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
            <asp:BoundField DataField="credit" HeaderText="credit" SortExpression="credit" />
            <asp:CheckBoxField DataField="isAdmin" HeaderText="isAdmin" SortExpression="isAdmin" />
            <asp:CheckBoxField DataField="isSaler" HeaderText="isSaler" SortExpression="isSaler" />
            <asp:CheckBoxField DataField="isTrainer" HeaderText="isTrainer" SortExpression="isTrainer" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GMS %>" SelectCommand="SELECT [id], [name], [sex], [phone], [address], [credit], [isAdmin], [isSaler], [isTrainer] FROM [admin_user]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [admin_user] WHERE [id] = @original_id AND [name] = @original_name AND [sex] = @original_sex AND [phone] = @original_phone AND (([address] = @original_address) OR ([address] IS NULL AND @original_address IS NULL)) AND (([credit] = @original_credit) OR ([credit] IS NULL AND @original_credit IS NULL)) AND [isAdmin] = @original_isAdmin AND [isSaler] = @original_isSaler AND [isTrainer] = @original_isTrainer" InsertCommand="INSERT INTO [admin_user] ([name], [sex], [phone], [address], [credit], [isAdmin], [isSaler], [isTrainer]) VALUES (@name, @sex, @phone, @address, @credit, @isAdmin, @isSaler, @isTrainer)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [admin_user] SET [name] = @name, [sex] = @sex, [phone] = @phone, [address] = @address, [credit] = @credit, [isAdmin] = @isAdmin, [isSaler] = @isSaler, [isTrainer] = @isTrainer WHERE [id] = @original_id AND [name] = @original_name AND [sex] = @original_sex AND [phone] = @original_phone AND (([address] = @original_address) OR ([address] IS NULL AND @original_address IS NULL)) AND (([credit] = @original_credit) OR ([credit] IS NULL AND @original_credit IS NULL)) AND [isAdmin] = @original_isAdmin AND [isSaler] = @original_isSaler AND [isTrainer] = @original_isTrainer">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
            <asp:Parameter Name="original_sex" Type="String" />
            <asp:Parameter Name="original_phone" Type="String" />
            <asp:Parameter Name="original_address" Type="String" />
            <asp:Parameter Name="original_credit" Type="Int32" />
            <asp:Parameter Name="original_isAdmin" Type="Boolean" />
            <asp:Parameter Name="original_isSaler" Type="Boolean" />
            <asp:Parameter Name="original_isTrainer" Type="Boolean" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="sex" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="credit" Type="Int32" />
            <asp:Parameter Name="isAdmin" Type="Boolean" />
            <asp:Parameter Name="isSaler" Type="Boolean" />
            <asp:Parameter Name="isTrainer" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="sex" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="credit" Type="Int32" />
            <asp:Parameter Name="isAdmin" Type="Boolean" />
            <asp:Parameter Name="isSaler" Type="Boolean" />
            <asp:Parameter Name="isTrainer" Type="Boolean" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
            <asp:Parameter Name="original_sex" Type="String" />
            <asp:Parameter Name="original_phone" Type="String" />
            <asp:Parameter Name="original_address" Type="String" />
            <asp:Parameter Name="original_credit" Type="Int32" />
            <asp:Parameter Name="original_isAdmin" Type="Boolean" />
            <asp:Parameter Name="original_isSaler" Type="Boolean" />
            <asp:Parameter Name="original_isTrainer" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </form>
    </div>
</body>
</html>
