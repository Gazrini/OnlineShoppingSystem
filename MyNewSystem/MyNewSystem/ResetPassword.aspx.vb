Imports System.Data.SqlClient
Public Class ResetPassword
    Inherits System.Web.UI.Page
    Private Function ExecuteSP(ByVal SPName As String, ByVal SPParameters As List(Of SqlParameter)) As Boolean
        Dim CS As String = ConfigurationManager.ConnectionStrings("ConnStringStoreDB").ConnectionString
        Using con As SqlConnection = New SqlConnection(CS)
            Dim cmd As SqlCommand = New SqlCommand(SPName, con)
            cmd.CommandType = CommandType.StoredProcedure
            For Each parameter As SqlParameter In SPParameters
                cmd.Parameters.Add(parameter)
            Next
            con.Open()
            Return Convert.ToBoolean(cmd.ExecuteScalar())
        End Using
    End Function
    Private Function IsPasswordResetLinkValid() As Boolean
        Dim paramList As List(Of SqlParameter) = New List(Of SqlParameter)() From {
        New SqlParameter() With {
            .ParameterName = "@GUID",
            .Value = Request.QueryString("uid")
        }
    }
        Return ExecuteSP("spIsPasswordResetLinkValid", paramList)
    End Function
    Private Function ChangeUserPassword() As Boolean
        Dim password As String = TextBoxNewPassword.Text
        Dim paramList As List(Of SqlParameter) = New List(Of SqlParameter)() From {
            New SqlParameter() With {
                .ParameterName = "@GUID",
                .Value = Request.QueryString("uid")
            },
            New SqlParameter() With {
                .ParameterName = "@password",
                .Value = password
            }
        }
        Return ExecuteSP("spChangePassword", paramList)
    End Function
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Not IsPasswordResetLinkValid() Then
                LabelStatus.ForeColor = System.Drawing.Color.Red
                LabelStatus.Text = "Password Reset link has expired or is invalid"
            End If
        End If
    End Sub
    Protected Sub ButtonReset_Click(sender As Object, e As EventArgs) Handles ButtonReset.Click
        If ChangeUserPassword() Then
            LabelStatus.Text = "Password Reset Successfully!"
            LabelStatus.ForeColor = System.Drawing.Color.Green
        Else
            LabelStatus.ForeColor = System.Drawing.Color.Red
            LabelStatus.Text = "Password Reset link has expired or is invalid"
        End If
    End Sub
    Protected Sub ButtonClear_Click(sender As Object, e As EventArgs) Handles ButtonClear.Click
        TextBoxNewPassword.Text = ""
        TextBoxConfirmNewPassword.Text = ""
        LabelStatus.Text = ""
    End Sub
End Class