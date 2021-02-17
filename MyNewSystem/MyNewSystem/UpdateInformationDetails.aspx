<%@ Page Title="Update Information" Language="vb" AutoEventWireup="false" MasterPageFile="~/Customer.Master" CodeBehind="UpdateInformationDetails.aspx.vb" Inherits="MyNewSystem.UpdateInformationDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%;">
        <tr>
            <td rowspan="3">&nbsp;</td>
            <td></td>
            <td rowspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <div align="center">
                    <b>
                        <asp:Label ID="LabelTitle" runat="server" Text="Update Information Details"></asp:Label></b>
                </div>
                <table align="center" style="background-color: #FFCC66" border: thin solid #000000">
                                        <tr style="border: thin solid #000000">
                        <td style="border: thin solid #000000" >
                            <asp:Label ID="LabelFirstName" runat="server" Text="First Name"></asp:Label>
                        </td>
                        <td style="border: thin solid #000000">
                            <asp:TextBox ID="TextBoxFirstName" runat="server"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="rfvfirstname" runat="server" ErrorMessage="Enter First Name" ControlToValidate="TextBoxFirstName" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr style="border: thin solid #000000">
                        <td style="border: thin solid #000000">
                            <asp:Label ID="LabelLastName" runat="server" Text="Last Name"></asp:Label>
                        </td>
                        <td style="border: thin solid #000000">
                            <asp:TextBox ID="TextBoxLastName" runat="server"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="rfvlastname" runat="server" ErrorMessage="Enter Last Name" ControlToValidate="TextBoxLastName" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr style="border: thin solid #000000">
                        <td style="border: thin solid #000000">
                            <asp:Label ID="LabelUsername" runat="server" Text="Username"></asp:Label>
                        </td>
                        <td style="border: thin solid #000000">
                            <asp:TextBox ID="TextBoxUsername" runat="server"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="rfvusername" runat="server" ErrorMessage="Enter Username" ControlToValidate="TextBoxUsername" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr style="border: thin solid #000000">
                        <td style="border: thin solid #000000">
                            <asp:Label ID="LabelPhoneNumber" runat="server" Text="Phone Number"></asp:Label>
                        </td>
                        <td style="border: thin solid #000000">
                            <asp:TextBox ID="TextBoxPhoneNumber" runat="server"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="rfvphonenumber" runat="server" ErrorMessage="Enter Phone Number" ControlToValidate="TextBoxPhoneNumber" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr style="border: thin solid #000000">
                        <td style="border: thin solid #000000">
                            <asp:Label ID="LabelEmail" runat="server" Text="Email"></asp:Label>
                        </td>
                        <td style="border: thin solid #000000">
                            <asp:TextBox ID="TextBoxEmail" runat="server" ReadOnly="True"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="rfvemail" runat="server" ErrorMessage="Enter Email" ControlToValidate="TextBoxEmail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr style="border: thin solid #000000">
                        <td style="border: thin solid #000000">
                            <asp:Label ID="LabelAddressLine1" runat="server" Text="Address Line 1"></asp:Label>
                        </td>
                        <td style="border: thin solid #000000">
                            <asp:TextBox ID="TextBoxAddressLine1" runat="server"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="rfvaddressline1" runat="server" ErrorMessage="Enter Address Line 1" ControlToValidate="TextBoxAddressLine1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr style="border: thin solid #000000">
                        <td style="border: thin solid #000000">
                            <asp:Label ID="LabelAddressLine2" runat="server" Text="Address Line 2"></asp:Label>
                        </td>
                        <td style="border: thin solid #000000">
                            <asp:TextBox ID="TextBoxAddressLine2" runat="server"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="rfvaddressline2" runat="server" ErrorMessage="Enter Address Line 2" ControlToValidate="TextBoxAddressLine2" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr style="border: thin solid #000000">
                        <td style="border: thin solid #000000">
                            <asp:Label ID="LabelPostalCode" runat="server" Text="Postal Code"></asp:Label>
                        </td>
                        <td style="border: thin solid #000000">
                            <asp:TextBox ID="TextBoxPostalCode" runat="server"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Postal Code" ControlToValidate="TextBoxPostalCode" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr style="border: thin solid #000000">
                        <td style="border: thin solid #000000">
                            <asp:Label ID="LabelCity" runat="server" Text="City"></asp:Label>
                        </td>
                        <td style="border: thin solid #000000">
                            <asp:TextBox ID="TextBoxCity" runat="server"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="rfvcity" runat="server" ErrorMessage="Enter City" ControlToValidate="TextBoxCity" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr style="border: thin solid #000000">
                        <td style="border: thin solid #000000">
                            <asp:Label ID="LabelState" runat="server" Text="State"></asp:Label>
                        </td>
                        <td style="border: thin solid #000000">
                            <asp:DropDownList ID="DropDownListState" runat="server">
                                <asp:ListItem Selected="True" Text="Choose State" Value="Choose State">Choose State</asp:ListItem>
                                <asp:ListItem Text="" Value="Seperator1">-----------------</asp:ListItem>
                                <asp:ListItem Text="Malaysia" Value="Malaysia">Malaysia</asp:ListItem>
                                <asp:ListItem Text="Johor" Value="Johor">Johor</asp:ListItem>
                                <asp:ListItem Text="Kedah" Value="Kedah">Kedah</asp:ListItem>
                                <asp:ListItem Text="Kelantan" Value="Kelantan">Kelantan</asp:ListItem>
                                <asp:ListItem Text="Kuala Lumpur" Value="Kuala Lumpur">Kuala Lumpur</asp:ListItem>
                                <asp:ListItem Text="Labuan" Value="Labuan">Labuan</asp:ListItem>
                                <asp:ListItem Text="Malacca" Value="Malacca">Malacca</asp:ListItem>
                                <asp:ListItem Text="Negeri Sembilan" Value="Negeri Sembilan">Negeri Sembilan</asp:ListItem>
                                <asp:ListItem Text="Pahang" Value="Pahang">Pahang</asp:ListItem>
                                <asp:ListItem Text="Penang" Value="Penang">Penang</asp:ListItem>
                                <asp:ListItem Text="Perak" Value="Perak">Perak</asp:ListItem>
                                <asp:ListItem Text="Perlis" Value="Perlis">Perlis</asp:ListItem>
                                <asp:ListItem Text="Putrajaya" Value="Putrajaya">Putrajaya</asp:ListItem>
                                <asp:ListItem Text="Sabah" Value="Sabah">Sabah</asp:ListItem>
                                <asp:ListItem Text="Sarawak" Value="Sarawak">Sarawak</asp:ListItem>
                                <asp:ListItem Text="Selangor" Value="Selangor">Selangor</asp:ListItem>
                                <asp:ListItem Text="Terengganu" Value="Terengganu">Terengganu</asp:ListItem>
                                <asp:ListItem Text="" Value="Seperator2">-----------------</asp:ListItem>
                                <asp:ListItem Text="Singapore" Value="Singapore">Singapore</asp:ListItem>
                                <asp:ListItem Text="Central Region" Value="Central Region">Central Region</asp:ListItem>
                                <asp:ListItem Text="East Region" Value="East Region">East Region</asp:ListItem>
                                <asp:ListItem Text="North Region" Value="North Region">North Region</asp:ListItem>
                                <asp:ListItem Text="North-East Region" Value="North-East Region">North-East Region</asp:ListItem>
                                <asp:ListItem Text="West Region" Value="West Region">West Region</asp:ListItem>
                                <asp:ListItem Text="" Value="Seperator3">-----------------</asp:ListItem>
                                <asp:ListItem Text="Brunei" Value="Brunei">Brunei</asp:ListItem>
                                <asp:ListItem Text="Belait" Value="Belait">Belait</asp:ListItem>
                                <asp:ListItem Text="Brunei-Muara" Value="Brunei Muara">Brunei-Muara</asp:ListItem>
                                <asp:ListItem Text="Temburong" Value="Temburong">Temburong</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:RequiredFieldValidator ID="rfvstate" runat="server" ErrorMessage="Enter State" ControlToValidate="DropDownListState" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr style="border: thin solid #000000">
                        <td style="border: thin solid #000000">
                            <asp:Label ID="LabelCountry" runat="server" Text="Country"></asp:Label>
                        </td>
                        <td style="border: thin solid #000000">
                            <asp:DropDownList ID="DropDownListCountry" runat="server">
                                <asp:ListItem Selected="True" Text="Choose Country" Value="Choose Country">Choose Country</asp:ListItem>
                                <asp:ListItem Text="Malaysia" Value="Malaysia">Malaysia</asp:ListItem>
                                <asp:ListItem Text="Singapore" Value="Singapore">Singapore</asp:ListItem>
                                <asp:ListItem Text="Malaysia" Value="Brunei">Brunei</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:RequiredFieldValidator ID="rfvcountry" runat="server" ErrorMessage="Enter Country" ControlToValidate="DropDownListCountry" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr style="border: thin solid #000000">
                        <td style="border: thin solid #000000"></td>
                        <td style="border: thin solid #000000">               
                            <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" CausesValidation="False" CssClass="button buttonhover" />
                            <asp:Button ID="ButtonUpdate" runat="server" Text="Update" CssClass="button buttonhover"/>
                        </td>
                    </tr>
                </table>
                <br />
                <div align="center">
                    <asp:Label ID="LabelStatus" runat="server" Text=""></asp:Label>
                </div>
            </td>
        </tr>
        <tr>
            <td></td>
        </tr>
    </table>
</asp:Content>
