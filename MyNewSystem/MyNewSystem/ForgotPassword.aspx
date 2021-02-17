<%@ Page Title="Forgot Password" Language="vb" AutoEventWireup="false" MasterPageFile="~/Guest.Master" CodeBehind="ForgotPassword.aspx.vb" Inherits="MyNewSystem.ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <b>
            <asp:Label ID="LabelTitle" runat="server" Text="ForgotPassword"></asp:Label></b>
    </div>
    <table align="center" style="background-color: #FFCC66; border: thin solid #000000">
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelEmail" runat="server" Text="Email"></asp:Label>
            </td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxEmail" runat="server" Placeholder="Enter Email"></asp:TextBox>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">&nbsp;</td>
            <td style="border: thin solid #000000">
                <asp:Button ID="ButtonClear" runat="server" Text="Clear" CausesValidation="False" CssClass="button buttonhover" />
                &nbsp;<asp:Button ID="ButtonSubmit" runat="server" Text="Submit" CssClass="button buttonhover" />
            </td>
        </tr>
    </table>
    <br />
    <div align="center">
        <asp:Label ID="LabelStatus" runat="server"></asp:Label>
    </div>
    <br />
    <div align="center">
        <asp:RequiredFieldValidator ID="rfvemail" runat="server" ErrorMessage="Enter Email" ControlToValidate="TextBoxEmail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
</asp:Content>
