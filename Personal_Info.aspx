<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Personal_Info.aspx.cs" Inherits="test.Personal_Info" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="ddnr">
                <div id="ddnr1" style="width:50%;">
                    <div style="text-align:center;">
                        <asp:ImageButton ID="ImageButton2" runat="server" Height="150px" Width="150px" BorderStyle="Solid" BorderColor="White" BorderWidth="5px"  CausesValidation="False" Enabled="False" EnableTheming="False" EnableViewState="False" />                   
                        
                        <div style="margin-left:50px;"><asp:FileUpload ID="FileUpload1" runat="server" ToolTip="点击选择头像" Width="80%" /></div>
                        <asp:Button ID="Button3" runat="server" Text="更换头像" Height="40px" BorderStyle="None" BackColor="#3399FF" Font-Size="15px" ForeColor="White" Width="120px" />
                      
                    </div>
                    <div style="clear:both;"></div>
                    <div>账号:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></div>
                    <div>设置密码&nbsp;&nbsp;&nbsp;&nbsp;<a style="color:#14b9c8"; href="MMXG.aspx">修改密码</a></div>
                    <div>用户名:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox1" runat="server" Height="40px" Width="300px"></asp:TextBox></div>
                    <div>手机号:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox2" runat="server" Height="40px" Width="300px"></asp:TextBox></div>
                    <div style="width:60%;">
                    <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" GroupName="as" Text="男" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RadioButton ID="RadioButton2" runat="server" GroupName="as" Text="女" />
                    </div>
                    <div style="text-align:center; line-height:10px;">
                        
                        <asp:Button ID="Button2" runat="server" Text="保存" Height="50px" Width="100px" CausesValidation="False" EnableTheming="False" EnableViewState="False"  UseSubmitBehavior="False" /></div>
                </div>
            </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    </form>
</body>
</html>
