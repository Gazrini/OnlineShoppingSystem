Imports System.Data.SqlClient
Public Class Login
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Private Function CheckEmail() As Boolean 'Check email function
        Dim CheckingEmail As Boolean = False
        Dim MyCon As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
        Dim MyQuery As String = "Select * From Customers Where Email='" & TextBoxEmail.Text & "'"
        Dim Con As SqlConnection = New SqlConnection(MyCon)
        Dim Cmd As SqlCommand = New SqlCommand With {
            .CommandText = MyQuery,
            .Connection = Con
        } 'ni ilustrate cmd.CommanText = MyQuery, cmd.Connection = Con
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
    Private Sub SaveProductInShoppingCart()
        Dim dt As DataTable = New DataTable()
        Dim dr As DataRow
        dt.Columns.Add("Number")
        dt.Columns.Add("ProductId")
        dt.Columns.Add("ProductName")
        dt.Columns.Add("ProductImage")
        dt.Columns.Add("ProductPrice")
        dt.Columns.Add("Quantity")
        dt.Columns.Add("TotalPrice")
        Dim mycon As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
        Dim scon As SqlConnection = New SqlConnection(mycon)
        Dim myquery As String = "Select * From SaveShoppingCartDetails Where Email='" & Session("Email").ToString() & "'"
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.CommandText = myquery
        cmd.Connection = scon
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        da.SelectCommand = cmd
        Dim ds As DataSet = New DataSet()
        da.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            Dim i As Integer = 0
            Dim counter As Integer = ds.Tables(0).Rows.Count
            While i < counter
                dr = dt.NewRow()
                dr("Number") = i + 1
                dr("ProductId") = ds.Tables(0).Rows(i)("ProductId").ToString()
                dr("ProductName") = ds.Tables(0).Rows(i)("ProductName").ToString()
                dr("ProductImage") = ds.Tables(0).Rows(i)("ProductImage").ToString()
                dr("Quantity") = ds.Tables(0).Rows(i)("Quantity").ToString()
                dr("ProductPrice") = ds.Tables(0).Rows(i)("ProductPrice").ToString()
                Dim Quantity As Integer = Convert.ToInt16(ds.Tables(0).Rows(i)("Quantity").ToString())
                Dim Price As Integer = Convert.ToInt16(ds.Tables(0).Rows(i)("ProductPrice").ToString())
                Dim TotalPrice As Integer = Price * Quantity
                dr("TotalPrice") = TotalPrice
                dt.Rows.Add(dr)
                i = i + 1
            End While
        Else
            Session("buyproduct") = Nothing
        End If
        Session("buyproduct") = dt
    End Sub
    Protected Sub ButtonLogin_Click(sender As Object, e As EventArgs) Handles ButtonLogin.Click
        'Check email valid or not by using CheckEmail() function
        If (CheckEmail() = False) Then
            LabelCheckEmail.Text = "Email is not exist or is incorrect"
            LabelCheckEmail.ForeColor = System.Drawing.Color.Red
            TextBoxEmail.BorderColor = System.Drawing.Color.Red
            TextBoxPassword.BorderColor = System.Drawing.Color.Empty
            LabelPasswordStatus.Text = ""
        Else
            Dim Sql As String = "Select * From Customers Where Email=@Email"
            Dim Con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnStringStoreDB").ConnectionString)
            Dim Cmd As SqlCommand = New SqlCommand(Sql, Con)
            Cmd.Parameters.AddWithValue("@Email", TextBoxEmail.Text)
            Dim Sda As SqlDataAdapter = New SqlDataAdapter(Cmd)
            Dim Dt As DataTable = New DataTable()
            Sda.Fill(Dt)
            If Dt.Rows.Count > 0 Then
                Dim objEmail As Object = Dt.Rows(0)("Email")
                Dim objPassword As Object = Dt.Rows(0)("Password")
                Dim objrole As Object = Dt.Rows(0)("Role")

                Dim Email As String = objEmail
                Dim Password As String = objPassword
                Dim Role As String = objrole
                If TextBoxEmail.Text = Email And TextBoxPassword.Text = Password Then
                    Session("Email") = TextBoxEmail.Text
                    Session("Role") = Role
                    If Role = "Customer" Then
                        LabelStatus.Text = "Login Successful"
                        SaveProductInShoppingCart()
                        Response.Redirect("CustomerHomepage.aspx")
                    Else
                        Response.Redirect("Login.aspx")
                        Session.RemoveAll()
                    End If
                ElseIf TextBoxEmail.Text = Email And TextBoxPassword.Text <> Password Then
                    If Role = "Customer" Then
                        TextBoxPassword.BorderColor = System.Drawing.Color.Red
                        LabelPasswordStatus.Text = "Incorrect password"
                        LabelPasswordStatus.ForeColor = System.Drawing.Color.Red
                        TextBoxEmail.BorderColor = System.Drawing.Color.Empty
                        LabelCheckEmail.Text = ""
                    Else
                        Response.Redirect("Login.aspx")
                        Session.RemoveAll()
                    End If
                Else
                    Response.Redirect("Login.aspx")
                    Session.RemoveAll()
                End If
            Else
                Response.Redirect("Login.aspx")
                Session.RemoveAll()
            End If
        End If
    End Sub
    Protected Sub ButtonClear_Click(sender As Object, e As EventArgs) Handles ButtonClear.Click
        TextBoxEmail.BorderColor = System.Drawing.Color.Empty
        TextBoxPassword.BorderColor = System.Drawing.Color.Empty
        TextBoxEmail.Text = ""
        TextBoxPassword.Text = ""
        LabelCheckEmail.Text = ""
        LabelPasswordStatus.Text = ""
    End Sub
End Class