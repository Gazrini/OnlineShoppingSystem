<%@ Page Title="Withdraw" Language="vb" AutoEventWireup="false" MasterPageFile="~/Customer.Master" CodeBehind="Withdraw.aspx.vb" Inherits="MyNewSystem.Withdraw" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <b>
            <asp:Label ID="LabelTitle" runat="server" Text="Withdraw"></asp:Label></b>
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
                <asp:Label ID="LabelBank" runat="server" Text="Bank"></asp:Label>
            </td>
            <td style="border: thin solid #000000">
                <asp:DropDownList ID="DropDownListBank" runat="server">
                    <asp:ListItem Selected="True" Value="Choose Bank" Text="Choose Bank">Choose Bank</asp:ListItem>
                    <asp:ListItem Value="Cimb" Text="Cimb">Cimb</asp:ListItem>
                    <asp:ListItem Value="Maybank" Text="Maybank">Maybank</asp:ListItem>
                    <asp:ListItem Value="Bank Islam" Text="OCBC Bank">Bank Islam</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:RequiredFieldValidator ID="rfvbank" runat="server" ErrorMessage="Enter Bank" ControlToValidate="DropDownListBank" Display="Dynamic" ForeColor="Red" InitialValue="Choose Bank"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelBankAccount" runat="server" Text="Bank Account"></asp:Label>
            </td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxBankAccount" runat="server" PlaceHolder="Enter Bank Account"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvbankaccount" runat="server" ErrorMessage="Enter Bank Account" ControlToValidate="TextBoxBankAccount" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
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
                <asp:Label ID="LabelBalance" runat="server" Text="Balance "></asp:Label>
            </td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxBalance" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelWithdraw" runat="server" Text="Withdraw "></asp:Label>
            </td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxWithdraw" runat="server" ToolTip="Enter Withdraw Amount" Placeholder="Enter Withdraw Amount"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvwithdraw" runat="server" ErrorMessage="Enter Withdraw Amount" ControlToValidate="TextBoxWithdraw" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000"></td>
            <td style="border: thin solid #000000">
                <asp:Button ID="ButtonClear" runat="server" Text="Clear" CausesValidation="False" CssClass="button buttonhover" />
                <asp:Button ID="ButtonWithdraw" runat="server" Text="Withdraw" CssClass="button buttonhover" />
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
