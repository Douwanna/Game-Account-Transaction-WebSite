<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddGame.aspx.cs" Inherits="test.Views.GoodsModel.AddGame" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link type="text/css" rel="stylesheet" href="../../Content/bootstrap.css" />
</head>
<body>
    <form runat="server">
        <div style="text-align: center; height: 1000px; width: 1000px; padding-top: 10px;">
            <div class="container">
                <div class="col-xs-8 column" style="width: 25%; float: left;">
                    <div role="form">
                        <div class="form-group">
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="批量上传" />
                        </div>
                        <div class="form-group">
                            <asp:Image ID="Image1" runat="server" Height="90px" Width="90px" />&nbsp;
                                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>&nbsp;&nbsp;
                                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="预览" />
                            &nbsp;<asp:Button ID="submit" runat="server" OnClick="submit_Click" Text="上传" />
                            &nbsp;<asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="刷新" />
                            &nbsp;
                                        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="下载模板" />
                                        <br />

                        </div>
                    </div>
                </div>
                <div class="col-xs-12 column" style="width: 400px;">
                    <div role="form">
                        <div class="form-group">
                            <label for="name">游戏名</label><asp:TextBox runat="server" class="form-control" ID="game_name"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="platform">平台</label><asp:DropDownList ID="platform" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="pname" DataValueField="id">
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="service">服务器</label><asp:TextBox runat="server" class="form-control" ID="service_name"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="icon">上传icon</label><asp:FileUpload ID="icon_file" runat="server" />&nbsp;
                        </div>
                    </div>
                </div>
                <div class="col-md-12 column" style="float: left;">
                    <div class="container">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource5" ForeColor="#333333" GridLines="None" Width="950px" DataKeyNames="service_id">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                <asp:BoundField DataField="game_name" HeaderText="game_name" SortExpression="game_name" />
                                <asp:BoundField DataField="platform_id" HeaderText="platform_id" SortExpression="platform_id" />
                                <asp:BoundField DataField="icon" HeaderText="icon" SortExpression="icon" />
                                <asp:BoundField DataField="service_id" HeaderText="service_id" InsertVisible="False" ReadOnly="True" SortExpression="service_id" />
                                <asp:BoundField DataField="service_name" HeaderText="service_name" SortExpression="service_name" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GMS %>" SelectCommand="SELECT * FROM [Game]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GMS %>" SelectCommand="SELECT * FROM [GameType]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:GMS %>" SelectCommand="SELECT * FROM [Platform]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:GMS %>" SelectCommand="SELECT * FROM [GameService]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:GMS %>" SelectCommand="SELECT Game.id, Game.game_name, Game.platform_id, Game.icon, GameService.id AS service_id, GameService.service_name FROM Game INNER JOIN GameService ON Game.id = GameService.game_id"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
