<%@ Page Language="C#" MasterPageFile ="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MusicStore.Register" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        &nbsp;
    </p>
    <p>
        Username&nbsp;
        <asp:TextBox ID="CustomerIdIn" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="IdRFV" ControlToValidate="CustomerIdIn" ErrorMessage="*"></asp:RequiredFieldValidator>
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
        E mail&nbsp;
        <asp:TextBox ID="CustomerEmailIn" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator runat="server" ID="emailREV" ControlToValidate="CustomerEmailIn" 
            ErrorMessage="Valid email adress is required!" ValidationExpression ="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$">
        </asp:RegularExpressionValidator>
    </p>
    <p>
        Name
        <asp:TextBox ID="Name" runat="server"></asp:TextBox>
    </p>
    <p>
        Surname
        <asp:TextBox ID="Surname" runat="server"></asp:TextBox>
    </p>
    <p>
        Phone Number
        <asp:TextBox ID="Phone" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="LoginButton" runat ="server"
            Text ="Log in" Height ="26px" OnClick="LoginButton_Click" />
        &nbsp;&nbsp;
        <asp:Button ID="RegisterButton" runat="server"
            Text ="Register" Height ="26px" OnClick="RegisterButton_Click" />
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
</asp:Content>


