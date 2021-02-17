<%@ Page Title="Update Product" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin.Master" CodeBehind="UpdateProduct.aspx.vb" Inherits="MyNewSystem.UpdateProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center"><b>
        <asp:Label ID="LabelTitle" runat="server" Text="Update Product"></asp:Label></b></div>
    <div align="center">
        <asp:DropDownList ID="DropDownListSelectCategory" runat="server" AutoPostBack="True" AppendDataBoundItems="True" DataTextField="CategoryId" DataValueField="CategoryId">
            <asp:ListItem Text="All Category" Value="All Category">All Category</asp:ListItem>
            <asp:ListItem Text="Hoodie" Value="1">Hoodie</asp:ListItem>
            <asp:ListItem Text="Jeans" Value="2">Jeans</asp:ListItem>
            <asp:ListItem Text="Sneakers" Value="3">Sneakers</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div align="center">
        <asp:GridView ID="GridViewUpdateProduct" runat="server" AllowPaging="True" AutoGenerateColumns="False" EmptyDataText="No products available" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
            <Columns>
                <asp:TemplateField HeaderText="Product Id">
                    <ItemTemplate>
                        <asp:Label ID="LabelProductId" runat="server" Text='<%# Eval("ProductId") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxProductName" runat="server" Text='<%# Eval("ProductName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelProductName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product Description">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxProductDescription" runat="server" Text='<%# Eval("ProductDescription") %>' TextMode="MultiLine"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelProductDescription" runat="server" Text='<%# Eval("ProductDescription") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product Price">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxProductPrice" runat="server" Text='<%# Eval("ProductPrice") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelProductPrice" runat="server" Text='<%# "RM " & Eval("ProductPrice") & ".00" %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product Quantity">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxProductQuantity" runat="server" Text='<%# Eval("ProductQuantity") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelProductQuantity" runat="server" Text='<%# Eval("ProductQuantity") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product Image">
                    <EditItemTemplate>
                        <asp:FileUpload ID="FileUploadProductImage" runat="server" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="ImageProduct" runat="server" ImageUrl='<%# Eval("ProductImage", "~/Images/Products/{0}") %>' Height="100px" Width="92px" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Category">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownListProductCategory" runat="server" DataTextField="CategoryId" DataValueField="CategoryId" SelectedValue='<%# Eval("CategoryId") %>'>
                            <asp:ListItem Text="Hoodie" Value="1">Hoodie</asp:ListItem>
                            <asp:ListItem Text="Jeans" Value="2">Jeans</asp:ListItem>
                            <asp:ListItem Text="Sneakers" Value="3">Sneakers</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelCategoryId" runat="server" Text='<%# Eval("CategoryId") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButtonUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButtonCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="ButtonEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:Button>
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
</asp:Content>
