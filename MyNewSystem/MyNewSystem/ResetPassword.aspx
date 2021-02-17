<%@ Page Title="Reset Password" Language="vb" AutoEventWireup="false" MasterPageFile="~/Guest.Master" CodeBehind="ResetPassword.aspx.vb" Inherits="MyNewSystem.ResetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <b>
            <asp:Label ID="LabelResetPassword" runat="server" Text="Reset Password"></asp:Label></b>
    </div>
    <table align="center" style="background-color: #FFCC66; border: thin solid #000000">
        <tr>
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelNewPassword" runat="server" Text="Enter new password"></asp:Label>
            </td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxNewPassword" runat="server" TextMode="Password" PlaceHolder="Enter New Password"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvnewpassword" runat="server" ErrorMessage="Enter new password" Display="Dynamic" ForeColor="Red" ControlToValidate="TextBoxNewPassword"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelConfirmNewPassword" runat="server" Text="Confirm new password"></asp:Label>
            </td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxConfirmNewPassword" runat="server" TextMode="Password" PlaceHolder="Confirm New Password"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvconfirmnewpassword" runat="server" ErrorMessage="Enter confirm new password" ControlToValidate="TextBoxConfirmNewPassword" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="cvnewpassword" runat="server" ErrorMessage="Password not matched" ControlToCompare="TextBoxNewPassword" ControlToValidate="TextBoxConfirmNewPassword" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">&nbsp;</td>
            <td style="border: thin solid #000000">
                <asp:Button ID="ButtonClear" runat="server" Text="Clear" CausesValidation="False" CssClass="button buttonhover" />
                <asp:Button ID="ButtonReset" runat="server" Text="Reset" CssClass="button buttonhover" />
            </td>
        </tr>
    </table>
    <br />
    <div align="center">
        <asp:Label ID="LabelStatus" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
