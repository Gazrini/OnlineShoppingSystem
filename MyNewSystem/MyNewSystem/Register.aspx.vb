Imports System.Data.SqlClient
Public Class Register
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        EwalletAccid()
        Custid()
        For Each item As ListItem In DropDownListState.Items
            DropDownListGender.Items.FindByValue("Choose Gender").Attributes.Add("style", "font-weight:bolder")
            DropDownListGender.Items.FindByValue("Choose Gender").Attributes.Add("disabled", "true")

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
    Private Function CheckEmail() As Boolean
        Dim CheckingEmail As Boolean = False
        Dim MyCon As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
        Dim MyQuery As String = "Select * from Customers where Email='" + TextBoxEmail.Text + "'"
        Dim Con As SqlConnection = New SqlConnection(MyCon)
        Dim Cmd As SqlCommand = New SqlCommand With {
            .CommandText = MyQuery,
            .Connection = Con
        }
        Dim Da As SqlDataAdapter = New SqlDataAdapter()
        Da.SelectCommand = Cmd
        Dim Ds As DataSet = New DataSet()

        Da.Fill(Ds)
        If (Ds.Tables(0).Rows.Count > 0) Then
            CheckingEmail = True
        End If
        Con.Close()
        Return CheckingEmail
    End Function
    Private Function CheckUsername() As Boolean
        Dim CheckingUsername As Boolean = False
        Dim MyCon As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
        Dim MyQuery As String = "Select * From Customers Where Username='" + TextBoxUsername.Text + "'"
        Dim Con As SqlConnection = New SqlConnection(MyCon)
        Dim Cmd As SqlCommand = New SqlCommand With {
            .CommandText = MyQuery,
            .Connection = Con
        }

        Dim Da As SqlDataAdapter = New SqlDataAdapter()
        Da.SelectCommand = Cmd
        Dim Ds As DataSet = New DataSet()

        Da.Fill(Ds)
        If (Ds.Tables(0).Rows.Count > 0) Then
            CheckingUsername = True
        End If
        Con.Close()
        Return CheckingUsername
    End Function
    Public Sub EwalletAccid() 'manually buat auto increment for ewallet account id
        Dim Number As Integer
        Dim RandomNumber As Random = New Random
        Dim query As String = "Select Max (AccountId) From Ewallet"
        Dim con As New SqlConnection
        Dim cmd As SqlCommand = New SqlCommand(query, con)
        Dim dr As SqlDataReader
        con.ConnectionString = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
        con.Open()
        dr = cmd.ExecuteReader()
        Number = RandomNumber.Next()
        If dr.Read() Then
            Dim val As String = dr(0).ToString()
            If val = "" Then
                LabelEwalletAccountId.Text = Number.ToString()
            Else
                Dim a As Integer
                a = Integer.Parse(dr(0).ToString())
                a = a + 1
                LabelEwalletAccountId.Text = a.ToString()
            End If
            con.Close()
        End If
    End Sub
    Public Sub Custid() 'manually buat auto increment for customer id
        Dim con As New SqlConnection
        con.ConnectionString = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
        con.Open()
        Dim query As String = "Select Max (CustomerId) From Customers"
        Dim cmd As SqlCommand = New SqlCommand(query, con)
        Dim dr As SqlDataReader
        dr = cmd.ExecuteReader()
        If dr.Read() Then
            Dim val As String = dr(0).ToString()

            If val = "" Then
                LabelCustomerId.Text = "1"
            Else
                Dim a As Integer
                a = Integer.Parse(dr(0).ToString())
                a = a + 1
                LabelCustomerId.Text = a.ToString()
            End If
            con.Close()
        End If
    End Sub
    Protected Sub ButtonRegister_Click(sender As Object, e As EventArgs) Handles ButtonRegister.Click
        CaptchaRegister.ValidateCaptcha(TextBoxCaptcha.Text.Trim())
        If (CheckEmail() = True) Then
            LabelCheckEmail.Text = "Email already registered"
            LabelCheckUsername.Text = ""
            LabelCheckEmail.ForeColor = System.Drawing.Color.Red
            TextBoxEmail.BorderColor = System.Drawing.Color.Red
            TextBoxUsername.BorderColor = System.Drawing.Color.Empty
        ElseIf (CheckUsername() = True) Then
            LabelCheckUsername.Text = "Username already registered"
            LabelCheckEmail.Text = ""
            LabelCheckUsername.ForeColor = System.Drawing.Color.Red
            TextBoxUsername.BorderColor = System.Drawing.Color.Red
            TextBoxEmail.BorderColor = System.Drawing.Color.Empty
        ElseIf TextBoxCaptcha.Text = "" Then
            LabelCaptcha.Text = "Enter Captcha to register"
            LabelCaptcha.ForeColor = System.Drawing.Color.Red
            MsgBox("Enter Captcha to register")
        ElseIf CaptchaRegister.UserValidated = False Then
            LabelCaptcha.Text = "Wrong captcha inserted"
            LabelCaptcha.ForeColor = System.Drawing.Color.Red
        Else
            Dim con As New SqlConnection
            Dim cmd As New SqlCommand
            Dim sql As String
            con.ConnectionString = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
            sql = "Insert Into Customers Values(@CustomerId, @FirstName, @LastName, @Gender, @Username, @Email, @PhoneNo, @AddressLine1, @AddressLine2, @PostalCode, @City, @State, @Country, @Password, @Role)" & "Insert Into Ewallet Values(@AccountId, @CustomerId, @Email, @Balance)"
            cmd = New SqlCommand(sql, con)
            'Insert customer data in Customers database table
            cmd.Parameters.AddWithValue("@CustomerId", LabelCustomerId.Text)
            cmd.Parameters.AddWithValue("@FirstName", TextBoxFirstName.Text)
            cmd.Parameters.AddWithValue("@LastName", TextBoxLastName.Text)
            cmd.Parameters.AddWithValue("@Gender", DropDownListGender.Text)
            cmd.Parameters.AddWithValue("@Username", TextBoxUsername.Text)
            cmd.Parameters.AddWithValue("@Email", TextBoxEmail.Text)
            cmd.Parameters.AddWithValue("@PhoneNo", TextBoxPhone.Text)
            cmd.Parameters.AddWithValue("@AddressLine1", TextBoxAddressLine1.Text)
            cmd.Parameters.AddWithValue("@AddressLine2", TextBoxAddressLine2.Text)
            cmd.Parameters.AddWithValue("@PostalCode", TextBoxPostalCode.Text)
            cmd.Parameters.AddWithValue("@City", TextBoxCity.Text)
            cmd.Parameters.AddWithValue("@State", DropDownListState.Text)
            cmd.Parameters.AddWithValue("@Country", DropDownListCountry.Text)
            cmd.Parameters.AddWithValue("@Password", TextBoxPassword.Text)
            cmd.Parameters.AddWithValue("@Role", "Customer")
            'Insert customer E-wallet data in Ewallet database
            cmd.Parameters.AddWithValue("@AccountId", LabelEwalletAccountId.Text)
            cmd.Parameters.AddWithValue("@CustomerIdEwalletDB", LabelCustomerId.Text)
            cmd.Parameters.AddWithValue("@EmailEwalletDB", TextBoxEmail.Text)
            cmd.Parameters.AddWithValue("@Balance", 0)
            Try
                con.Open()
                cmd.ExecuteNonQuery()
                MsgBox("Succesfully register an account", MsgBoxStyle.Information, "Register Success")
                LabelStatus.Text = "Registered Succesfully"
                LabelStatus.ForeColor = System.Drawing.Color.Green
                LabelCheckEmail.Text = ""
                LabelCheckEmail.ForeColor = System.Drawing.Color.Empty
                TextBoxEmail.BorderColor = System.Drawing.Color.Empty
            Catch ex As Exception
                MsgBox(ex.Message)
                LabelStatus.Text = "Register unsuccessfully"
                LabelStatus.ForeColor = System.Drawing.Color.Red
            Finally
                con.Close()
                Response.Redirect("Login.aspx")
            End Try
        End If
    End Sub
    Protected Sub ButtonClear_Click(sender As Object, e As EventArgs) Handles ButtonClear.Click
        TextBoxEmail.BorderColor = System.Drawing.Color.Empty
        TextBoxUsername.BorderColor = System.Drawing.Color.Empty
        TextBoxFirstName.Text = ""
        TextBoxLastName.Text = ""
        DropDownListGender.SelectedValue = "Choose Gender"
        DropDownListState.SelectedValue = "Choose State"
        DropDownListCountry.SelectedValue = "Choose Country"
        TextBoxUsername.Text = ""
        TextBoxEmail.Text = ""
        TextBoxPhone.Text = ""
        TextBoxAddressLine1.Text = ""
        TextBoxAddressLine2.Text = ""
        TextBoxPostalCode.Text = ""
        TextBoxCity.Text = ""
        TextBoxPassword.Text = ""
        LabelStatus.Text = ""
        LabelCheckEmail.Text = ""
        LabelCheckUsername.Text = ""
    End Sub
End Class