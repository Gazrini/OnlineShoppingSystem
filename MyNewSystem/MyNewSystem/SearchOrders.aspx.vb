Public Class SearchOrders
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub GridViewAllOrders_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewAllOrders.SelectedIndexChanged
        Dim gr As GridViewRow = GridViewAllOrders.SelectedRow
        Response.Redirect("OrderHistoryDetails.aspx?OrderId=" & gr.Cells(0).Text)
    End Sub
    Protected Sub GridViewFilterOrders_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewFilterOrders.SelectedIndexChanged
        Dim gr As GridViewRow = GridViewFilterOrders.SelectedRow
        Response.Redirect("OrderHistoryDetails.aspx?OrderId=" & gr.Cells(0).Text)
    End Sub
    Protected Sub ButtonSearch_Click(sender As Object, e As EventArgs) Handles ButtonSearch.Click
        GridViewAllOrders.Visible = False
        GridViewFilterOrders.Visible = True
    End Sub
    Protected Sub ButtonReset_Click(sender As Object, e As EventArgs) Handles ButtonReset.Click
        TextBoxOrderId.Text = ""
        GridViewAllOrders.Visible = True
        GridViewFilterOrders.Visible = False
    End Sub
End Class