<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserPage.aspx.cs" Inherits="MusicStore.UserPage" EnableViewState ="true"%>

<asp:Content ID="Content" ContentPlaceHolderID ="MainContent" runat="server">
    <p>
        <asp:Label id="welcome" Text ="Welcome " runat="server" style="font-size: xx-large; font-weight: 700;"></asp:Label>
    </p>
    <p>
        <asp:Button ID="UpdateUser" runat="server" Text="Change Password" Width="123px" OnClick="UpdateUser_Click" />
    </p>
    <div>
        <p>
            OrderID&nbsp;&nbsp;&nbsp; ItemID&nbsp;&nbsp;&nbsp; Name&nbsp;&nbsp;&nbsp; Brand&nbsp;&nbsp;&nbsp; Price&nbsp;&nbsp;&nbsp; Condition</p>
        <p>
            &nbsp;<asp:Label id="choosen" Text ="" runat="server"></asp:Label>
        </p>
    </div>
    <div>
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;
        </div>
</asp:Content>
