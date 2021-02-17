Imports System.Data.SqlClient
Public Class Wishlist
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Bindgrid()
        End If
    End Sub
    Private Sub Bindgrid()
        Dim mycon As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
        Dim myquery As String = "Select * From Products Where ProductId IN(Select ProductId From Wishlist Where Email='" & Session("Email").ToString() & "')"
        Dim con As SqlConnection = New SqlConnection(mycon)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.CommandText = myquery
        cmd.Connection = con
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        da.SelectCommand = cmd
        Dim ds As DataSet = New DataSet()
        da.Fill(ds)
        GridViewWishlist.DataSource = ds
        GridViewWishlist.DataBind()
        con.Close()
    End Sub
    Protected Sub GridViewWishlist_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridViewWishlist.RowDeleting
        Dim ProductId As String = GridViewWishlist.Rows(e.RowIndex).Cells(0).Text
        Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnStringStoreDB").ConnectionString)
        con.Open()
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.CommandText = "Delete From Wishlist Where ProductId = @productid"
        cmd.Parameters.AddWithValue("@productId", ProductId)
        cmd.Connection = con
        cmd.ExecuteNonQuery()
        Bindgrid()
    End Sub
    Private Sub ClearWishlist()
        Dim mycon As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
        Dim updatedata As String = "Delete From Wishlist Where Email='" & Session("Email").ToString() & "'"
        Dim con As SqlConnection = New SqlConnection(mycon)
        con.Open()
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.CommandText = updatedata
        cmd.Connection = con
        cmd.ExecuteNonQuery()
        Response.Redirect("CustomerProduct.aspx")
    End Sub
    Protected Sub LinkButtonClearWishlist_Click(sender As Object, e As EventArgs) Handles LinkButtonClearWishlist.Click
        ClearWishlist()
    End Sub
    Protected Sub GridViewWishlist_DataBound(sender As Object, e As EventArgs) Handles GridViewWishlist.DataBound
        LinkButtonClearWishlist.Visible = GridViewWishlist.Rows.Count > 0
    End Sub
End Class