<%@ Page Title="Wishlist" Language="vb" AutoEventWireup="false" MasterPageFile="~/Customer.Master" CodeBehind="Wishlist.aspx.vb" Inherits="MyNewSystem.Wishlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <asp:HyperLink ID="HyperLinkContinueShopping" runat="server" NavigateUrl="~/CustomerProduct.aspx">Continue Shopping</asp:HyperLink>
    </div>
    <div align="center">
        <asp:GridView ID="GridViewWishlist" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" EmptyDataText="No products in the wishlist">
            <Columns>
                <asp:BoundField DataField="ProductId" HeaderText="Product Id">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ProductName" HeaderText="Product Name">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:ImageField HeaderText="Image" DataImageUrlFormatString="../Images/Products/{0}" DataImageUrlField="ProductImage">
                    <ControlStyle Height="100px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:ImageField>
                <asp:BoundField DataField="ProductPrice" DataFormatString="RM {0:n2}.00" HeaderText="Product Price">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="ButtonRemove" runat="server" CausesValidation="False" CommandName="Delete" Text="Remove"></asp:Button>
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
        <asp:LinkButton ID="LinkButtonClearWishlist" runat="server">Clear Wishlist</asp:LinkButton>
    </div>
</asp:Content>
