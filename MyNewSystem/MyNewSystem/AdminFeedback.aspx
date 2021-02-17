<%@ Page Title="Feedback" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin.Master" CodeBehind="AdminFeedback.aspx.vb" Inherits="MyNewSystem.AdminFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <b>
            <asp:Label ID="LabelTitle" runat="server" Text="Feedback"></asp:Label></b>
    </div>
    <div align="center">
        <asp:GridView runat="server" ID="GridviewFeedback" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="FeedbackId" DataSourceID="SqlDataSourceFeedback" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" EmptyDataText="Feedback not available">
            <Columns>
                <asp:BoundField DataField="FeedbackId" HeaderText="Feedback Id" InsertVisible="False" ReadOnly="True" SortExpression="FeedbackId" />
                <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" SortExpression="CustomerName" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" SortExpression="PhoneNumber" />
                <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
                <asp:BoundField DataField="Tarikh" HeaderText="Date" SortExpression="Tarikh" />
                <asp:TemplateField HeaderText="Tick">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBoxChoose" runat="server" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
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
        <asp:SqlDataSource runat="server" ID="SqlDataSourceFeedback" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>" SelectCommand="SELECT * FROM [Feedback]"></asp:SqlDataSource>
    </div>
    <br />
    <div>
        <table align="center" style="background-color: #FFCC66; border: thin solid #000000">
            <tr style="border: thin solid #000000">
                <td style="border: thin solid #000000">Total Customers</td>
                <td style="border: thin solid #000000">
                    <asp:Label ID="LabelTotalCustomers" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr style="border: thin solid #000000">
                <td style="border: thin solid #000000">Subject</td>
                <td style="border: thin solid #000000">
                    <asp:TextBox ID="TextBoxSubject" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr style="border: thin solid #000000">
                <td style="border: thin solid #000000">Message</td>
                <td style="border: thin solid #000000">
                    <asp:TextBox ID="TextBoxMessage" runat="server" Height="139px" TextMode="MultiLine" Width="210px"></asp:TextBox>
                </td>
            </tr>
            <tr style="border: thin solid #000000">
                <td style="border: thin solid #000000">&nbsp;</td>
                <td style="border: thin solid #000000">
                    <asp:Button ID="ButtonClear" runat="server" Text="Clear" CssClass="button buttonhover" />
                    <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" CssClass="button buttonhover" />
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div align="center">
        <asp:Label ID="LabelStatus" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
