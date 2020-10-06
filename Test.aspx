<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="test.Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        </div>
    </form>
    <script>
function SaveAs()

{

       var fd = new ActiveXObject("MSComDlg.CommonDialog");

       fd.Filter = "Microsoft Office Excel(*.xls)|*.xsl";

       fd.FilterIndex = 2;

      

       // 必须设置MaxFileSize. 否则出错

       fd.MaxFileSize = 128;

 

       // 显示对话框

       fd.ShowSave();

}
    </script>
</body>
</html>
