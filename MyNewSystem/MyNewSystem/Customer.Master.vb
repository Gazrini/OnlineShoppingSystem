Imports System.Data.SqlClient
Public Class Customer
    Inherits System.Web.UI.MasterPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Role") Is Nothing OrElse Session("Role").ToString() <> "Customer" Then
            Response.Redirect("Login.aspx")
        End If
        If Session("Email") IsNot Nothing AndAlso Session("Role") IsNot Nothing Then
            LinkButtonLogout.Visible = True
            LabelSession.Text = "Hello, " & Session("Email").ToString()
        Else
            LinkButtonLogout.Visible = False
            LabelSession.Text = "You are not logged in."
        End If
        If Not Page.IsPostBack Then
            Using con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnStringStoreDB").ConnectionString)
                Using cmd As SqlCommand = New SqlCommand("Select * From EWallet Where Email = @Email", con)
                    cmd.Parameters.AddWithValue("@Email", Session("Email"))
                    cmd.CommandType = CommandType.Text
                    con.Open()
                    Using reader As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection Or CommandBehavior.SingleResult Or CommandBehavior.SingleRow)
                        If reader.Read() Then
                            LabelEwalletBalance.Text = Convert.ToString(reader("Balance"))
                        End If
                    End Using
                End Using
            End Using
        End If
    End Sub
    Protected Sub LinkButtonLogout_Click(sender As Object, e As EventArgs) Handles LinkButtonLogout.Click
        Session.RemoveAll()
        Response.Redirect("Logout.aspx")
    End Sub
End Class