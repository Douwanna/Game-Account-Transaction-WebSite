<%@ Page Title="首页" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="test.Index1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />

    <div class="container">
        <!--顶部快捷展示栏-->
        <div class="panel panel-default">
            <div class="panel-body">
                <span class="label label-danger">热门</span>
                <asp:Repeater ID="Repeater9" runat="server" DataSourceID="SqlDataSource2">
                    <ItemTemplate>
                        <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>"><%#Eval("game_name") %></a>
                        <span class="space">|</span>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

        <div class="row clearfix">
            <div class="col-md-4 column">
                <!--验证-->
                <!--公告-->
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">公告</h3>
                    </div>
                    <div class="panel-body">
                        这是一个公告的面板
                    </div>
                    <ul class="list-group">
                        <li class="list-group-item"><a>[租号福利] 诚招各大合作商家</a></li>
                        <li class="list-group-item"><a>[商家招募令] 瓜分百万流量资源</a></li>
                        <li class="list-group-item"><a>[公告] 交易服务收费标准</a></li>
                        <li class="list-group-item"><a>每年更新成本</a></li>
                    </ul>
                </div>
                <!--常见问题-->
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">常见问题</h3>
                        <a aria-flowto="right">更多</a>
                    </div>
                    <div class="panel-body">
                        这是一个问题的面板
                    </div>
                    <ul class="list-group">
                        <li class="list-group-item"><a>买东西要手续费吗？</a></li>
                        <li class="list-group-item"><a>卖东西要收手续费吗？</a></li>
                        <li class="list-group-item"><a>怎么卖出我的账号？</a></li>
                        <li class="list-group-item"><a>如何进行售后？</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-8 column">
                <!--轮播模块-->
                <div class="carousel slide" id="carousel-358272">
                    <ol class="carousel-indicators">
                        <li class="active" data-slide-to="0" data-target="#carousel-358272"></li>
                        <li data-slide-to="1" data-target="#carousel-358272"></li>
                        <li data-slide-to="2" data-target="#carousel-358272"></li>
                        <li data-slide-to="3" data-target="#carousel-358272"></li>
                        <li data-slide-to="4" data-target="#carousel-358272"></li>
                    </ol>
                    <div class="carousel-inner forlunbo">
                        <div class="item active">
                            <img height="240" width="750" alt="" src="image/lunbo/1.png" />

                        </div>
                        <div class="item">
                            <img height="240" width="750" alt="" src="image/lunbo/2.png" />
                        </div>
                        <div class="item">
                            <img height="240" width="750" alt="" src="image/lunbo/3.png" />
                        </div>
                        <div class="item">
                            <img alt="" src="image/lunbo/4.png" height="240" width="750" />

                        </div>
                        <div class="item">
                            <img alt="" src="image/lunbo/5.png" height="240" width="750" />


                        </div>
                    </div>
                </div>
                <!--最新成交/需要修改-->
                <!--
                <div class="list-group list-group-horizontal" style="padding-top: 20px;">
                    <label class="list-group-item active">最新成交</label>
                    <a href="Games.aspx" class="list-group-item"><% Session["latest_order"].ToString();%></a>
                </div>
                    -->
                <!--参考Game.aspx-->
                <div class="row" style="margin-top: 30px; margin-bottom: 30px;">
                    <ul class="nav-tabs nav" id="tabs1">
                        <li class="active"><a href="#tabs-1">A-D</a></li>
                        <li><a href="#tabs-2">E-H </a></li>
                        <li><a href="#tabs-3">I-L </a></li>
                        <li><a href="#tabs-4">M-P</a></li>
                        <li><a href="#tabs-5">Q-T </a></li>
                        <li><a href="#tabs-6">U-X </a></li>
                        <li><a href="#tabs-7">Y-Z</a></li>
                    </ul>
                    <div class="tab-content" style="padding-top: 30px;">
                        <div class="tab-pane active" id="tabs-1">
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="A_D">
                                <ItemTemplate>
                                    <div style="height: 121px; width: 30%; float: left;">
                                        <div style="width: 30%; float: left;">
                                            <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">
                                                <image style="height: 90px; width: 90px;" src="<%# Eval("icon")%>"></image>
                                                <span style="height: 90px; width: 90px;"></span>
                                            </a>
                                        </div>
                                        <div style="padding: 8px 0 0 10px;width:50%;float:right;">
                                            <h4>
                                                <%#Eval("game_name") %>
                                            </h4>
                                            <p>
                                                <%#Eval("pname") %>
                                            </p>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="tab-pane" id="tabs-2">
                            <asp:Repeater ID="Repeater7" runat="server" DataSourceID="E_H">
                                <ItemTemplate>
                                    <div style="height: 121px; width: 30%; float: left;">
                                        <div style="width: 30%; float: left;">
                                            <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">
                                                <image style="height: 90px; width: 90px;" src="<%# Eval("icon")%>"></image>
                                                <span style="height: 90px; width: 90px;"></span>
                                            </a>
                                        </div>
                                        <div style="padding: 8px 0 0 10px;width:50%;float:right;">
                                            <h4>
                                                <%#Eval("game_name") %>
                                            </h4>
                                            <p>
                                                <%#Eval("pname") %>
                                            </p>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="tab-pane" id="tabs-3">
                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="I_L">
                                <ItemTemplate>
                                    <div style="height: 121px; width: 30%; float: left;">
                                        <div style="width: 30%; float: left;">
                                            <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">
                                                <image style="height: 90px; width: 90px;" src="<%# Eval("icon")%>"></image>
                                                <span style="height: 90px; width: 90px;"></span>
                                            </a>
                                        </div>
                                        <div style="padding: 8px 0 0 10px;width:50%;float:right;">
                                            <h4>
                                                <%#Eval("game_name") %>
                                            </h4>
                                            <p>
                                                <%#Eval("pname") %>
                                            </p>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="tab-pane" id="tabs-4">
                            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="M_P">
                                <ItemTemplate>
                                    <div style="height: 121px; width: 30%; float: left;">
                                        <div style="width: 30%; float: left;">
                                            <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">
                                                <image style="height: 90px; width: 90px;" src="<%# Eval("icon")%>"></image>
                                                <span style="height: 90px; width: 90px;"></span>
                                            </a>
                                        </div>
                                        <div style="padding: 8px 0 0 10px;width:50%;float:right;">
                                            <h4>
                                                <%#Eval("game_name") %>
                                            </h4>
                                            <p>
                                                <%#Eval("pname") %>
                                            </p>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="tab-pane" id="tabs-5">
                            <asp:Repeater ID="Repeater4" runat="server" DataSourceID="Q_T">
                                <ItemTemplate>
                                    <div style="height: 121px; width: 30%; float: left;">
                                        <div style="width: 30%; float: left;">
                                            <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">
                                                <image style="height: 90px; width: 90px;" src="<%# Eval("icon")%>"></image>
                                                <span style="height: 90px; width: 90px;"></span>
                                            </a>
                                        </div>
                                        <div style="padding: 8px 0 0 10px;width:50%;float:right;">
                                            <h4>
                                                <%#Eval("game_name") %>
                                            </h4>
                                            <p>
                                                <%#Eval("pname") %>
                                            </p>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="tab-pane" id="tabs-6">
                            <asp:Repeater ID="Repeater5" runat="server" DataSourceID="U_X">
                                <ItemTemplate>
                                    <div style="height: 121px; width: 30%; float: left;">
                                        <div style="width: 30%; float: left;">
                                            <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">
                                                <image style="height: 90px; width: 90px;" src="<%# Eval("icon")%>"></image>
                                                <span style="height: 90px; width: 90px;"></span>
                                            </a>
                                        </div>
                                        <div style="padding: 8px 0 0 10px;width:50%;float:right;">
                                            <h4>
                                                <%#Eval("game_name") %>
                                            </h4>
                                            <p>
                                                <%#Eval("pname") %>
                                            </p>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="tab-pane" id="tabs-7">
                            <asp:Repeater ID="Repeater6" runat="server" DataSourceID="Y_Z">
                                <ItemTemplate>
                                    <div style="height: 121px; width: 30%; float: left;">
                                        <div style="width: 30%; float: left;">
                                            <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">
                                                <image style="height: 90px; width: 90px;" src="<%# Eval("icon")%>"></image>
                                                <span style="height: 90px; width: 90px;"></span>
                                            </a>
                                        </div>
                                        <div style="padding: 8px 0 0 10px;width:50%;float:right;">
                                            <h4>
                                                <%#Eval("game_name") %>
                                            </h4>
                                            <p>
                                                <%#Eval("pname") %>
                                            </p>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
                <!--最新发布-->
                <div class="panel panel-default panel-success">
                    <div class="panel-heading">
                        <h5>最新发布</h5> </div>
                    <asp:Repeater ID="Repeater8" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <div style="width: 50%; float: left; padding-right: 30px;">
                                <a href="GameDetail.aspx?saler=<%#Eval("saler_id") %>&goods=<%#Eval("good_id")%>&gname=<%#Eval("game_name") %>">
                                    <span style="height: 42px; width: 75%">
                                        <h5>[<%#Eval("game_name") %>][<%#Eval("pname") %>][<%#Eval("brief") %>]</h5>
                                    </span>
                                    <span style="height: 42px; width: 25%;">
                                        <h5 style="text-overflow: ellipsis; text-align: right;">￥<%#Eval("price") %></h5>
                                    </span>
                                </a>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>
        </div>
        <!--Game显示-->
        <asp:SqlDataSource ID="A_D" runat="server" ConnectionString="<%$ ConnectionStrings:GMS %>"
            SelectCommand="SELECT id, game_name, pname, icon 
            FROM Game_View 
            WHERE (dbo.fun_getPY(game_name) LIKE N'a%') OR 
                                (dbo.fun_getPY(game_name) LIKE N'b%') OR (dbo.fun_getPY(game_name) LIKE N'c%') OR 
                                (dbo.fun_getPY(game_name) LIKE N'd%') 
            ORDER BY game_name"></asp:SqlDataSource>
        <asp:SqlDataSource ID="E_H" runat="server" ConnectionString="<%$ ConnectionStrings:GMS %>" SelectCommand="SELECT  id, game_name, pname, icon
FROM      Game_View
WHERE   (dbo.fun_getPY(game_name) LIKE N'e%') OR
                   (dbo.fun_getPY(game_name) LIKE N'f%') OR
                   (dbo.fun_getPY(game_name) LIKE N'g%') OR
                   (dbo.fun_getPY(game_name) LIKE N'h%')
ORDER BY game_name"></asp:SqlDataSource>
        <asp:SqlDataSource ID="I_L" runat="server" ConnectionString="<%$ ConnectionStrings:GMS %>" SelectCommand="SELECT  id, game_name, pname, icon
FROM      Game_View
WHERE   (dbo.fun_getPY(game_name) LIKE N'i%') OR
                   (dbo.fun_getPY(game_name) LIKE N'j%') OR
                   (dbo.fun_getPY(game_name) LIKE N'k%') OR
                   (dbo.fun_getPY(game_name) LIKE N'l%')
ORDER BY game_name"></asp:SqlDataSource>
        <asp:SqlDataSource ID="M_P" runat="server" ConnectionString="<%$ ConnectionStrings:GMS %>" SelectCommand="SELECT  id, game_name, pname, icon
FROM      Game_View
WHERE   (dbo.fun_getPY(game_name) LIKE N'm%') OR
                   (dbo.fun_getPY(game_name) LIKE N'n%') OR
                   (dbo.fun_getPY(game_name) LIKE N'o%') OR
                   (dbo.fun_getPY(game_name) LIKE N'p%')
ORDER BY game_name"></asp:SqlDataSource>
        <asp:SqlDataSource ID="Q_T" runat="server" ConnectionString="<%$ ConnectionStrings:GMS %>" SelectCommand="SELECT  id, game_name, pname, icon
FROM      Game_View
WHERE   (dbo.fun_getPY(game_name) LIKE N'q%') OR
                   (dbo.fun_getPY(game_name) LIKE N'r%') OR
                   (dbo.fun_getPY(game_name) LIKE N's%') OR
                   (dbo.fun_getPY(game_name) LIKE N't%')
ORDER BY game_name"></asp:SqlDataSource>
        <asp:SqlDataSource ID="U_X" runat="server" ConnectionString="<%$ ConnectionStrings:GMS %>" SelectCommand="SELECT  id, game_name, pname, icon
FROM      Game_View
WHERE   (dbo.fun_getPY(game_name) LIKE N'u%') OR
                   (dbo.fun_getPY(game_name) LIKE N'v%') OR
                   (dbo.fun_getPY(game_name) LIKE N'w%') OR
                   (dbo.fun_getPY(game_name) LIKE N'x%')
ORDER BY game_name"></asp:SqlDataSource>
        <asp:SqlDataSource ID="Y_Z" runat="server" ConnectionString="<%$ ConnectionStrings:GMS %>" SelectCommand="SELECT  id, game_name, pname, icon
FROM      Game_View
WHERE   (dbo.fun_getPY(game_name) LIKE N'y%') OR
                   (dbo.fun_getPY(game_name) LIKE N'z%') 
ORDER BY game_name"></asp:SqlDataSource>
        <!--最新发布-->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GMS %>" SelectCommand="SELECT TOP (10) g.brief, g.price, g.Id AS good_id, p.pname, game.game_name, g.saler_id FROM Goods AS g INNER JOIN Platform AS p ON g.platform_id = p.id INNER JOIN Game AS game ON g.game_id = game.id ORDER BY g.created_at DESC"></asp:SqlDataSource>
        <!--热门-->
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:GMS %>' SelectCommand="SELECT TOP (5) COUNT([Order].id) AS cnt, Game.game_name, Game.id, Platform.pname FROM Game INNER JOIN Goods ON Game.id = Goods.game_id INNER JOIN [Order] ON Goods.Id = [Order].good_id INNER JOIN Platform ON Platform.id = Game.platform_id GROUP BY Game.game_name, Game.id, Platform.pname"></asp:SqlDataSource>
        <!--合作区&友链-->
        <div>
        </div>

    </div>
    <script>
        $(function () {
            $("#tabs1 a").mousemove(function (e) {
                $(this).tab('show');
            });
            $("#tabs2 a").mousemove(function (e) {
                $(this).tab('show');
            });
            $("#tabs3 a").mousemove(function (e) {
                $(this).tab('show');
            });
            $("#tabs4 a").mousemove(function (e) {
                $(this).tab('show');
            });
            $("#tabs5 a").mousemove(function (e) {
                $(this).tab('show');
            });
            $("#tabs6 a").mousemove(function (e) {
                $(this).tab('show');
            });
            $("#tabs7 a").mousemove(function (e) {
                $(this).tab('show');
            });
            $("#tabs8 a").mousemove(function (e) {
                $(this).tab('show');
            });
        });
        $(function () {
            $('#carousel-358272').carousel({ interval: 2000 });
        })
    </script>

</asp:Content>
