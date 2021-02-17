<%@ Page Title="Admin Login" Language="vb" AutoEventWireup="false" MasterPageFile="~/Guest.Master" CodeBehind="AdminLogin.aspx.vb" Inherits="MyNewSystem.AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <b>
            <asp:Label ID="LabelTitle" runat="server" Text="Admin Login Account"></asp:Label></b>
    </div>
    <table align="center" style="background-color: #FFCC66; border: thin solid #000000">
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
                <asp:Button ID="ButtonClear" runat="server" Text="Clear" CausesValidation="False" CssClass="button buttonhover" />
                &nbsp;<asp:Button ID="ButtonLogin" runat="server" Text="Login" CssClass="button buttonhover" />
            </td>
        </tr>
    </table>
    <br />
    <div align="center">
        <asp:Label ID="LabelStatus" runat="server"></asp:Label>
        <asp:Label ID="LabelPasswordStatus" runat="server"></asp:Label>
        <asp:Label ID="LabelCheckEmail" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
