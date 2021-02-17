Public Class AdminProduct
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If TextBoxSearch.Text = "" Then
            GridViewAllProduct.Visible = True
            GridViewFilterProduct.Visible = False
        ElseIf TextBoxSearch.Text <> Nothing Then
            GridViewAllProduct.Visible = False
            GridViewFilterProduct.Visible = True
        End If
    End Sub
End Class