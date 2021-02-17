﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Customer.Master" CodeBehind="SearchOrders.aspx.vb" Inherits="MyNewSystem.SearchOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <table style="border: thin solid #000000; background-color: #FFE4B5">
            <tr style="border: thin solid #000000">
                <td style="border: thin solid #000000">
                    <asp:Label ID="LabelSearchOrder" runat="server" Text="Order Id"></asp:Label>
                </td>
                <td style="border: thin solid #000000">
                    <asp:TextBox ID="TextBoxOrderId" runat="server" PlaceHolder="Enter Order Id" autocomplete="off"></asp:TextBox>
                </td>
            </tr>
            <tr style="border: thin solid #000000">
                <td style="border: thin solid #000000"></td>
                <td style="border: thin solid #000000">
                    <asp:Button ID="ButtonReset" runat="server" Text="Reset" CausesValidation="False" CssClass="button buttonhover" />
                    <asp:Button ID="ButtonSearch" runat="server" Text="Search" CssClass="button buttonhover" />
                </td>
            </tr>
        </table>
    </div>
    <div align="center">
        <asp:GridView ID="GridViewAllOrders" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSourceAllOrders" AllowPaging="True" EmptyDataText="Order not available">
            <Columns>
                <asp:BoundField DataField="OrderId" HeaderText="Order Id" SortExpression="OrderId" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="DateOfOrder" HeaderText="Order Date" SortExpression="DateOfOrder" />
                <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" DataFormatString="RM {0:n2}.00" SortExpression="TotalPrice">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="ButtonSelect" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:Button>
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
        <asp:GridView ID="GridViewFilterOrders" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" AutoGenerateColumns="False" DataSourceID="SqlDataSourceFilterOrders" AllowPaging="True" Visible="False" EmptyDataText="Order not available">
            <Columns>
                <asp:BoundField DataField="OrderId" HeaderText="Order Id" SortExpression="OrderId" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="DateOfOrder" HeaderText="Order Date" SortExpression="DateOfOrder" />
                <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" DataFormatString="RM {0:n2}.00" SortExpression="TotalPrice">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="ButtonSelect" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:Button>
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
        <asp:RequiredFieldValidator ID="rfvdate" runat="server" ControlToValidate="TextBoxOrderId" Display="Dynamic" ErrorMessage="Enter Order Id" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    <div align="center">
        <asp:SqlDataSource ID="SqlDataSourceAllOrders" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>" SelectCommand="SELECT * FROM [Orders] WHERE ([Email] = @Email)">
            <SelectParameters>
                <asp:SessionParameter Name="Email" SessionField="Email" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    <div align="center">
        <asp:SqlDataSource ID="SqlDataSourceFilterOrders" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>" SelectCommand="SELECT * FROM [Orders] WHERE (([OrderId] = @OrderId) AND ([Email] = @Email))">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBoxOrderId" Name="OrderId" PropertyName="Text" Type="String" />
                <asp:SessionParameter Name="Email" SessionField="Email" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>