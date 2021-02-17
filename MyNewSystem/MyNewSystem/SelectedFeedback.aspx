<%@ Page Title="Selected Feedback" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin.Master" CodeBehind="SelectedFeedback.aspx.vb" Inherits="MyNewSystem.SelectedFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <b>Selected Feedback</b>
    </div>
    <div align="center">
        <asp:DataList ID="DataListSelectedFeedback" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both" DataKeyField="FeedbackId" DataSourceID="SqlDataSourceFeedback">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <ItemTemplate>
                <table style="border: thin solid #000000">
                    <tr style="border: thin solid #000000">
                        <td style="border: thin solid #000000">Feedback Id</td>
                        <td style="border: thin solid #000000">
                            <asp:Label ID="FeedbackIdLabel" runat="server" Text='<%# Eval("FeedbackId") %>' /></td>
                    </tr>
                    <tr style="border: thin solid #000000">
                        <td style="border: thin solid #000000">Customer Name</td>
                        <td style="border: thin solid #000000">
                            <asp:Label ID="CustomerNameLabel" runat="server" Text='<%# Eval("CustomerName") %>' /></td>
                    </tr>
                    <tr style="border: thin solid #000000">
                        <td style="border: thin solid #000000">Email</td>
                        <td style="border: thin solid #000000">
                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' /></td>
                    </tr>
                    <tr style="border: thin solid #000000">
                        <td style="border: thin solid #000000">Phone Number</td>
                        <td style="border: thin solid #000000">
                            <asp:Label ID="PhoneNumberLabel" runat="server" Text='<%# Eval("PhoneNumber") %>' /></td>
                    </tr>
                    <tr style="border: thin solid #000000">
                        <td style="border: thin solid #000000">Message</td>
                        <td style="border: thin solid #000000">
                            <asp:TextBox ID="TextBoxCustomerMessage" runat="server" Text='<%# Eval("Message") %>' TextMode="MultiLine" Height="97px" ReadOnly="True"></asp:TextBox>
                    </tr>
                    <tr style="border: thin solid #000000">
                        <td style="border: thin solid #000000">Date</td>
                        <td style="border: thin solid #000000">
                            <asp:Label ID="TarikhLabel" runat="server" Text='<%# Eval("Tarikh") %>' /></td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <br />
    <div align="center">
        <asp:LinkButton ID="LinkButtonReply" runat="server">Reply</asp:LinkButton>
    </div>
    <br />
    <div align="center">
        <table style="border: thin solid #000000; background-color: #FFCC66;" runat="server" visible="False" id="TableReply">
            <tr style="border: thin solid #000000">
                <td style="border: thin solid #000000">Email</td>
                <td style="border: thin solid #000000">
                    <asp:TextBox ID="TextBoxEmail" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr style="border: thin solid #000000">
                <td style="border: thin solid #000000">Message</td>
                <td>
                    <asp:TextBox ID="TextBoxAdminMessage" runat="server" Height="124px" TextMode="MultiLine" Width="215px"></asp:TextBox></td>
            </tr>
            <tr style="border: thin solid #000000">
                <td style="border: thin solid #000000"></td>
                <td style="border: thin solid #000000">
                    <asp:Button ID="ButtonSend" runat="server" Text="Send" CssClass="button buttonhover" /></td>
            </tr>
        </table>
    </div>
    <div align="center">
        <asp:SqlDataSource ID="SqlDataSourceFeedback" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>" SelectCommand="SELECT * FROM [Feedback] WHERE ([FeedbackId] = @FeedbackId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="FeedbackId" QueryStringField="FeedbackId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    <div align="center">
        <asp:Label ID="LabelStatus" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
