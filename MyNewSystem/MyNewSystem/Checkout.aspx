<%@ Page Title="Checkout" Language="vb" AutoEventWireup="false" MasterPageFile="~/Customer.Master" CodeBehind="Checkout.aspx.vb" Inherits="MyNewSystem.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <b>
            <asp:Label ID="LabelTitle" runat="server" Text="Checkout"></asp:Label></b>
    </div>
    <div align="center">
        <asp:GridView ID="GridViewCheckout" runat="server" AutoGenerateColumns="False" ShowFooter="True" EmptyDataText="No Product available" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
            <Columns>
                <asp:BoundField DataField="Number" HeaderText="Number">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ProductId" HeaderText="ProductId">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ProductName" HeaderText="ProductName">
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
    <br />
    <div align="center">
        <b>
            <asp:Label ID="LabelOrderDetails" runat="server" Text="Order Details"></asp:Label></b>
    </div>
    <table align="center" style="border: thin solid #000000; background-color: #FFCC66;">
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">Order Id</td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxOrderId" runat="server" ReadOnly="True"></asp:TextBox></td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">Order Date</td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxDateOfOrder" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">Username</td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxUsername" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">Email</td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxEmail" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">Phone Number</td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxPhoneNumber" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">Address</td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxAddress" runat="server" Height="78px" TextMode="MultiLine" Width="207px"></asp:TextBox>
            </td>
        </tr>
    </table>
    <div align="center">
        E-wallet account number
        <b>
            <asp:Label ID="LabelEwalletAccountId" runat="server"></asp:Label></b>&nbsp;your balance is 
        <b>RM
            <asp:Label ID="LabelEWalletBalance" runat="server"></asp:Label>.00</b>
    </div>
    <div align="center">
        <b>
            <asp:Label ID="LabelTitleSelectPayment" runat="server" Text="Select Payment Method"></asp:Label></b>
    </div>
    <div align="center">
        <asp:RadioButtonList ID="RadioButtonListPayment" runat="server" RepeatDirection="Horizontal" AutoPostBack="True">
            <asp:ListItem Value="EWallet">EWallet</asp:ListItem>
            <asp:ListItem Value="Cash">Cash</asp:ListItem>
        </asp:RadioButtonList>
        <asp:Button ID="ButtonCash" runat="server" Text="Cash" Visible="False" CssClass="button buttonhover" />
        <asp:Button ID="ButtonEwallet" runat="server" Text="E-wallet" Visible="False" CssClass="button buttonhover" />
    </div>
    <br />
    <div align="center">
        <asp:Button ID="ButtonCancelShopping" runat="server" Text="Cancel Shopping" Visible="False" CssClass="button buttonhover" />
    </div>
    <div align="center">
        <asp:Label ID="LabelCustomerId" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="LabelTransactionId" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="LabelEwalletBalanceStatus" runat="server"></asp:Label>
        <asp:Label ID="LabelStatus" runat="server"></asp:Label>
        <br />
    </div>
    <div align="center">
        <asp:Label ID="LabelProductIdInGridview" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="LabelProductQuantityInGridview" runat="server" Text="" Visible="False"></asp:Label>
        <asp:Label ID="LabelGetEmailValueFromSession" runat="server" Text="" Visible="False"></asp:Label>
    </div>
</asp:Content>
