Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Public Class OrderHistory
    Inherits System.Web.UI.Page
    Shared ValidDateFormat As Boolean
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub CustomValidatorDateFormat_ServerValidate(source As Object, args As ServerValidateEventArgs) Handles CustomValidatorDateFormat.ServerValidate
        Dim d As DateTime
        args.IsValid = DateTime.TryParseExact(args.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, d)
        ValidDateFormat = DateTime.TryParseExact(args.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, d)
        GridViewAllOrderHistory.Visible = False
        GridViewFilterOrderHistory.Visible = False
    End Sub
    Protected Sub GridViewAllOrderHistory_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewAllOrderHistory.SelectedIndexChanged
        Dim gr As GridViewRow = GridViewAllOrderHistory.SelectedRow
        Response.Redirect("OrderHistoryDetails.aspx?OrderId=" & gr.Cells(0).Text)
    End Sub
    Protected Sub GridViewFilterOrderHistory_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewFilterOrderHistory.SelectedIndexChanged
        Dim gr As GridViewRow = GridViewFilterOrderHistory.SelectedRow
        Response.Redirect("OrderHistoryDetails.aspx?OrderId=" & gr.Cells(0).Text)
    End Sub
    Protected Sub ButtonSearch_Click(sender As Object, e As EventArgs) Handles ButtonSearch.Click
        If ValidDateFormat = True Then
            GridViewAllOrderHistory.Visible = False
            GridViewFilterOrderHistory.Visible = True
        End If
    End Sub
    Protected Sub ButtonReset_Click(sender As Object, e As EventArgs) Handles ButtonReset.Click
        TextBoxDate.Text = ""
        GridViewAllOrderHistory.Visible = True
        GridViewFilterOrderHistory.Visible = False
    End Sub
End Class