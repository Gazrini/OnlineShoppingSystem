<%@ Page Title="Deposit" Language="vb" AutoEventWireup="false" MasterPageFile="~/Customer.Master" CodeBehind="Deposit.aspx.vb" Inherits="MyNewSystem.Deposit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <b>
            <asp:Label ID="LabelTitle" runat="server" Text="Deposit"></asp:Label></b>
    </div>
    <table align="center" style="background-color: #FFCC66; border: thin solid #000000">
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelAccountId" runat="server" Text="Account Id"></asp:Label>
            </td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxAccountId" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelDate" runat="server" Text="Date"></asp:Label>
            </td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxDate" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelBalance" runat="server" Text="Balance"></asp:Label>
            </td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxBalance" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelDeposit" runat="server" Text="Deposit"></asp:Label>
            </td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxDeposit" runat="server" ToolTip="Enter amount" PlaceHolder="Enter Deposit Amount"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvdeposit" runat="server" ErrorMessage="Enter Deposit Amount" ControlToValidate="TextBoxDeposit" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000"></td>
            <td style="border: thin solid #000000">
                <asp:Button ID="ButtonClear" runat="server" Text="Clear" CausesValidation="False" CssClass="button buttonhover" />
                <asp:Button ID="ButtonDeposit" runat="server" Text="Deposit" CssClass="button buttonhover" />
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
        <asp:Label ID="LabelStatus" runat="server"></asp:Label>
        <asp:Label ID="LabelTransactionId" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="LabelGetEmailValueFromSession" runat="server" Text="" Visible="False"></asp:Label>
    </div>
</asp:Content>
