<%@ Page Title="View Product Details" Language="vb" AutoEventWireup="false" MasterPageFile="~/Customer.Master" CodeBehind="ViewProductDetails.aspx.vb" Inherits="MyNewSystem.ViewProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            height: 134px;
            width: 129px;
        }
        .auto-style4 {
            width: 97px;
        }
        .auto-style5 {
            height: 134px;
            width: 97px;
        }
        .auto-style7 {
            width: 129px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <asp:DataList ID="DataListViewProduct" runat="server" DataSourceID="SqlDataSourceViewProduct" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <ItemTemplate>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style5">Product Image</td>
                        <td class="auto-style3">
                            <asp:Image ID="ImageProduct" runat="server" ImageUrl='<%# "~/Images/Products/" + Eval("ProductImage") %>' Height="479px" Width="397px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Product Id</td>
                        <td class="auto-style7">
                            <asp:Label ID="LabelProductId" runat="server" Text='<%# Eval("ProductId") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Product Name</td>
                        <td class="auto-style7">
                            <asp:Label ID="LabelProductName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Price</td>
                        <td class="auto-style7">RM<asp:Label ID="LabelProductPrice" runat="server" Text='<%# Eval("ProductPrice") %>'></asp:Label>.00
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Description</td>
                        <td class="auto-style7">
                            <asp:Label ID="LabelDescription" runat="server" Text='<%# Eval("ProductDescription") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Quantity</td>
                        <td>
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
                        <td></td>
                        <td>
                            <asp:Button ID="ButtonAddCart" runat="server" Text="Add Cart" CommandArgument='<%# Eval("ProductId")%>' CommandName="addcart" CssClass="button" />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
    </div>
    <div align="center">
        <asp:SqlDataSource ID="SqlDataSourceViewProduct" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>" SelectCommand="SELECT * FROM [Products] WHERE ([ProductId] = @ProductId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ProductId" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
