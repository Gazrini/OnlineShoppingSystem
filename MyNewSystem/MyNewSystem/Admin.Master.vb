Public Class Admin
    Inherits System.Web.UI.MasterPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Role") Is Nothing OrElse Session("Role").ToString() <> "Admin" Then
            Session.RemoveAll()
            Response.Redirect("AdminLogin.aspx")
        End If
        If Session("Email") IsNot Nothing AndAlso Session("Role") IsNot Nothing Then
            LinkButtonLogout.Visible = True
            LabelSession.Text = "Hello, " & Session("Email").ToString()
        Else
            LinkButtonLogout.Visible = False
            Session.RemoveAll()
            LabelSession.Text = "You are not logged in."
        End If
    End Sub
    Protected Sub LinkButtonLogout_Click(sender As Object, e As EventArgs) Handles LinkButtonLogout.Click
        Session.RemoveAll()
        Response.Redirect("Logout.aspx")
    End Sub
End Class