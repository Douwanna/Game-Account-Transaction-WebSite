<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Game.aspx.cs" Inherits="test.Game" %>

<!DOCTYPE html>

<html lang="zh">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <style type='text/css'>
        .select-item {
            background: #FFF;
            clear: both;
            width: 80%;
            height:auto;
            padding-top: 30px;
            margin-bottom: 10px;
            border: 1px solid #D7D7D7;
            position: relative;
            display:inline-block !important; 
            display:inline;
        }

            .select-item .title {
                width: 30px;
                height: 30px;
                background: #4190E9;
                color: #FFF;
                font-size: 18px;
                left: -31px;
                top: 19px;
                line-height: 30px;
                position:absolute;
                display:block;
                text-align:center;
            }
        /* Custom Styles */
        ul.nav-tabs {
            width: 140px;
            margin-top: 20px;
            border-radius: 4px;
            border: 1px solid #ddd;
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);
        }

            ul.nav-tabs li {
                margin: 0;
                border-top: 1px solid #ddd;
            }

                ul.nav-tabs li:first-child {
                    border-top: none;
                }

                ul.nav-tabs li a {
                    margin: 0;
                    padding: 8px 16px;
                    border-radius: 0;
                }

                ul.nav-tabs li.active a, ul.nav-tabs li.active a:hover {
                    color: #fff;
                    background: #0088cc;
                    border: 1px solid #0088cc;
                }

                ul.nav-tabs li:first-child a {
                    border-radius: 4px 4px 0 0;
                }

                ul.nav-tabs li:last-child a {
                    border-radius: 0 0 4px 4px;
                }

            ul.nav-tabs.affix {
                top: 30px; /* Set the top position of pinned element */
            }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see https://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>
    
    <header><a href="#bottom" id="top">直达底部</a></header>
    <div data-spy="scroll" data-target="#myScrollspy">
        <div class="col-xs-3" id="myScrollspy">
            <ul class="nav nav-tabs nav-stacked affix" id="myNav">
                <li><a href="#A">A-D</a></li>
                <li><a href="#E">E-H</a></li>
                <li><a href="#I">I-L</a></li>
                <li><a href="#M">M-P</a></li>
                <li><a href="#Q">Q-T</a></li>
                <li><a href="#U">U-X</a></li>
                <li><a href="#Y">Y-Z</a></li>
            </ul>
        </div>
        <div class="col-xs-9">
            
           <h2  id="A"></h2>
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="A_D">
                        <HeaderTemplate>
                             <div class="select-item">
                <span class="title">A_D</span>   
                <ul style="">
                        </HeaderTemplate>
                        <ItemTemplate>                            
                            <li style="list-style:none;width:30%; float: left;">
                                <div style="list-style:none;">
                                    <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">
                                        <img style="height: 90px; width: 90px;" src="<%# Eval("icon")%>" />
                                    </a>
                                </div>
                                <div style="list-style: none;">
                                    <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">
                                        <h4>
                                            <%#Eval("game_name") %>
                                        </h4>
                                    </a>
                                </div>
                                <div style="list-style: none;">
                                    <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">

                                        <p>
                                            <%#Eval("pname") %>
                                        </p>
                                    </a>
                                </div>
                            </li>
                               
                        </ItemTemplate>
                        <FooterTemplate>
                             </ul>
            </div>
                        </FooterTemplate>
                    </asp:Repeater>
            <h2  id="E"></h2>
            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="E_H">
                        <HeaderTemplate>
                             <div class="select-item">
                <span class="title">E_H</span>   
                <ul style="">
                        </HeaderTemplate>
                        <ItemTemplate>                            
                            <li style="list-style:none;width:30%; float: left;">
                                <div style="list-style:none;">
                                    <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">
                                        <img style="height: 90px; width: 90px;" src="<%# Eval("icon")%>" />
                                    </a>
                                </div>
                                <div style="list-style: none;">
                                    <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">
                                        <h4>
                                            <%#Eval("game_name") %>
                                        </h4>
                                    </a>
                                </div>
                                <div style="list-style: none;">
                                    <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">

                                        <p>
                                            <%#Eval("pname") %>
                                        </p>
                                    </a>
                                </div>
                            </li>
                               
                        </ItemTemplate>
                        <FooterTemplate>
                             </ul>
            </div>
                        </FooterTemplate>
                    </asp:Repeater>
            <h2  id="I"></h2>
            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="I_L">
                        <HeaderTemplate>
                             <div class="select-item">
                <span class="title">I_L</span>   
                <ul style="">
                        </HeaderTemplate>
                        <ItemTemplate>                            
                            <li style="list-style:none;width:30%; float: left;">
                                <div style="list-style:none;">
                                    <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">
                                        <img style="height: 90px; width: 90px;" src="<%# Eval("icon")%>" />
                                    </a>
                                </div>
                                <div style="list-style: none;">
                                    <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">
                                        <h4>
                                            <%#Eval("game_name") %>
                                        </h4>
                                    </a>
                                </div>
                                <div style="list-style: none;">
                                    <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">

                                        <p>
                                            <%#Eval("pname") %>
                                        </p>
                                    </a>
                                </div>
                            </li>
                               
                        </ItemTemplate>
                        <FooterTemplate>
                             </ul>
            </div>
                        </FooterTemplate>
                    </asp:Repeater>
            <h2  id="M"></h2>
            <asp:Repeater ID="Repeater4" runat="server" DataSourceID="M_P">
                        <HeaderTemplate>
                             <div class="select-item" >
                <span class="title">M_P</span>   
                <ul style="">
                        </HeaderTemplate>
                        <ItemTemplate>                            
                            <li style="list-style:none;width:30%; float: left;">
                                <div style="list-style:none;">
                                    <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">
                                        <img style="height: 90px; width: 90px;" src="<%# Eval("icon")%>" />
                                    </a>
                                </div>
                                <div style="list-style: none;">
                                    <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">
                                        <h4>
                                            <%#Eval("game_name") %>
                                        </h4>
                                    </a>
                                </div>
                                <div style="list-style: none;">
                                    <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">

                                        <p>
                                            <%#Eval("pname") %>
                                        </p>
                                    </a>
                                </div>
                            </li>
                               
                        </ItemTemplate>
                        <FooterTemplate>
                             </ul>
            </div>
                        </FooterTemplate>
                    </asp:Repeater>
            <h2  id="Q"></h2>
            <asp:Repeater ID="Repeater5" runat="server" DataSourceID="Q_T">
                        <HeaderTemplate>
                             <div class="select-item">
                <span class="title">Q_T</span>   
                <ul style="">
                        </HeaderTemplate>
                        <ItemTemplate>                            
                            <li style="list-style:none;width:30%; float: left;">
                                <div style="list-style:none;">
                                    <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">
                                        <img style="height: 90px; width: 90px;" src="<%# Eval("icon")%>" />
                                    </a>
                                </div>
                                <div style="list-style: none;">
                                    <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">
                                        <h4>
                                            <%#Eval("game_name") %>
                                        </h4>
                                    </a>
                                </div>
                                <div style="list-style: none;">
                                    <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">

                                        <p>
                                            <%#Eval("pname") %>
                                        </p>
                                    </a>
                                </div>
                            </li>
                               
                        </ItemTemplate>
                        <FooterTemplate>
                             </ul>
            </div>
                        </FooterTemplate>
                    </asp:Repeater>
            <h2  id="U"></h2>
            <asp:Repeater ID="Repeater6" runat="server" DataSourceID="U_X">
                <AlternatingItemTemplate></AlternatingItemTemplate>
                        <HeaderTemplate>
                             <div class="select-item">
                <span class="title">U_X</span>   
                <ul style="display:block;clear:both;">
                        </HeaderTemplate>
                        <ItemTemplate>                            
                            <li style="list-style:none;width:30%; float: left;">
                                <div style="list-style:none;">
                                    <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">
                                        <img style="height: 90px; width: 90px;" src="<%# Eval("icon")%>" />
                                    </a>
                                </div>
                                <div style="list-style: none;">
                                    <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">
                                        <h4>
                                            <%#Eval("game_name") %>
                                        </h4>
                                    </a>
                                </div>
                                <div style="list-style: none;">
                                    <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">

                                        <p>
                                            <%#Eval("pname") %>
                                        </p>
                                    </a>
                                </div>
                            </li>
                               
                        </ItemTemplate>
                        <FooterTemplate>
                             </ul>
            </div>
                        </FooterTemplate>
                    </asp:Repeater>
            <h2  id="Y"></h2>
            <asp:Repeater ID="Repeater7" runat="server" DataSourceID="Y_Z">
                        <HeaderTemplate>
                             <div class="select-item">
                <span class="title">Y_Z</span>   
                <ul style="">
                        </HeaderTemplate>
                        <ItemTemplate>                            
                            <li style="list-style:none;width:30%; float: left;">
                                <div style="list-style:none;">
                                    <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">
                                        <img style="height: 90px; width: 90px;" src="<%# Eval("icon")%>" />
                                    </a>
                                </div>
                                <div style="list-style: none;">
                                    <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">
                                        <h4>
                                            <%#Eval("game_name") %>
                                        </h4>
                                    </a>
                                </div>
                                <div style="list-style: none;">
                                    <a href="Games.aspx?gid=<%#Eval("id") %>&pname=<%#Eval("pname")%>&gname=<%#Eval("game_name") %>">

                                        <p>
                                            <%#Eval("pname") %>
                                        </p>
                                    </a>
                                </div>
                            </li>
                               
                        </ItemTemplate>
                        <FooterTemplate>
                             </ul>
            </div>
                        </FooterTemplate>
                    </asp:Repeater>

           
            
        </div>
    </div>
    <footer><a href="#top" id="bottom">返回顶部</a></footer>
    <!--Game显示-->
    <asp:SqlDataSource ID="A_D" runat="server" ConnectionString="<%$ ConnectionStrings:GMS %>"
        SelectCommand="SELECT id, game_name, pname, icon FROM Game_View WHERE (dbo.fun_getPY(game_name) LIKE N'a%') OR (dbo.fun_getPY(game_name) LIKE N'b%') OR (dbo.fun_getPY(game_name) LIKE N'c%') OR (dbo.fun_getPY(game_name) LIKE N'd%') ORDER BY game_name"></asp:SqlDataSource>
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
        </form>
        <script>
            $(document).ready(function () {
                $("#myNav").affix({
                    offset: {
                        top: 125
                    }
                });
            });
    </script>
</body>
</html>
