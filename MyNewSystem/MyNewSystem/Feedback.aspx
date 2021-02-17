<%@ Page Title="Feedback" Language="vb" AutoEventWireup="false" MasterPageFile="~/Guest.Master" CodeBehind="Feedback.aspx.vb" Inherits="MyNewSystem.Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <b>
            <asp:Label ID="LabelTitle" runat="server" Text="Feedback"></asp:Label></b>
    </div>
    <div>
        <table align="center" style="background-color: #FFCC66; border: thin solid #000000">
            <tr style="border: thin solid #000000">
                <td style="border: thin solid #000000">
                    <asp:Label ID="LabelName" runat="server" Text="Name"></asp:Label></td>
                <td style="border: thin solid #000000">
                    <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr style="border: thin solid #000000">
                <td style="border: thin solid #000000">
                    <asp:Label ID="LabelEmail" runat="server" Text="Email"></asp:Label></td>
                <td style="border: thin solid #000000">
                    <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr style="border: thin solid #000000">
                <td style="border: thin solid #000000">
                    <asp:Label ID="LabelPhoneNumber" runat="server" Text="Phone Number"></asp:Label></td>
                <td style="border: thin solid #000000">
                    <asp:TextBox ID="TextBoxPhoneNumber" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr style="border: thin solid #000000">
                <td style="border: thin solid #000000">
                    <asp:Label ID="LabelMessage" runat="server" Text="Message"></asp:Label></td>
                <td style="border: thin solid #000000">
                    <asp:TextBox ID="TextBoxMessage" runat="server" Height="139px" TextMode="MultiLine" Width="210px"></asp:TextBox>
                </td>
            </tr>
            <tr style="border: thin solid #000000">
                <td style="border: thin solid #000000">&nbsp;</td>
                <td style="border: thin solid #000000">
                    <asp:Button ID="ButtonClear" runat="server" Text="Clear" CssClass="button buttonhover" />
                    <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" CssClass="button buttonhover" />
                </td>
            </tr>
        </table>
    </div>
    <div align="center">
        <asp:Label ID="LabelStatus" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
