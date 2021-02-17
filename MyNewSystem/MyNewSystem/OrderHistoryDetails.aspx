<%@ Page Title="Order Details" Language="vb" AutoEventWireup="false" MasterPageFile="~/Customer.Master" CodeBehind="OrderHistoryDetails.aspx.vb" Inherits="MyNewSystem.OrderHistoryDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <asp:GridView ID="GridViewOrderDetails" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSourceOrderDetails">
            <Columns>
                <asp:BoundField DataField="OrderId" HeaderText="Order Id" SortExpression="OrderId" />
                <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" SortExpression="CustomerName" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" SortExpression="PhoneNumber" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" />
                <asp:BoundField DataField="ProductPrice" HeaderText="Product Price" DataFormatString="RM {0:n2}.00" SortExpression="ProductPrice">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" DataFormatString="RM {0:n2}.00" SortExpression="TotalPrice">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="DateOfOrder" HeaderText="Order Date" SortExpression="DateOfOrder" />
                <asp:BoundField DataField="PaymentType" HeaderText="Payment Type" SortExpression="PaymentType" />
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
        <asp:SqlDataSource ID="SqlDataSourceOrderDetails" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>" SelectCommand="SELECT * FROM [OrderDetails] WHERE ([OrderId] = @OrderId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="OrderId" QueryStringField="OrderId" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    <div align="center">
        <asp:Panel ID="PanelReceipt" runat="server" Height="470px" Width="829px">
            <table border="1">
                <tr>
                    <td>
                        <div align="center">
                            <b>Receipt</b>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><b>Order Id:</b><br />
                        <asp:Label ID="LabelOrderId" runat="server"></asp:Label>
                        <br />
                        <br />
                        <b>Order Date:</b><br />
                        <asp:Label ID="LabelOrderDate" runat="server"></asp:Label>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <b>Name:</b>
                                    <asp:Label ID="LabelCustomerName" runat="server"></asp:Label>
                                    <br />
                                    <br />
                                    <b>Email:</b>
                                    <asp:Label ID="LabelCustomerEmail" runat="server"></asp:Label>
                                    <br />
                                    <br />
                                    <b>Phone Number:</b>
                                    <asp:Label ID="LabelCustomerPhoneNumber" runat="server"></asp:Label>
                                    <br />
                                    <br />
                                    <b>Address</b>
                                    <asp:Label ID="LabelCustomerAddress" runat="server"></asp:Label>
                                    <br />
                                    <br />
                                    <b>Payment Type</b>
                                    <asp:Label ID="LabelPaymentType" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <b>Seller:</b>
                                    <br />
                                    Online shopping system with E-wallet
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridViewProductReceipt" runat="server" AutoGenerateColumns="False" Width="808px">
                            <Columns>
                                <asp:BoundField DataField="Number" HeaderText="Number">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ProductName" HeaderText="Product Name">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ProductPrice" DataFormatString="RM {0:n2}.00" HeaderText="Price">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="quantity" HeaderText="Quantity">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TotalPrice" DataFormatString="RM {0:n2}.00" HeaderText="Total Price">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Total: RM<asp:Label ID="LabelTotal" runat="server"></asp:Label>.00
                        </b>
                    </td>
                </tr>
                <tr>
                    <td>Declaration: We declare that this receipt shows actual price of the goods described inclusive of taxes and that all particulars are correct.
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
        <br />
        <br />
        <br />
        <div align="center">
            <asp:Button ID="ButtonDownload" runat="server" Height="50px" Text="Download Invoice" Width="156px" CssClass="button buttonhover" />
        </div>
    </div>
</asp:Content>
