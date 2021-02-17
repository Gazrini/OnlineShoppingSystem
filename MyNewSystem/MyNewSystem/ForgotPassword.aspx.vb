Imports System.Data.SqlClient
Imports System.Net.Mail
Public Class ForgotPassword
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Private Sub SendPasswordResetEmail(ByVal toEmail As String, ByVal Email As String, ByVal UniqueId As String)
        Dim mailMessage As MailMessage = New MailMessage("admiiiineshop@gmail.com", toEmail)
        Dim sbEmailBody As StringBuilder = New StringBuilder()
        sbEmailBody.Append("Dear " & Email & ",<br/><br/>")
        sbEmailBody.Append("Please click on the following link to reset your password")
        sbEmailBody.Append("<br/>")
        sbEmailBody.Append("http://localhost:53363/ResetPassword.aspx?uid=" & UniqueId)
        sbEmailBody.Append("<br/><br/>")
        mailMessage.IsBodyHtml = True
        mailMessage.Body = sbEmailBody.ToString()
        mailMessage.Subject = "Reset your password"
        Dim smtpClient As SmtpClient = New SmtpClient("smtp.gmail.com", 587)
        smtpClient.Credentials = New System.Net.NetworkCredential() With {
            .UserName = "admiiiineshop@gmail.com",
            .Password = "admin_1234" 'Real email password
        }
        smtpClient.EnableSsl = True
        smtpClient.Send(mailMessage)
    End Sub
    Protected Sub ButtonSubmit_Click(sender As Object, e As EventArgs) Handles ButtonSubmit.Click
        Dim CS As String = ConfigurationManager.ConnectionStrings("ConnStringStoreDB").ConnectionString
        Using con As SqlConnection = New SqlConnection(CS)
            Dim cmd As SqlCommand = New SqlCommand("spResetPassword", con)
            cmd.CommandType = CommandType.StoredProcedure
            Dim paramEmail As SqlParameter = New SqlParameter("@email", TextBoxEmail.Text)
            cmd.Parameters.Add(paramEmail)
            con.Open()
            Dim rdr As SqlDataReader = cmd.ExecuteReader()
            While rdr.Read()
                If Convert.ToBoolean(rdr("ReturnCode")) Then
                    SendPasswordResetEmail(rdr("Email").ToString(), TextBoxEmail.Text, rdr("UniqueId").ToString())
                    LabelStatus.Text = "Link to reset your password has been sent to your email"
                    LabelStatus.ForeColor = System.Drawing.Color.Green
                Else
                    LabelStatus.ForeColor = System.Drawing.Color.Red
                    LabelStatus.Text = "Email not found"
                End If
            End While
        End Using
    End Sub
    Protected Sub ButtonClear_Click(sender As Object, e As EventArgs) Handles ButtonClear.Click
        TextBoxEmail.Text = ""
        LabelStatus.Text = ""
    End Sub
End Class