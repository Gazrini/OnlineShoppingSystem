<%@ Page Title="Transaction History" Language="vb" AutoEventWireup="false" MasterPageFile="~/Customer.Master" CodeBehind="TransactionHistory.aspx.vb" Inherits="MyNewSystem.TransactionHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <b>Transaction History</b>
    </div>
    <div align="center">
        <asp:GridView ID="GridViewTransactionHistory" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="TransactionId" DataSourceID="SqlDataSourceTransactionHistory" EmptyDataText="Transaction not available">
            <Columns>
                <asp:BoundField DataField="TransactionId" HeaderText="Transaction Id" ReadOnly="True" SortExpression="TransactionId" NullDisplayText="-">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="AccountId" HeaderText="Account Id" SortExpression="AccountId" NullDisplayText="-">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" NullDisplayText="-">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" NullDisplayText="-" />
                <asp:BoundField DataField="Deposit" HeaderText="Deposit" SortExpression="Deposit" DataFormatString="RM {0:n2}" NullDisplayText="-">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Withdraw" HeaderText="Withdraw" SortExpression="Withdraw" DataFormatString="RM {0:n2}" NullDisplayText="-">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Bank" HeaderText="Bank" SortExpression="Bank" NullDisplayText="-">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="BankAccount" HeaderText="Bank Account" SortExpression="BankAccount" NullDisplayText="-">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TransferAmount" HeaderText="Transfer Amount" SortExpression="TransferAmount" DataFormatString="RM {0:n2}" NullDisplayText="-">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="SenderAccount" HeaderText="Sender Account" SortExpression="SenderAccount" NullDisplayText="-">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RecipientAccount" HeaderText="Recipient Account" SortExpression="RecipientAccount" NullDisplayText="-">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="OrderId" HeaderText="Order Id" SortExpression="OrderId" NullDisplayText="-">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PurchaseAmount" HeaderText="Purchase Amount" SortExpression="PurchaseAmount" DataFormatString="RM {0:n2}.00" NullDisplayText="-">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Balance" HeaderText="Balance" SortExpression="Balance" DataFormatString="RM {0:n2}" NullDisplayText="-">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="ButtonSelect" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:Button>
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
        <asp:SqlDataSource ID="SqlDataSourceTransactionHistory" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>" SelectCommand="SELECT * FROM [EwalletTransactions] WHERE ([Email] = @Email)">
            <SelectParameters>
                <asp:SessionParameter Name="Email" SessionField="Email" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>