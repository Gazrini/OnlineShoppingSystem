<%@ Page Title="Add Product" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin.Master" CodeBehind="AddProduct.aspx.vb" Inherits="MyNewSystem.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center"><b>Add Product</b></div>
    <table align="center" style="background-color: #FFCC66; border: thin solid #000000">
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelProductId" runat="server" Text="Product Id"></asp:Label></td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxProductId" runat="server" ReadOnly="True"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelCategory" runat="server" Text="Category"></asp:Label></td>
            <td style="border: thin solid #000000">
                <asp:DropDownList ID="DropDownListCategoryId" runat="server">
                    <asp:ListItem Selected="True" Text="Choose Category" Value="Choose Category">Choose Category</asp:ListItem>
                    <asp:ListItem Text="Hoodie" Value="1">Hoodie</asp:ListItem>
                    <asp:ListItem Text="Jeans" Value="2">Jeans</asp:ListItem>
                    <asp:ListItem Text="Sneakers" Value="3">Sneakers</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:RequiredFieldValidator ID="rfvproductcategory" runat="server" ErrorMessage="Enter Product Category" ControlToValidate="DropDownListCategoryId" Display="Dynamic" ForeColor="Red" InitialValue="Choose Category"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelProductName" runat="server" Text="Product Name"></asp:Label></td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxProductName" runat="server"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvproductname" runat="server" ErrorMessage="Enter Product Name" ControlToValidate="TextBoxProductName" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelProductDescription" runat="server" Text="Description"></asp:Label></td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxProductDescription" runat="server" Height="68px" TextMode="MultiLine"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvproductdescription" runat="server" ErrorMessage="Enter Product Description" ControlToValidate="TextBoxProductDescription" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelProductPrice" runat="server" Text="Price"></asp:Label></td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxProductPrice" runat="server"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvproductprice" runat="server" ErrorMessage="Enter Product Price" ControlToValidate="TextBoxProductPrice" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelProductQuantity" runat="server" Text="Quantity"></asp:Label></td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxProductQuantity" runat="server"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvproductquantity" runat="server" ErrorMessage="Enter Product Quantity" ControlToValidate="TextBoxProductQuantity" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelProductImage" runat="server" Text="Image"></asp:Label></td>
            <td style="border: thin solid #000000">
                <asp:FileUpload ID="FileUploadProductImage" runat="server" Width="220px" />
                <br />
                <br />
                <asp:Image ID="ImageProduct" runat="server" BorderColor="#003300" BorderStyle="Solid" Height="115px" ImageUrl="~/Images/Camera Icon/Camera.png" Width="104px" BorderWidth="1px" />
                <br />
                <asp:RequiredFieldValidator ID="rfvproductimage" runat="server" ErrorMessage="Enter Product Image" ControlToValidate="FileUploadProductImage" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000"></td>
            <td style="border: thin solid #000000">
                <asp:Button ID="ButtonClear" runat="server" Text="Clear" CausesValidation="False" CssClass="button buttonhover" />
                <asp:Button ID="ButtonAdd" runat="server" Text="Add" CssClass="button buttonhover" />
            </td>
        </tr>
    </table>
    <br />
    <div align="center">
        <asp:Label ID="LabelStatus" runat="server"></asp:Label>
        <asp:Label ID="LabelStatusImage" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
