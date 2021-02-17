<%@ Page Title="Register" Language="vb" AutoEventWireup="false" MasterPageFile="~/Guest.Master" CodeBehind="Register.aspx.vb" Inherits="MyNewSystem.Register" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <b>
            <asp:Label ID="LabelTitle" runat="server" Text="Register Account"></asp:Label></b>
    </div>
    <table align="center"  style="background-color: #FFCC66" border: thin solid #000000">
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000">
                <asp:Label ID="LabelFirstName" runat="server" Text="First Name"></asp:Label>
            </td>
            <td style="border: thin solid #000000">
                <asp:TextBox ID="TextBoxFirstName" runat="server" placeholder="Enter First Name"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvfname" runat="server" ErrorMessage="Enter First Name" ControlToValidate="TextBoxFirstName" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000" >
                <asp:Label ID="LabelLastName" runat="server" Text="Last Name"></asp:Label>
            </td>
            <td style="border: thin solid #000000" >
                <asp:TextBox ID="TextBoxLastName" runat="server" placeholder="Enter Last Name"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvlname" runat="server" ErrorMessage="Enter Last Name" ControlToValidate="TextBoxLastName" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000" >
                <asp:Label ID="LabelGender" runat="server" Text="Gender"></asp:Label>
            </td>
            <td style="border: thin solid #000000" >
                <asp:DropDownList ID="DropDownListGender" runat="server">
                    <asp:ListItem Selected="True" Text="Choose Gender" Value="Choose Gender">Choose Gender</asp:ListItem>
                    <asp:ListItem Text="Male" Value="Male">Male</asp:ListItem>
                    <asp:ListItem Text="Female" Value="Female">Female</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:RequiredFieldValidator ID="rfvgender" runat="server" ErrorMessage="Enter Gender" ControlToValidate="DropDownListGender" Display="Dynamic" ForeColor="Red" InitialValue="Choose Gender"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000" >
                <asp:Label ID="LabelUsername" runat="server" Text="Username"></asp:Label>
            </td>
            <td style="border: thin solid #000000" >
                <asp:TextBox ID="TextBoxUsername" runat="server" PlaceHolder="Enter Username"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvusername" runat="server" ControlToValidate="TextBoxUsername" Display="Dynamic" ErrorMessage="Enter Username" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000" >
                <asp:Label ID="LabelEmail" runat="server" Text="Email"></asp:Label>
            </td>
            <td style="border: thin solid #000000" >
                <asp:TextBox ID="TextBoxEmail" runat="server" placeholder="Enter Email"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvemail" runat="server" ErrorMessage="Enter Email" ControlToValidate="TextBoxEmail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000" >
                <asp:Label ID="LabelPhone" runat="server" Text="Phone Number"></asp:Label>
            </td>
            <td style="border: thin solid #000000" >
                <asp:TextBox ID="TextBoxPhone" runat="server" placeholder="Enter Phone"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvphone" runat="server" ErrorMessage="Enter Phone Number" ControlToValidate="TextBoxPhone" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000" >
                <asp:Label ID="LabelAddressLine1" runat="server" Text="Address Line 1"></asp:Label>
                <br />
            </td>
            <td style="border: thin solid #000000" >
                <asp:TextBox ID="TextBoxAddressLine1" runat="server" PlaceHolder="e.g: A-02-23 Sri Camellia Apartment"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvaddressline1" runat="server" ErrorMessage="Enter Address Line 1" Display="Dynamic" ForeColor="Red" ControlToValidate="TextBoxAddressLine1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000" >
                <asp:Label ID="LabelAddressLine2" runat="server" Text="Address Line 2"></asp:Label>
            </td>
            <td style="border: thin solid #000000" >
                <asp:TextBox ID="TextBoxAddressLine2" runat="server" PlaceHolder="e.g: Jalan Puteri 7/1 Bandar Puteri"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvaddressline2" runat="server" ErrorMessage="Enter Address Line 2" ControlToValidate="TextBoxAddressLine2" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr >
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000" >
                <asp:Label ID="LabelPostalCode" runat="server" Text="Postal Code"></asp:Label>
            </td>
            <td style="border: thin solid #000000" >
                <asp:TextBox ID="TextBoxPostalCode" runat="server" PlaceHolder="e.g: 47100"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvpostalcode" runat="server" ErrorMessage="Enter Postal Code" ControlToValidate="TextBoxPostalCode" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000" >
                <asp:Label ID="LabelCity" runat="server" Text="City"></asp:Label>
            </td>
            <td style="border: thin solid #000000" >
                <asp:TextBox ID="TextBoxCity" runat="server" PlaceHolder="e.g: Puchong"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvcity" runat="server" ErrorMessage="Enter City" ControlToValidate="TextBoxCity" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000" >
                <asp:Label ID="LabelState" runat="server" Text="State"></asp:Label>
            </td>
            <td style="border: thin solid #000000" >
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
                <asp:RequiredFieldValidator ID="rfvstate" runat="server" ErrorMessage="Enter State" ControlToValidate="DropDownListState" Display="Dynamic" ForeColor="Red" InitialValue="Choose State"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000" >
                <asp:Label ID="LabelCountry" runat="server" Text="Country"></asp:Label>
            </td>
            <td style="border: thin solid #000000" >
                <asp:DropDownList ID="DropDownListCountry" runat="server">
                    <asp:ListItem Selected="True" Text="Choose Country" Value="Choose Country">Choose Country</asp:ListItem>
                    <asp:ListItem Text="Malaysia" Value="Malaysia">Malaysia</asp:ListItem>
                    <asp:ListItem Text="Singapore" Value="Singapore">Singapore</asp:ListItem>
                    <asp:ListItem Text="Malaysia" Value="Brunei">Brunei</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:RequiredFieldValidator ID="rfvcountry" runat="server" ErrorMessage="Enter Country" ControlToValidate="DropDownListCountry" Display="Dynamic" ForeColor="Red" InitialValue="Choose Country"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000" >
                <asp:Label ID="LabelPassword" runat="server" Text="Password"></asp:Label>
            </td>
            <td style="border: thin solid #000000" >
                <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvpassword" runat="server" ErrorMessage="Enter Password" ControlToValidate="TextBoxPassword" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000" >
                <asp:Label ID="LabelConfirmPassword" runat="server" Text="Confirm Password"></asp:Label>
            </td>
            <td style="border: thin solid #000000" >
                <asp:TextBox ID="TextBoxConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvconfirmpassword" runat="server" ErrorMessage="Enter Confirm Password" ControlToValidate="TextBoxConfirmPassword" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator><br />
                <asp:CompareValidator ID="cvconfirmpassword" runat="server" ErrorMessage="Password Not Match" ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxConfirmPassword" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr style="border: thin solid #000000">
            <td style="border: thin solid #000000"></td>
            <td style="border: thin solid #000000">
                <asp:Button ID="ButtonClear" runat="server" Text="Clear" CausesValidation="False" CssClass="button buttonhover" />
                &nbsp;<asp:Button ID="ButtonRegister" runat="server" Text="Register" CssClass="button buttonhover" />
            </td>
        </tr>
    </table>
    <br />
    <div>
        <asp:Panel ID="PanelCaptcha" runat="server">
            <table align="center">
                <tr style="border: thin solid #000000">
                    <td style="border: thin solid #000000">
                        <cap:CaptchaControl ID="CaptchaRegister" runat="server" CaptchaLength="5" CaptchaHeight="50" CaptchaWidth="200" CaptchaLineNoise="None" CaptchaMinTimeout="3" CaptchaMaxTimeout="240" ForeColor="Blue" BackColor=" #FFCC66" CaptchaChars="ABCDEFGHIJKLMNOPQRSTUVWX123456789" Height="46px" Width="200px" />
                    </td>
                </tr>
                <tr style="border: thin solid #000000">
                    <td style="border: thin solid #000000">
                        <asp:TextBox ID="TextBoxCaptcha" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="border: thin solid #000000">
                    <td style="border: thin solid #000000">
                        <asp:Label ID="LabelCaptcha" runat="server" Text=""></asp:Label>
                    </td>

                </tr>
                <tr style="border: thin solid #000000">
                    <td style="border: thin solid #000000">
                        <asp:Button ID="ButtonCaptcha" runat="server" Text="Refresh" CssClass="button buttonhover" CausesValidation="False" />
                    </td>
      
                </tr>
            </table>
        </asp:Panel>
    </div>
    <div align="center">
        <asp:Label ID="LabelStatus" runat="server" Text=""></asp:Label>
        <asp:Label ID="LabelCheckEmail" runat="server" Text=""></asp:Label>
        <asp:Label ID="LabelCheckUsername" runat="server"></asp:Label>
    </div>
    <br />
    <div align="center">
        <asp:Label ID="LabelInformation" runat="server" Text="E-wallet Account Id:" Visible="False"></asp:Label>
        <asp:Label ID="LabelEwalletAccountId" runat="server" Visible="False"></asp:Label>
        <br />
        <asp:Label ID="LabelCustomerId" runat="server" Visible="False"></asp:Label>
    </div>
</asp:Content>
