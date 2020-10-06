<%@ Page Title="游戏详情" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GameDetail.aspx.cs" Inherits="test.GameDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
    <li><a href="Home.aspx">交易狗</a></li>
    <li><a href="Game.aspx">游戏专区</a></li>
    <li><a href="#">
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></a></li>
    <li class="active">
        <asp:Label ID="gname" runat="server" Text="商品详情"></asp:Label></li>
</ul>
    <div class="panel panel-default">
    <div class="panel-heading">
        商品介绍
    </div>
    <div class="panel-body" style="padding-left:80px;">
         <div class="panel panel-default" style="float:right;width:30%;top:10px;">
            <div class="panel-heading">卖家信息</div>
            <div class="panel-body">
                <asp:DataList ID="DataList2" runat="server" DataKeyField="id" DataSourceID="Saler">
                    <ItemTemplate>
                        <img src=<%#Eval("photo") %> style="height:90px;width:90px;float:right;padding-right:20px;"/>
                <table>
                    <tr><td>卖家姓名:</td><td><%# Eval("name") %></td></tr>
                    <tr><td>卖家信誉:</td><td><%# Eval("credit") %></td></tr>
                    <tr><td>卖家电话:</td><td><%# Eval("phone") %></td></tr>
                    <tr><td><br /></td></tr>
                    <tr><td><br /></td></tr>
                    <tr><td><br /></td></tr>
                    <tr><td></td><td><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=&site=qq&menu=yes" class="btn btn-info"><img border="0" src="http://wpa.qq.com/pa?p=2::53" alt="点击这里联系卖家" title="点击这里联系卖家"/></a></td></tr>
                </table>
                        
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource runat="server" ID="Saler" ConnectionString='<%$ ConnectionStrings:GMS %>' SelectCommand="SELECT id, name, phone, credit, photo FROM admin_user WHERE (id = @saler)">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="saler" Name="saler"></asp:QueryStringParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
                
            </div>
        </div>
        <asp:DataList ID="DataList1" runat="server" Width="40%" DataSourceID="GoodsDetail">
            <HeaderTemplate>
            </HeaderTemplate>
            <ItemTemplate>
                <table>
                    <tr>
                        <td>
                            <h4><%#Eval("title") %></h4>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                    <td>价格:</td>
                    <td><%#Eval("price") %></td>
                </tr>
                <tr>
                    <td>游戏:</td>
                    <td><%#Eval("game_name") %> > <%#Eval("pname") %> > <%#Eval("service_name") %></td>
                </tr>
                <tr>
                    <td>ID:</td>
                    <td><%#Eval("role_id") %></td>
                </tr>
                <tr>
                    <td>角色:</td>
                    <td><%#Eval("role_name") %></td>
                </tr>
                <tr>
                    <td>详细介绍:</td>
                    
                </tr>
                    <tr><td><p><%#Eval("brief") %></p></td></tr>
                    <tr>
                    <td>上架时间:</td>
                    <td><%#Eval("created_at") %></td>
                </tr>
                </table>
            </ItemTemplate>
            <FooterTemplate>
                
            </FooterTemplate>
        </asp:DataList>
        <asp:SqlDataSource runat="server" ID="GoodsDetail" ConnectionString='<%$ ConnectionStrings:GMS %>' SelectCommand="SELECT goods_id, game_name, service_name, pname, brief, title, created_at, kc, role_id, role_name,price FROM goods_to_show WHERE (goods_id = @goods)">
            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="goods" Name="goods"></asp:QueryStringParameter>
            </SelectParameters>
        </asp:SqlDataSource>
        
       
        <div class="panel panel-default" style="width:40%;">
            <div class="panel-heading">
                购买数量:1件
                <br />
                <asp:Button CssClass="btn btn-warning" ID="Button1" runat="server" Text="立即购买" OnClick="Button1_Click" />
            </div>
        </div>
    </div>
</div>
</asp:Content>
