Imports System.Data.SqlClient
Public Class Ewallet
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Using con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnStringStoreDB").ConnectionString)
                Using cmd As SqlCommand = New SqlCommand("Select * From EWallet Where Email = @Email", con)
                    cmd.Parameters.AddWithValue("@Email", Session("Email"))
                    cmd.CommandType = CommandType.Text
                    con.Open()
                    Using reader As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection Or CommandBehavior.SingleResult Or CommandBehavior.SingleRow)
                        If reader.Read() Then
                            TextBoxAccountId.Text = Convert.ToString(reader("AccountId"))
                            TextBoxBalance.Text = Convert.ToString("RM " & reader("Balance") & ".00")
                        End If
                    End Using
                End Using
            End Using
        End If
    End Sub
End Class