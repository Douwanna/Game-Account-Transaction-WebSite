<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Polish.aspx.cs" Inherits="test.Views.GoodsModel.Polish" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="wzdh"><div id="wz">你的位置:&nbsp;&nbsp;&nbsp;&nbsp;<a href="../index.aspx">首页</a>&nbsp;&nbsp; >>&nbsp;&nbsp;&nbsp;&nbsp;发布商品</div></div>
    <section id="ddgl">
            <div id="ddnr" style="width:98%;">
                <table style="margin-top:20px; width:90%; font-size:1.8rem;">
                    <tr>
                        <th><a href="GLY.aspx"style="text-decoration:none;">客户订单</a></th>
                        <th><a href="DFH.aspx"style="text-decoration:none;">待发货</a></th>
                        <th><a href="YWC.aspx"style="color:#14b9c8;text-decoration:none;">已完成</a></th>
                        <th><a href="SHCL.aspx"style="text-decoration:none;">售后处理</a></th>
                    </tr>
                </table>

                <div style="text-align:center;margin-top:30px;">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" Width="98%" OnRowCommand="GridView1_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="订单编号" InsertVisible="False" ReadOnly="True" SortExpression="id" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="name" HeaderText="客户信息">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:ImageField DataImageUrlField="sptp" HeaderText="商品图片">
                            <ControlStyle Height="100px" Width="100px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:ImageField>
                        <asp:BoundField DataField="spm" HeaderText="商品名称" SortExpression="spm" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="gwje" HeaderText="付款金额" SortExpression="gwje" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ddzt" HeaderText="订单状态" SortExpression="ddzt" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ddsj" HeaderText="订单时间" SortExpression="ddsj" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TapTapConnectionString8 %>" SelectCommand="SELECT * FROM [DDB]" ProviderName="<%$ ConnectionStrings:TapTapConnectionString8.ProviderName %>"></asp:SqlDataSource>
                </div>                
            <!--有无订单显示-->
                <div style="text-align:center;font-size:30px;"><asp:Label ID="Label1" runat="server" Text="暂无订单"></asp:Label></div>
            </div>
        </section>
</asp:Content>
