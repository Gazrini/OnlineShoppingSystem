Imports System.Data.SqlClient
Public Class UpdateInformationDetails
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Using con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnStringStoreDB").ConnectionString)
                Using cmd As SqlCommand = New SqlCommand("Select * From Customers where Email = @email", con)
                    cmd.Parameters.AddWithValue("@Email", Session("Email"))
                    cmd.CommandType = CommandType.Text
                    con.Open()
                    Using reader As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection Or CommandBehavior.SingleResult Or CommandBehavior.SingleRow)
                        If reader.Read() Then
                            TextBoxFirstName.Text = reader.GetString(1)
                            TextBoxLastName.Text = reader.GetString(2)
                            TextBoxUsername.Text = reader.GetString(4)
                            TextBoxEmail.Text = reader.GetString(5)
                            TextBoxPhoneNumber.Text = reader.GetString(6)
                            TextBoxAddressLine1.Text = reader.GetString(7)
                            TextBoxAddressLine2.Text = reader.GetString(8)
                            TextBoxPostalCode.Text = reader.GetString(9)
                            TextBoxCity.Text = reader.GetString(10)
                            DropDownListState.Text = reader.GetString(11)
                            DropDownListCountry.Text = reader.GetString(12)
                        End If
                    End Using
                End Using
            End Using
        End If
        For Each item As ListItem In DropDownListState.Items
            DropDownListState.Items.FindByValue("Choose State").Attributes.Add("style", "font-weight:bolder")
            DropDownListState.Items.FindByValue("Choose State").Attributes.Add("disabled", "true")

            DropDownListState.Items.FindByValue("Malaysia").Attributes.Add("style", "font-weight:bolder")
            DropDownListState.Items.FindByValue("Malaysia").Attributes.Add("disabled", "true")

            DropDownListState.Items.FindByValue("Singapore").Attributes.Add("style", "font-weight:bolder")
            DropDownListState.Items.FindByValue("Singapore").Attributes.Add("disabled", "true")

            DropDownListState.Items.FindByValue("Brunei").Attributes.Add("style", "font-weight:bolder")
            DropDownListState.Items.FindByValue("Brunei").Attributes.Add("disabled", "true")

            DropDownListState.Items.FindByValue("Seperator1").Attributes.Add("style", "font-weight:bolder")
            DropDownListState.Items.FindByValue("Seperator1").Attributes.Add("disabled", "true")

            DropDownListState.Items.FindByValue("Seperator2").Attributes.Add("style", "font-weight:bolder")
            DropDownListState.Items.FindByValue("Seperator2").Attributes.Add("disabled", "true")

            DropDownListState.Items.FindByValue("Seperator3").Attributes.Add("style", "font-weight:bolder")
            DropDownListState.Items.FindByValue("Seperator3").Attributes.Add("disabled", "true")

            DropDownListCountry.Items.FindByValue("Choose Country").Attributes.Add("style", "font-weight:bolder")
            DropDownListCountry.Items.FindByValue("Choose Country").Attributes.Add("disabled", "true")
        Next
    End Sub
    Protected Sub ButtonUpdate_Click(sender As Object, e As EventArgs) Handles ButtonUpdate.Click
        Using con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnStringStoreDB").ConnectionString)
            Using cmd As SqlCommand = New SqlCommand("Update Customers set FirstName = @firstname, LastName = @lastname, Username = @username, PhoneNo = @phone, AddressLine1 = @addressline1, AddressLine2 = @addressline2, PostalCode = @postalcode, City = @city, State = @state, Country=@country where Email = @email", con)
                cmd.Parameters.AddWithValue("@firstname", TextBoxFirstName.Text)
                cmd.Parameters.AddWithValue("@lastname", TextBoxLastName.Text)
                cmd.Parameters.AddWithValue("@username", TextBoxUsername.Text)
                cmd.Parameters.AddWithValue("@phone", TextBoxPhoneNumber.Text)
                cmd.Parameters.AddWithValue("@addressline1", TextBoxAddressLine1.Text)
                cmd.Parameters.AddWithValue("@addressline2", TextBoxAddressLine2.Text)
                cmd.Parameters.AddWithValue("@postalcode", TextBoxPostalCode.Text)
                cmd.Parameters.AddWithValue("@city", TextBoxCity.Text)
                cmd.Parameters.AddWithValue("@state", DropDownListState.Text)
                cmd.Parameters.AddWithValue("@country", DropDownListCountry.Text)
                cmd.Parameters.AddWithValue("@email", Session("Email"))
                cmd.CommandType = CommandType.Text
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Using
        LabelStatus.Text = "Information Details Updated"
        LabelStatus.ForeColor = System.Drawing.Color.Green
    End Sub
    Protected Sub ButtonCancel_Click(sender As Object, e As EventArgs) Handles ButtonCancel.Click
        Response.Redirect("UpdateInformationDetails.aspx")
    End Sub
End Class