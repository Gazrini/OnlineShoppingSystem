<%@ Page Title="E-wallet" Language="vb" AutoEventWireup="false" MasterPageFile="~/Customer.Master" CodeBehind="Ewallet.aspx.vb" Inherits="MyNewSystem.Ewallet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <b>
            <asp:Label ID="LabelTitle" runat="server" Text="E-wallet Account"></asp:Label></b>
    </div>
    <table align="center" style="border: thin solid #000000; background-color: #FFCC66">
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelAccountId" runat="server" Text="Account Id"></asp:Label></td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxAccountId" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelBalance" runat="server" Text="Balance"></asp:Label></td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxBalance" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
    <div align="center">
        <asp:HyperLink ID="HyperLinkDeposit" runat="server" NavigateUrl="~/Deposit.aspx">Deposit</asp:HyperLink>
        <asp:HyperLink ID="HyperLinkWithdraw" runat="server" NavigateUrl="~/Withdraw.aspx">Withdraw</asp:HyperLink>
        <asp:HyperLink ID="HyperLinkTransfer" runat="server" NavigateUrl="~/Transfer.aspx">Transfer</asp:HyperLink>
        <asp:HyperLink ID="HyperLinkTransactionHistory" runat="server" NavigateUrl="~/TransactionHistory.aspx">Transaction History</asp:HyperLink>
    </div>
</asp:Content>
