<%@ Page Title="Update Shopping Cart" Language="vb" AutoEventWireup="false" MasterPageFile="~/Customer.Master" CodeBehind="UpdateShoppingCart.aspx.vb" Inherits="MyNewSystem.UpdateShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center"><b>
        <asp:Label ID="LabelTitle" runat="server" Text="Update Shopping Cart"></asp:Label></b></div>
    <table align="center" style="background-color: #FFCC66; border: thin solid #000000">
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">Number:</td>
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelNumber" runat="server"></asp:Label>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">Product Name:</td>
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelProductName" runat="server"></asp:Label>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">Price:</td>
            <td style="border: thin solid #000000">
                RM<asp:Label ID="LabelProductPrice" runat="server"></asp:Label>.00
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">Quantity:</td>
            <td style="border: thin solid #000000">
                <asp:DropDownList ID="DropDownListProductQuantity" runat="server" AutoPostBack="True">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">Total Price:</td>
            <td style="border: thin solid #000000">
                RM<asp:Label ID="LabelTotalPrice" runat="server"></asp:Label>.00
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">&nbsp;</td>
            <td style="border: thin solid #000000">
                <asp:Button ID="ButtonUpdate" runat="server" Text="Update" CssClass="button buttonhover" />
            </td>
        </tr>
    </table>
</asp:Content>
