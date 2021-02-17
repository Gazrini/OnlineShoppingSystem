Public Class Guest
    Inherits System.Web.UI.MasterPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Email") IsNot Nothing AndAlso Session("Role") IsNot Nothing Then
            LabelSession.Text = "Hello, " & Session("Email").ToString()
        Else
            LabelSession.Text = "You are not logged in."
        End If
    End Sub
End Class