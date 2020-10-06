<%@ Page Title="游戏专区" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Games.aspx.cs" Inherits="test.Games" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
<ul class="breadcrumb">
    <li><a href="Home.aspx">交易狗</a></li>
    <li><a href="Game.aspx">游戏专区</a></li>
    <li class="active">
        <asp:Label ID="gname" runat="server" Text="Label"></asp:Label></li>
</ul>

<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">平台：<asp:Label ID="lb_platform" runat="server" Text="Label"></asp:Label></h3>
    </div>
    <div class="panel-body">
        已选择：
    </div>
    <table class="table">
        <tr><td>平台:</td><td>
            <asp:DropDownList ID="dp_platfrom" runat="server" DataSourceID="SqlDataSource3" DataTextField="pname" DataValueField="pname" AutoPostBack="True" OnSelectedIndexChanged="dp_platfrom_SelectedIndexChanged" Width="78px"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:GMS %>' SelectCommand="SELECT Platform.pname FROM Platform INNER JOIN Game ON Game.platform_id = Platform.id WHERE (Game.game_name = @name)">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="gname" DefaultValue="食物语" Name="name"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:SqlDataSource>
        </td></tr>
        <tr><td>服务器：</td><td>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="service_name" DataValueField="id">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GMS %>" SelectCommand="SELECT GameService.id, GameService.service_name FROM GameService INNER JOIN Platform ON GameService.platform_id = Platform.id WHERE (GameService.game_id = @gid) AND (Platform.pname = @pname)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="gid" QueryStringField="gid" />
                    <asp:ControlParameter ControlID="dp_platfrom" PropertyName="SelectedValue" Name="pname"></asp:ControlParameter>
                </SelectParameters>
            </asp:SqlDataSource>
            </td></tr>
        <tr><td style="height: 38px">价格： </td><td style="height: 38px">
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
                <asp:ListItem>50元以下&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                <asp:ListItem>50-100&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                <asp:ListItem>100元以上</asp:ListItem> 
            </asp:RadioButtonList>            
            </td></tr>
        <tr><td></td><td>
            <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click" CssClass="btn btn-info"/></td></tr>
    </table>
</div>

                   <div class="panel panel-default">
                 <div class="panel-heading" style="height:30px;">
                     <table style="width:100%;">
                         <tr><td><asp:Label ID="gname2" runat="server" Text="cnt"></asp:Label>的所有商品</td>
                             <td style="text-align:right;width:50%;">共计：<asp:Label ID="Label1" runat="server" Text=""></asp:Label>件商品</td></tr>
                     </table>
                     
                 </div>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="GoodsListPre">
            <HeaderTemplate>   
                   
                     <table class="table">
                         <tr><th>商品标题</th><th>价格</th><th>库存</th><th></th></tr>
            </HeaderTemplate>
            <ItemTemplate>
               
                <tr> <td style="text-align:left;"><a href="GameDetail.aspx?good_id=<%#Eval("goods_id")%>&gname=<%#Eval("game_name")%>"><%#Eval("title") %></a>
                    <ul style="list-style:none;color:lightslategray;font: 12px arial;">
                        <li>卖家信用：<%#Eval("credit") %></li>
                        <li>游戏区服：<%#Eval("game_name") %>> <%#Eval("pname")%> > <%#Eval("service_name") %></li>
                        <li>简介：<%#Eval("brief") %></li>                        
                    </ul></td>
                    <td style="color:red;text-align:center">￥<%#Eval("price") %></td>
                    <td><%#Eval("kc") %></td>
                    <td><a class="btn btn-warning" href="GameDetail.aspx?saler=<%#Eval("saler_id") %>&goods=<%#Eval("goods_id") %>&gname=<%#Eval("game_name") %>"><span>查看详情</span></a></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>

                   </div>
    

    <asp:SqlDataSource ID="GoodsListPre" runat="server" ConnectionString="<%$ ConnectionStrings:GMS %>" SelectCommand="SELECT goods_id, game_id, game_name, service_id, service_name, platform_id, pname, role_id, role_name, saler_id, name, brief, title, kc, credit, price FROM goods_to_show WHERE (game_id = @gid) AND (pname = @pname)">
        <SelectParameters>
            <asp:QueryStringParameter Name="gid" QueryStringField="gid" />
            <asp:ControlParameter ControlID="dp_platfrom" PropertyName="SelectedValue" Name="pname"></asp:ControlParameter>

        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="GoodsListAft" runat="server" ConnectionString="<%$ ConnectionStrings:GMS %>" SelectCommand="SELECT goods_id, game_id, game_name, service_id, service_name, platform_id, pname, role_id, role_name, saler_id, name, brief, title, kc, credit, price FROM goods_to_show WHERE (pname = @pname) AND (service_id = @sid) AND (price &lt;= @lte) AND (price &gt;= @gte)">
        <SelectParameters>
            <asp:ControlParameter ControlID="dp_platfrom" Name="pname" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DropDownList1" Name="sid" PropertyName="SelectedValue" />
            <asp:SessionParameter DefaultValue="100" Name="lte" SessionField="lte" />
            <asp:SessionParameter DefaultValue="0" Name="gte" SessionField="gte" />
        </SelectParameters>
    </asp:SqlDataSource>

    <script>
        var str = Session["userName"].toString();
        $(function func() { if (str == null) { alert("请先登录！") }});
    </script>
</asp:Content>
