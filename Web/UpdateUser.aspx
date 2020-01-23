<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdateUser.aspx.cs" Inherits="MusicStore.UpdateUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        &nbsp;</p>
    <p>
        Enter the new password for
        <asp:Label ID="UName" runat="server" Text="User"></asp:Label>
    </p>
    <p>
        Password&nbsp;
        <asp:TextBox ID="CustomerPasswordIn" runat="server" TextMode="Password"></asp:TextBox>
    </p>
    <p>
        Password Verification&nbsp;
        <asp:TextBox ID="CustomerPasswordVerIn" runat="server" TextMode="Password"></asp:TextBox>
        <asp:CompareValidator runat="server" ID ="PasswordCV" Operator="Equal" ValidationGroup="Validate" ControlToValidate ="CustomerPasswordIn"
            ControlToCompare ="CustomerPasswordVerIn" ErrorMessage ="Passwords are not equal!" SetFocusOnError="true">
        </asp:CompareValidator>
    </p>
    <p>
    <asp:Button ID="UpdateBut" runat="server" Text ="Update Password" Height ="26px" OnClick="update_Click" />
</asp:Content>
