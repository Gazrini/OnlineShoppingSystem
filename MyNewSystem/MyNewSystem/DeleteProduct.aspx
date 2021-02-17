<%@ Page Title="Delete Product" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin.Master" CodeBehind="DeleteProduct.aspx.vb" Inherits="MyNewSystem.DeleteProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <b>
            <asp:Label ID="LabelTitle" runat="server" Text="Delete Product"></asp:Label></b>
    </div>
    <div align="center">
        <asp:DropDownList ID="DropDownListProductCategory" runat="server" AutoPostBack="True" DataTextField="CategoryName" DataValueField="CategoryId" DataSourceID="SqlDataSourceDDL">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceDDL" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
    </div>
    <div align="center">
        <asp:GridView ID="GridViewDeleteProduct" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ProductId" DataSourceID="SqlDataSourceGridview" EmptyDataText="No products available" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
            <Columns>
                <asp:BoundField DataField="ProductId" HeaderText="Product Id" ReadOnly="True" SortExpression="ProductId">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" />
                <asp:BoundField DataField="ProductDescription" HeaderText="Product Description" SortExpression="ProductDescription" />
                <asp:BoundField DataField="ProductPrice" HeaderText="Product Price" DataFormatString="RM {0:n2}.00" SortExpression="ProductPrice">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ProductQuantity" HeaderText="Product Quantity" SortExpression="ProductQuantity">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:ImageField HeaderText="Product Image" DataImageUrlField="ProductImage" DataImageUrlFormatString="../Images/Products/{0}" ReadOnly="True">
                    <ControlStyle Height="100px" Width="92px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:ImageField>
                <asp:BoundField DataField="CategoryId" HeaderText="Category" SortExpression="CategoryId">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:Button>
                    </ItemTemplate>
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
        <asp:SqlDataSource ID="SqlDataSourceGridview" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>" DeleteCommand="DELETE FROM [Products] WHERE [ProductId] = @ProductId" InsertCommand="INSERT INTO [Products] ([ProductId], [CategoryId], [ProductName], [ProductDescription], [ProductPrice], [ProductQuantity], [ProductImage]) VALUES (@ProductId, @CategoryId, @ProductName, @ProductDescription, @ProductPrice, @ProductQuantity, @ProductImage)" SelectCommand="SELECT * FROM [Products] WHERE ([CategoryId] = @CategoryId)" UpdateCommand="UPDATE [Products] SET [CategoryId] = @CategoryId, [ProductName] = @ProductName, [ProductDescription] = @ProductDescription, [ProductPrice] = @ProductPrice, [ProductQuantity] = @ProductQuantity, [ProductImage] = @ProductImage WHERE [ProductId] = @ProductId">
            <DeleteParameters>
                <asp:Parameter Name="ProductId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ProductId" Type="Int32" />
                <asp:Parameter Name="CategoryId" Type="Int32" />
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="ProductDescription" Type="String" />
                <asp:Parameter Name="ProductPrice" Type="String" />
                <asp:Parameter Name="ProductQuantity" Type="Int32" />
                <asp:Parameter Name="ProductImage" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownListProductCategory" Name="CategoryId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="CategoryId" Type="Int32" />
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="ProductDescription" Type="String" />
                <asp:Parameter Name="ProductPrice" Type="String" />
                <asp:Parameter Name="ProductQuantity" Type="Int32" />
                <asp:Parameter Name="ProductImage" Type="String" />
                <asp:Parameter Name="ProductId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
