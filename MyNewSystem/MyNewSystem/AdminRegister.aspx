<%@ Page Title="Admin register" Language="vb" AutoEventWireup="false" MasterPageFile="~/Guest.Master" CodeBehind="AdminRegister.aspx.vb" Inherits="MyNewSystem.AdminRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <b>
            <asp:Label ID="LabelTitle" runat="server" Text="Admin Register Account"></asp:Label></b>
    </div>
    <table align="center" style="background-color: #FFCC66; border: thin solid #000000">
        <tr style="border: thin solid #FFCC66">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelEmail" runat="server" Text="Email"></asp:Label>
            </td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxEmail" runat="server" placeholder="Enter Email"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvemail" runat="server" ErrorMessage="Enter Email" ControlToValidate="TextBoxEmail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelUsername" runat="server" Text="Username"></asp:Label></td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxUsername" runat="server" placeholder="Enter Username"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvusername" runat="server" ErrorMessage="Enter Username" ControlToValidate="TextBoxUsername" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelPassword" runat="server" Text="Password"></asp:Label></td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxPassword" runat="server" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvpassword" runat="server" ErrorMessage="Enter Password" ControlToValidate="TextBoxPassword" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelConfirmPassword" runat="server" Text="Confirm Password"></asp:Label></td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxConfirmPassword" runat="server" placeholder="Enter Confirm Password" TextMode="Password"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvconfirmpassword" runat="server" ErrorMessage="Enter Confirm Password" ControlToValidate="TextBoxConfirmPassword" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="cvcomparepassword" runat="server" ErrorMessage="Password Not Match" ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxConfirmPassword" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000"></td>
            <td style="border: thin solid #000000">
                <asp:Button ID="ButtonClear" runat="server" Text="Clear" CausesValidation="False" CssClass="button buttonhover" />
                <asp:Button ID="ButtonRegister" runat="server" Text="Register" CssClass="button buttonhover" />
            </td>
        </tr>
    </table>
    <div align="center">
        <asp:Label ID="LabelStatus" runat="server" Text=""></asp:Label>
        <asp:Label ID="LabelCheckEmail" runat="server" Text=""></asp:Label>
        <asp:Label ID="LabelCheckUsername" runat="server" Text=""></asp:Label>
    </div>
    <br />
    <div align="center">
        <asp:Label ID="LabelAdminId" runat="server" Visible="False"></asp:Label>
    </div>
</asp:Content>
