<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forget.aspx.cs" Inherits="test.Forget" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<webopt:BundleReference runat="server" Path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <title>密码重置</title>
	
</head>
<body>
    <form id="form1" runat="server">
      <div class="container">
	<div class="row clearfix">
		<div class="col-md-4 column">
		</div>
		<div class="col-md-4 column">
			<h3>
				密码重置
			</h3>
			<div role="form">
				<div class="form-group">
					 <label for="InputPhone">输入注册手机号</label><asp:TextBox runat="server" TextMode="Phone" ValidateRequestMode="Enabled" CssClass="form-control" ID="InputPhone"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="(\(\d{3}\)|\d{3}-)?\d{8}" runat="server" ErrorMessage="请输入正确的手机号码" ForeColor="Red" ControlToValidate="InputPhone"></asp:RegularExpressionValidator>
				</div>
				<div class="form-group">
					 <label for="exampleInputPassword1">输入新密码</label><asp:TextBox runat="server" CssClass="form-control" ID="exampleInputPassword1" ValidateRequestMode="Enabled"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ErrorMessage="请输入8到20位字母数字组合密码" ForeColor="Red" runat="server" ControlToValidate="exampleInputPassword1" ValidationExpression="(?=.*?[0-9])(?=.*?[a-z])[0-9a-z]{8,20}"></asp:RegularExpressionValidator>
				</div>
				<div class="form-group">
					 <label for="exampleInputPassword1">再次输入密码</label><asp:TextBox runat="server" CssClass="form-control" ID="exampleInputPassword2" ></asp:TextBox>
				</div>
				<asp:Button runat="server" id="submit_btn" CssClass="btn btn-default" Text="提交" OnClick="submit_btn_Click"></asp:Button>
			</div>
		</div>
		<div class="col-md-4 column">
		</div>
	</div>
</div>
    </form>
</body>
</html>
