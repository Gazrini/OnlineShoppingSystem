<%@ Page Title="Login" Language="vb" AutoEventWireup="false" MasterPageFile="~/Guest.Master" CodeBehind="Login.aspx.vb" Inherits="MyNewSystem.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <b>
            <asp:Label ID="LabelTitle" runat="server" Text="Login Account"></asp:Label></b>
    </div>
    <table align="center" style="background-color: #FFCC66" border: thin solid #000000">
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelEmail" runat="server" Text="Email"></asp:Label></td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxEmail" runat="server" placeholder="Enter Email"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvemail" runat="server" ErrorMessage="Enter Email" ControlToValidate="TextBoxEmail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelPassword" runat="server" Text="Password"></asp:Label>
            </td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxPassword" runat="server" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvpassword" runat="server" ErrorMessage="Enter Password" ControlToValidate="TextBoxPassword" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">&nbsp;</td>
            <td style="border: thin solid #000000">
                <asp:Button ID="ButtonClear" runat="server" Text="Clear" CausesValidation="False" class="button buttonhover"/>
                &nbsp;<asp:Button ID="ButtonLogin" runat="server" Text="Login" class="button buttonhover"/>
            </td>
        </tr>
    </table>
    <br />
    <div align="center">
        <asp:HyperLink ID="HyperLinkForgotPass" runat="server" NavigateUrl="~/ForgotPassword.aspx">Forgot Password</asp:HyperLink>
    </div>
    <br />
    <div align="center">
        <asp:Label ID="LabelStatus" runat="server"></asp:Label>
        <br />
        <asp:Label ID="LabelPasswordStatus" runat="server"></asp:Label>
        <br />
        <asp:Label ID="LabelCheckEmail" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
