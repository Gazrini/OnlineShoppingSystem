Imports System.Data.SqlClient
Imports System.Net.Mail
Public Class SelectedFeedback
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        For Each item As DataListItem In DataListSelectedFeedback.Items
            TextBoxEmail.Text = (CType((item.FindControl("EmailLabel")), Label)).Text
        Next
    End Sub
    Protected Sub LinkButtonReply_Click(sender As Object, e As EventArgs) Handles LinkButtonReply.Click
        TableReply.Visible = True
    End Sub
    Protected Sub ButtonSend_Click(sender As Object, e As EventArgs) Handles ButtonSend.Click
        Dim smtp As SmtpClient = New SmtpClient()
        smtp.Host = "smtp.gmail.com"
        smtp.Port = 587
        smtp.Credentials = New System.Net.NetworkCredential("admiiiineshop@gmail.com", "admin_1234")
        smtp.EnableSsl = True
        Dim msg As MailMessage = New MailMessage()
        msg.Subject = "Thank you for your feedback"
        msg.Body = TextBoxAdminMessage.Text
        msg.IsBodyHtml = True
        Dim EmailTo As String = (TextBoxEmail.Text)
        msg.[To].Add(EmailTo)
        Dim EmailFrom As String = "admiiiineshop@gmail.com"
        msg.From = New MailAddress(EmailFrom)
        Try
            smtp.Send(msg)
        Catch
            Throw
        End Try

        LabelStatus.Text = "Email sent to " & TextBoxEmail.Text
        LabelStatus.ForeColor = System.Drawing.Color.Green
    End Sub
End Class