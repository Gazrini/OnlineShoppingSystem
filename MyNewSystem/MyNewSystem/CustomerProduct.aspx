<%@ Page Title="Products" Language="vb" AutoEventWireup="false" MasterPageFile="~/Customer.Master" CodeBehind="CustomerProduct.aspx.vb" Inherits="MyNewSystem.CustomerProduct" %>

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
        <asp:HyperLink ID="HyperlinkShoppingCart" runat="server" NavigateUrl="~/ShoppingCart.aspx">View Shopping Cart</asp:HyperLink>
    </div>
    <div align="center">
        <b>
            <asp:Label ID="LabelCategoryTitle" runat="server" Text="Category"></asp:Label></b>
        <br />
        <asp:LinkButton ID="LinkButtonAllCategory" runat="server">All</asp:LinkButton>
        <asp:LinkButton ID="LinkButtonHoodie" runat="server">Hoodie</asp:LinkButton>
        <asp:LinkButton ID="LinkButtonJeans" runat="server">Jeans</asp:LinkButton>
        <asp:LinkButton ID="LinkButtonSneakers" runat="server">Sneakers</asp:LinkButton>
    </div>
        <div align="center" border: thin solid #000000">
        <table style="border: thin solid #000000">
            <tr style="border: thin solid #000000">
                <td style="border: thin solid #000000">
                    <asp:Label ID="LabelSortPrice" runat="server" Text="Sort Price"></asp:Label></td>
                <td style="border: thin solid #000000">
                    <asp:DropDownList ID="DropDownListSortPrice" runat="server">
                        <asp:ListItem Value="Low to high">Low to high</asp:ListItem>
                        <asp:ListItem Value="High to low">High to low</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr style="border: thin solid #000000">
                <td style="border: thin solid #000000"></td>
                <td style="border: thin solid #000000">
                    <asp:Button ID="ButtonSort" runat="server" Text="Sort"  CssClass=" button buttonhover"/></td>
            </tr>
        </table>
    </div>
    <div align="center">
       <asp:DataList runat="server" ID="DataListProduct" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyField="ProductId" DataSourceID="SqlDataSourceProduct" GridLines="Both" RepeatColumns="3" RepeatDirection="Horizontal">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <ItemTemplate>
                <div align="center">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="LabelProductId" runat="server" Text='<%# Eval("ProductId") %>' Visible="False"></asp:Label></b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>
                                    <asp:Label ID="LabelProductName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label></b>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Image ID="ImageProduct" runat="server" ImageUrl='<%# "~/Images/Products/" + Eval("ProductImage") %>' Height="100" BorderStyle="Solid" BorderWidth="1px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="LabelProductDescription" runat="server" Text='<%# Eval("ProductDescription") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="LabelProductPrice" runat="server" Text='<%# "RM " & Eval("ProductPrice") & ".00" %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>Quantity
                                <asp:DropDownList ID="DropDownListProductQuantity" runat="server">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="ButtonViewProductDetails" runat="server" Text="View Details" CommandArgument='<%# Eval("ProductId")%>' CommandName="viewproductdetails" CssClass=" button" />
                                <asp:Button ID="ButtonAddCart" runat="server" Text="Add Cart" CommandArgument='<%# Eval("ProductId")%>' CommandName="addcart" CssClass=" button" />
                            </td>
                        </tr>
                        <tr>
                            <td align="center">                              
                                <asp:ImageButton ID="ImageButtonWishlist" runat="server" CommandArgument='<%# Eval("ProductId")%>' CommandName="addtowishlist" />
                                <br />
                                <asp:Label ID="LabelWishlistStatus" runat="server" Text=""></asp:Label> 
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                               Product Stock:<b><asp:Label ID="LabelProductAvailability" runat="server" Text=""></asp:Label></b> 
                            </td>
                        </tr>
                    </table>
            </ItemTemplate>
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
        <br />
                <asp:Label ID="LabelEmptyDatalistMessage" Visible="False" runat="server" Text=""></asp:Label>
    </div>
    <div align="center">
        <asp:SqlDataSource ID="SqlDataSourceProduct" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>
    </div>
    <div align="center">
        <asp:SqlDataSource ID="SqlDataSourceProductCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>" SelectCommand="SELECT * FROM [Products] WHERE ([CategoryId] = @CategoryId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="CategoryId" QueryStringField="CategoryId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div align="center">
        <asp:SqlDataSource ID="SqlDataSourceSortPriceAscending" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>" SelectCommand="SELECT * FROM [Products] ORDER BY [ProductPrice]"></asp:SqlDataSource>
    </div>
    <div align="center">
        <asp:SqlDataSource ID="SqlDataSourceSortPriceDescending" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>" SelectCommand="SELECT * FROM [Products] ORDER BY [ProductPrice] DESC"></asp:SqlDataSource>
    </div>
</asp:Content>
