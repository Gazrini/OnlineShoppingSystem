Imports System.Data.SqlClient
Public Class Feedback
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub ButtonSubmit_Click(sender As Object, e As EventArgs) Handles ButtonSubmit.Click
        Dim TodayDate As String = DateTime.Now.ToLongDateString().ToString()
        Dim query As String = "Insert Into Feedback(CustomerName,Email,PhoneNumber,Message,Tarikh) Values('" & TextBoxName.Text & "','" + TextBoxEmail.Text & "','" + TextBoxPhoneNumber.Text & "','" + TextBoxMessage.Text & "','" + TodayDate & "')"
        Dim mycon As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
        Dim con As SqlConnection = New SqlConnection(mycon)
        con.Open()
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.CommandText = query
        cmd.Connection = con
        cmd.ExecuteNonQuery()
        TextBoxName.Text = ""
        TextBoxEmail.Text = ""
        TextBoxPhoneNumber.Text = ""
        TextBoxMessage.Text = ""
        LabelStatus.Text = "Thanks you for your feedback, we will reach you very soon."
        LabelStatus.ForeColor = System.Drawing.Color.Green
    End Sub
    Protected Sub ButtonClear_Click(sender As Object, e As EventArgs) Handles ButtonClear.Click
        TextBoxName.Text = ""
        TextBoxEmail.Text = ""
        TextBoxPhoneNumber.Text = ""
        TextBoxMessage.Text = ""
        LabelStatus.Text = ""
    End Sub
End Class