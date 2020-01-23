<%@ Page Language="C#" MasterPageFile ="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="MusicStore.WebForm1" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID ="MainContent" runat ="server">
    <p>
        &nbsp;
    </p>
    <p>
        CustomerId&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:TextBox ID="CustomerIdIn" runat="server"></asp:TextBox>
    </p>
    <p>
        CustomerPassword&nbsp;
        <asp:TextBox ID="CustomerPasswordIn" runat="server" TextMode="Password"></asp:TextBox>
    </p>
    <p>
        &nbsp;&nbsp;
        <asp:Button ID="LoginButton" runat ="server" OnClick="LoginButton_Click"
            Text ="Log in" Height ="26px" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="RegisterButton" runat="server" OnClick="RegisterButton_Click"
            Text ="Register" Height ="26px" />
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>

</asp:Content>
