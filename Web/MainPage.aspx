<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="MusicStore.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <asp:Button ID="UName" runat="server" OnClick="UM_Click" Text="Profile" Width="90px" />
&nbsp;
    <asp:Button ID="LoginButton" runat="server" OnClick="LB_Click" Text="Login" Width="90px" />
&nbsp;
    <asp:Button ID="SigninButton" runat="server" OnClick="SB_Click" Text="Signin" Width="90px" />
    &nbsp;&nbsp;<asp:Button ID="LOButton" runat="server" OnClick="LO_Click" Text="LogOut" />
    <br />
    <br />
    ID&nbsp;&nbsp;&nbsp; Brand&nbsp;&nbsp;&nbsp; Name&nbsp;&nbsp;&nbsp; Condition&nbsp;&nbsp;&nbsp; Price<asp:Label ID="items" runat="server" Text=""></asp:Label>
</asp:Content>
