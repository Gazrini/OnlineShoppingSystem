Imports System.Data.SqlClient
Public Class AdminLogin
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Private Function CheckEmail() As Boolean 'Check email function
        Dim CheckingEmail As Boolean = False
        Dim MyCon As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
        Dim MyQuery As String = "Select * From Admin Where Email='" & TextBoxEmail.Text & "'"
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
    Protected Sub ButtonLogin_Click(sender As Object, e As EventArgs) Handles ButtonLogin.Click
        'Check email valid or not by using CheckEmail() function
        If (CheckEmail() = False) Then
            LabelCheckEmail.Text = "Email is not exist or is incorrect"
            LabelCheckEmail.ForeColor = System.Drawing.Color.Red
            TextBoxEmail.BorderColor = System.Drawing.Color.Red
            TextBoxPassword.BorderColor = System.Drawing.Color.Empty
            LabelPasswordStatus.Text = ""
        Else
            Dim Sql As String = "Select * From Admin Where Email=@Email"
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
                    If Role = "Admin" Then
                        LabelStatus.Text = "Login Successful"
                        Response.Redirect("AdminHomepage.aspx")
                    Else
                        Response.Redirect("AdminLogin.aspx")
                        Session.RemoveAll()
                    End If
                ElseIf TextBoxEmail.Text = Email And TextBoxPassword.Text <> Password Then
                    If Role = "Admin" Then
                        TextBoxPassword.BorderColor = System.Drawing.Color.Red
                        LabelPasswordStatus.Text = "Incorrect password"
                        LabelPasswordStatus.ForeColor = System.Drawing.Color.Red
                        TextBoxEmail.BorderColor = System.Drawing.Color.Empty
                        LabelCheckEmail.Text = ""
                    Else
                        Response.Redirect("AdminLogin.aspx")
                        Session.RemoveAll()
                    End If
                Else
                    Response.Redirect("AdminLogin.aspx")
                    Session.RemoveAll()
                End If
            Else
                Response.Redirect("AdminLogin.aspx")
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