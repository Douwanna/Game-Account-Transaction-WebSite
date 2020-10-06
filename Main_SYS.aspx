<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Main_SYS.aspx.cs" Inherits="test.Views.SYSModel.Main_SYS" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <br />
    <br />
	
    <div class="container">
	<div class="row clearfix">
			<div class="col-md-8 column">
			<div id="ddnr" style="width:100%;">
                <table style="margin-top:20px;padding-left:50px;width:90%;text-align:center; font-size:1.8rem;">
                    <tr>
                        <th><a href="#"style="color:#14b9c8;text-decoration:none;">施工中</a></th>
                        <th><asp:LinkButton runat="server" ID="lb1" style="text-decoration:none;" Text="添加游戏" OnClick="lb1_Click"></asp:LinkButton></th>
                        <th><asp:LinkButton runat="server" ID="lb2" style="text-decoration:none;" Text="删除用户" OnClick="lb2_Click"></asp:LinkButton></th>
                        <th><asp:LinkButton runat="server" ID="lb3" style="text-decoration:none;" Text="售后处理" OnClick="lb3_Click"></asp:LinkButton></th>
                    </tr>
                </table>
                <asp:Panel Height="1000px" Width="1000px" ID="panel1" runat="server" >
                    <iframe style="height:100%;width:100%" src="AddGame.aspx" name="details"></iframe>
                </asp:Panel>
                <asp:Panel Height="1000px" Width="1000px" ID="panel2" runat="server" >
                    <iframe style="height:100%;width:100%" src="DelAdmin.aspx" name="details"></iframe>
                </asp:Panel>
                <asp:Panel Height="1000px" Width="1000px" ID="panel3" runat="server" >
                    <iframe style="height:100%;width:100%" src="SHCL.aspx" name="details"></iframe>
                </asp:Panel>
                
               </div>
		</div>
       </div>
  </div>
</asp:Content>
