Imports System.Data.SqlClient
Public Class AdminRegister
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Adminid()
    End Sub
    Public Sub Adminid() 'manually buat auto increment for admin id
        Dim con As New SqlConnection
        con.ConnectionString = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
        con.Open()
        Dim query As String = "Select Max (AdminId) From Admin"
        Dim cmd As SqlCommand = New SqlCommand(query, con)
        Dim dr As SqlDataReader
        dr = cmd.ExecuteReader()
        If dr.Read() Then
            Dim val As String = dr(0).ToString()

            If val = "" Then
                LabelAdminId.Text = "1"
            Else
                Dim a As Integer
                a = Integer.Parse(dr(0).ToString())
                a += 1
                LabelAdminId.Text = a.ToString()
            End If
            con.Close()
        End If
    End Sub
    Private Function CheckEmail() As Boolean
        Dim CheckingEmail As Boolean = False
        Dim MyCon As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
        Dim MyQuery As String = "Select * From Admin Where Email='" & TextBoxEmail.Text & "'"
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
        Dim MyQuery As String = "Select * From Admin Where Username='" & TextBoxUsername.Text & "'"
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
    Protected Sub ButtonRegister_Click(sender As Object, e As EventArgs) Handles ButtonRegister.Click
        If (CheckEmail() = True) Then
            LabelCheckEmail.Text = "Email already registered"
            LabelCheckEmail.ForeColor = System.Drawing.Color.Red
            TextBoxEmail.BorderColor = System.Drawing.Color.Red
        ElseIf (CheckUsername() = True) Then
            LabelCheckUsername.Text = "Username already registered"
            LabelCheckUsername.ForeColor = System.Drawing.Color.Red
            TextBoxUsername.BorderColor = System.Drawing.Color.Red
        Else
            Dim con As New SqlConnection
            Dim cmd As New SqlCommand
            Dim sql As String
            con.ConnectionString = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
            sql = "Insert Into Admin Values(@AdminId, @Email, @Username, @Password, @Role)"
            cmd = New SqlCommand(sql, con)
            'Insert customer data in Admin database table
            cmd.Parameters.AddWithValue("@AdminId", LabelAdminId.Text)
            cmd.Parameters.AddWithValue("@Username", TextBoxUsername.Text)
            cmd.Parameters.AddWithValue("@Email", TextBoxEmail.Text)
            cmd.Parameters.AddWithValue("@Password", TextBoxPassword.Text)
            cmd.Parameters.AddWithValue("@Role", "Admin")
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
                LabelStatus.Text = "Register unsuccessful"
                LabelStatus.ForeColor = System.Drawing.Color.Red
            Finally
                con.Close()
                Response.Redirect("AdminLogin.aspx")
            End Try
        End If
    End Sub
    Protected Sub ButtonClear_Click(sender As Object, e As EventArgs) Handles ButtonClear.Click
        TextBoxEmail.Text = ""
        TextBoxUsername.Text = ""
        TextBoxPassword.Text = ""
        TextBoxConfirmPassword.Text = ""
        LabelStatus.Text = ""
        LabelCheckEmail.Text = ""
        LabelCheckUsername.Text = ""
    End Sub
End Class