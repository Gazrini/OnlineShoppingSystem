Imports System.Data.SqlClient
Imports System.Net.Mail
Public Class AdminFeedback
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CountCustomer()
    End Sub
    Private Sub CountCustomer()
        Dim mycon As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
        Dim myquery As String = "Select Count(*) from Customers"
        Dim con As SqlConnection = New SqlConnection(mycon)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.CommandText = myquery
        cmd.Connection = con
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        da.SelectCommand = cmd
        Dim ds As DataSet = New DataSet()
        da.Fill(ds)
        LabelTotalCustomers.Text = ds.Tables(0).Rows(0)(0).ToString()
        con.Close()
    End Sub
    Private Sub SendEmailToCustomer(ByVal CustomerEmail As String)
        Dim smtp As SmtpClient = New SmtpClient()
        smtp.Host = "smtp.gmail.com"
        smtp.Port = 587
        smtp.Credentials = New System.Net.NetworkCredential("admiiiineshop@gmail.com", "admin_1234")
        smtp.EnableSsl = True
        Dim msg As MailMessage = New MailMessage()
        msg.Subject = TextBoxSubject.Text
        msg.Body = TextBoxMessage.Text & vbLf & vbLf & vbLf & "Thanks & Regards." & vbLf & "Online shopping system with E-wallet"
        Dim EmailTo As String = CustomerEmail
        msg.[To].Add(EmailTo)
        Dim EmailFrom As String = "Admin <admiiiineshop@gmail.com>"
        msg.From = New MailAddress(EmailFrom)
        Try
            smtp.Send(msg)
        Catch
            Throw
        End Try
        LabelStatus.Text = "Email sent to " & CustomerEmail
        LabelStatus.ForeColor = System.Drawing.Color.Green
        'Response.Write("Email sent to " & CustomerEmail)
    End Sub
    Protected Sub GridviewFeedback_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridviewFeedback.SelectedIndexChanged
        Response.Redirect("SelectedFeedback.aspx?FeedbackId=" & GridviewFeedback.SelectedRow.Cells(0).Text)
    End Sub
    Protected Sub ButtonSubmit_Click(sender As Object, e As EventArgs) Handles ButtonSubmit.Click
        For Each row As GridViewRow In GridviewFeedback.Rows
            Dim Status As CheckBox = (TryCast(row.Cells(6).FindControl("CheckBoxChoose"), CheckBox))
            Dim CustomerEmail As String = row.Cells(2).Text
            If Status.Checked Then
                SendEmailToCustomer(CustomerEmail)
            End If
        Next
    End Sub
    Public Sub CheckBoxClear() 'Uncheck checkbox inside the gridview
        For Each row As GridViewRow In GridviewFeedback.Rows
            If row.RowType = DataControlRowType.DataRow Then
                Dim CheckBoxRow As CheckBox = CType(row.FindControl("CheckBoxChoose"), CheckBox)
                If CheckBoxRow.Checked Then CheckBoxRow.Checked = False
            End If
        Next
    End Sub
    Protected Sub ButtonClear_Click(sender As Object, e As EventArgs) Handles ButtonClear.Click
        TextBoxSubject.Text = ""
        TextBoxMessage.Text = ""
        LabelStatus.Text = ""
        CheckBoxClear()
    End Sub
End Class