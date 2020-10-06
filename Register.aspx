<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="test.Register" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户注册</title>
    <link type="text/css" rel="stylesheet" href="Content/bootstrap.css"/>
    <link type="text/css" rel="stylesheet" href="Content/register.css"/>
</head>
<body>
<div>
    <div class="row clearfix">
				<div class="col-md-2 column">
                    <img  src="imgs/Dog1.jpg" />
				</div>
				<div class="col-md-6 column">
					<form runat="server" class="contact_form" action="#" method="post" name="contact_form">
    <ul>
        <li class="usually">
             <h2 class="center-block" >用户注册</h2>
        </li>
        <li class="usually">
            <span>昵称:</span>
            <asp:TextBox runat="server" type="text" id="name" name="name" ValidateRequestMode="Enabled" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="用户名不能为空" ControlToValidate="name" ForeColor="Red"></asp:RequiredFieldValidator>

        </li>
        <li class="usually">
            <span>手机号:</span>
            <asp:TextBox runat="server" type="phone"  ID="phone" placeholder="18888888888" TextMode="Phone" ValidateRequestMode="Enabled"></asp:TextBox>
            <asp:RegularExpressionValidator ErrorMessage="请输入正确手机号" ID="RegularExpressionValidator3" ForeColor="Red" runat="server" ValidationExpression="(\(\d{3}\)|\d{3}-)?\d{8}" ControlToValidate="phone"></asp:RegularExpressionValidator>

        </li>
        <li class="usually">
            <span>密码:</span>
            <asp:TextBox runat="server" type="password"  ID="password" TextMode="Password" ValidateRequestMode="Enabled"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ErrorMessage="请输入8到20位字母数字组合密码" ForeColor="Red" runat="server" ControlToValidate="password" ValidationExpression="(?=.*?[0-9])(?=.*?[a-z])[0-9a-z]{8,20}"></asp:RegularExpressionValidator>

        </li>
        <li class="usually">
            <span>确认密码:</span>
            <asp:TextBox runat="server" type="password"  ID="password2" TextMode="Password" ValidateRequestMode="Enabled"></asp:TextBox>
           <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="两次密码输入不一致" ControlToCompare="password" ControlToValidate="password2" ForeColor="Red"></asp:CompareValidator>
        </li>
        <li class="special">
            <span >性别:</span>
            <asp:RadioButtonList ID="rb1" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True" Value="男">男</asp:ListItem>
                <asp:ListItem Value="女">女</asp:ListItem>
            </asp:RadioButtonList>
        </li>
        <li class="usually">
            <span>地址:</span>            
            <asp:DropDownList ID="ddl1" runat="server"></asp:DropDownList>
            <span>省</span>
            <asp:DropDownList ID="ddl2" runat="server" AutoPostBack="true"></asp:DropDownList>
            <span>市</span>
        </li>
        <li class="usually">
            <span>验证码:</span>
            <canvas id="canvas" width="120" height="40"></canvas>
            <input type="text" id="text">
            <asp:Button runat="server" type="button" text="提交" id="bt" OnClick="Button1_Click" />
            <asp:TextBox runat="server" ID="code"></asp:TextBox>
            <img id="VCodeImg" src="#" onclick="javascript:RefreshCode();" />
            <asp:Image ID="Image1" runat="server" />
        </li>
        <li >
            <asp:Button runat="server" class="submit" type="submit" ID="Button1" OnClick="Button1_Click" Text="立即注册"></asp:Button>
        </li>
    </ul>
</form>
				</div>
				<div class="col-md-4 column">
				</div>
			</div>
</div>
    
    <script>
        var canvas = document.getElementById("canvas");//演员
        var context = canvas.getContext("2d");//舞台，getContext() 方法可返回一个对象，该对象提供了用于在画布上绘图的方法和属性。
        var button = document.getElementById("bt");//获取按钮
        var input = document.getElementById("text");//获取输入框
        draw();
        canvas.onclick = function () {
            context.clearRect(0, 0, 120, 40);//在给定的矩形内清除指定的像素
            draw();
        }
        // 随机颜色函数
        function getColor() {
            var r = Math.floor(Math.random() * 256);
            var g = Math.floor(Math.random() * 256);
            var b = Math.floor(Math.random() * 256);
            return "rgb(" + r + "," + g + "," + b + ")";
        }
        function draw() {
            context.strokeRect(0, 0, 120, 40);//绘制矩形（无填充）
            var aCode = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"];
            // 绘制字母
            var arr = [] //定义一个数组用来接收产生的随机数
            var num //定义容器接收验证码
            for (var i = 0; i < 4; i++) {
                var x = 20 + i * 20;//每个字母之间间隔20
                var y = 20 + 10 * Math.random();//y轴方向位置为20-30随机
                var index = Math.floor(Math.random() * aCode.length);//随机索引值
                var txt = aCode[index];
                context.font = "bold 20px 微软雅黑";//设置或返回文本内容的当前字体属性
                context.fillStyle = getColor();//设置或返回用于填充绘画的颜色、渐变或模式，随机
                context.translate(x, y);//重新映射画布上的 (0,0) 位置，字母不可以旋转移动，所以移动容器
                var deg = 90 * Math.random() * Math.PI / 180;//0-90度随机旋转
                context.rotate(deg);// 	旋转当前绘图
                context.fillText(txt, 0, 0);//在画布上绘制“被填充的”文本
                context.rotate(-deg);//将画布旋转回初始状态
                context.translate(-x, -y);//将画布移动回初始状态
                arr[i] = txt //接收产生的随机数
            }
            num = arr[0] + arr[1] + arr[2] + arr[3] //将产生的验证码放入num
            // 绘制干扰线条
            for (var i = 0; i < 8; i++) {
                context.beginPath();//起始一条路径，或重置当前路径
                context.moveTo(Math.random() * 120, Math.random() * 40);//把路径移动到画布中的随机点，不创建线条
                context.lineTo(Math.random() * 120, Math.random() * 40);//添加一个新点，然后在画布中创建从该点到最后指定点的线条
                context.strokeStyle = getColor();//随机线条颜色
                context.stroke();// 	绘制已定义的路径
            }
            // 绘制干扰点，和上述步骤一样，此处用长度为1的线代替点
            for (var i = 0; i < 20; i++) {
                context.beginPath();
                var x = Math.random() * 120;
                var y = Math.random() * 40;
                context.moveTo(x, y);
                context.lineTo(x + 1, y + 1);
                context.strokeStyle = getColor();
                context.stroke();
            }

            //点击按钮验证
            button.onclick = function () {
                var text = input.value //获取输入框的值
                if (text === num) {
                    alert('验证通过')
                } else {
                    alert('验证失败')
                }
            }

        }

    </script>
</body>
</html>
