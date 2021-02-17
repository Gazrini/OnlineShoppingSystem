<%@ Page Title="Shopping Cart" Language="vb" AutoEventWireup="false" MasterPageFile="~/Customer.Master" CodeBehind="ShoppingCart.aspx.vb" Inherits="MyNewSystem.ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        You have&nbsp;
    <strong>
        <asp:Label ID="LabelShoppingCartQuantity" runat="server"></asp:Label>
    </strong>&nbsp;products in your shopping cart
    </div>
    <div align="center">
        <asp:HyperLink ID="HyperLinkContinueShopping" runat="server" NavigateUrl="~/CustomerProduct.aspx">Continue Shopping</asp:HyperLink>
    </div>
    <div align="center">
        <asp:GridView ID="GridViewShoppingCart" runat="server" AutoGenerateColumns="False" ShowFooter="True" EmptyDataText="No products in shopping cart" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
            <Columns>
                <asp:BoundField DataField="Number" HeaderText="Number">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ProductId" HeaderText="Product Id">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ProductName" HeaderText="Product Name">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:ImageField DataImageUrlFormatString="../Images/Products/{0}" HeaderText="Image" DataImageUrlField="ProductImage">
                    <ItemStyle HorizontalAlign="Center" />
                    <ControlStyle Height="100px" />
                </asp:ImageField>
                <asp:BoundField DataField="ProductPrice" DataFormatString="RM {0:n2}.00" HeaderText="Price">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="quantity" HeaderText="Quantity">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TotalPrice" DataFormatString="RM {0:n2}.00" HeaderText="Total Price">
                    <FooterStyle HorizontalAlign="Center"></FooterStyle>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="UpdateButton" runat="server" CausesValidation="False" CommandName="Select" Text="Update"></asp:Button>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Remove"></asp:Button>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
    </div>
    <div align="center">
        <asp:Button ID="ButtonCheckout" runat="server" Text="Checkout" CssClass="button buttonhover" />
    </div>
    <br />
    <div align="center">
        <asp:LinkButton ID="LinkButtonClearShoppingCart" runat="server">Clear Cart</asp:LinkButton>
    </div>
</asp:Content>
