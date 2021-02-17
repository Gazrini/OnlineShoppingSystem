<%@ Page Title="Transfer" Language="vb" AutoEventWireup="false" MasterPageFile="~/Customer.Master" CodeBehind="Transfer.aspx.vb" Inherits="MyNewSystem.Transfer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <b>Transfer</b>
    </div>
    <table align="center" style="border: thin solid #000000; background-color: #FFCC66;">
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelFromAccountId" runat="server" Text="From"></asp:Label></td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxFromAccountId" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelToAccountId" runat="server" Text="To"></asp:Label></td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxToAccountId" runat="server" PlaceHolder="Enter Recipient Account"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvrecipient" runat="server" ErrorMessage="Enter Recipient Account" ControlToValidate="TextBoxToAccountId" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelDate" runat="server" Text="Date"></asp:Label></td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxDate" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelBalance" runat="server" Text="Balance"></asp:Label></td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxBalance" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelTransferAmount" runat="server" Text="Transfer Amount"></asp:Label></td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxTransferAmount" runat="server" PlaceHolder="Enter Transfer Amount"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvtransferamount" runat="server" ErrorMessage="Enter Transfer Amount" ControlToValidate="TextBoxTransferAmount" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000"></td>
            <td style="border: thin solid #000000">
                <asp:Button ID="ButtonClear" runat="server" Text="Clear" CausesValidation="False" CssClass="button buttonhover" />
                <asp:Button ID="ButtonTransfer" runat="server" Text="Transfer" CssClass="button buttonhover" />
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
    <br />
    <div align="center">
        <asp:Label ID="LabelStatus" runat="server" Text=""></asp:Label>
        <asp:Label ID="LabelTransactionId" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="LabelGetEmailValueFromSession" runat="server" Text="" Visible="False"></asp:Label>
    </div>
</asp:Content>
