Public Class ViewProductDetails
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub DataListViewProduct_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles DataListViewProduct.ItemCommand
        Dim dlist As DropDownList = CType((e.Item.FindControl("DropDownListProductQuantity")), DropDownList)
        Response.Redirect("ShoppingCart.aspx?id=" + e.CommandArgument.ToString() & "&quantity=" + dlist.SelectedItem.ToString())
    End Sub
End Class