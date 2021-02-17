Imports System.Data.SqlClient
Public Class CustomerProduct
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'To inform product quantity in the shopping cart (for labelshoppingcartquantity)
        Dim dt As DataTable = New DataTable()
        dt = CType(Session("buyproduct"), DataTable)
        If dt IsNot Nothing Then
            LabelShoppingCartQuantity.Text = dt.Rows.Count.ToString()
        Else
            LabelShoppingCartQuantity.Text = "0"
        End If
        'Display product in category
        If Not IsPostBack Then
            If Request.QueryString("CategoryId") IsNot Nothing Then
                DataListProduct.DataSourceID = Nothing
                DataListProduct.DataSource = SqlDataSourceProductCategory
                DataListProduct.DataBind()
            End If
        End If
        'Wishlist coding in page load
        If Not IsPostBack Then
            If Request.QueryString("addtowishlist") IsNot Nothing AndAlso Session("Email") IsNot Nothing Then
                Dim query As String = "Insert Into Wishlist(Email,ProductId) Values ('" & Session("Email").ToString() & "'," + Request.QueryString("addtowishlist").ToString() & ")"
                Dim mycon As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
                Dim con As SqlConnection = New SqlConnection(mycon)
                con.Open()
                Dim cmd As SqlCommand = New SqlCommand()
                cmd.CommandText = query
                cmd.Connection = con
                cmd.ExecuteNonQuery()
                Response.Write("<script>alert('Product Added into Wishlist');</script>")
            End If
        End If
        'Display message if datalist is empty
        If DataListProduct.Items.Count = 0 Then
            DataListProduct.Visible = False
            LabelEmptyDatalistMessage.Visible = True
            LabelEmptyDatalistMessage.Text = "No Product Available"
        End If
    End Sub
    Protected Sub DataListProduct_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles DataListProduct.ItemCommand
        Dim dlist As DropDownList = CType((e.Item.FindControl("DropDownListProductQuantity")), DropDownList)
        'Add product into shopping cart
        If e.CommandName = "addcart" Then
            Response.Redirect("ShoppingCart.aspx?id=" & e.CommandArgument.ToString() & "&quantity=" & dlist.SelectedItem.ToString())
        End If
        'Add product into wishlist
        If e.CommandName = "addtowishlist" Then
            Response.Redirect("CustomerProduct.aspx?addtowishlist=" & e.CommandArgument.ToString() & "&quantity=" & dlist.SelectedItem.ToString())
        End If
        'View Product details
        If e.CommandName = "viewproductdetails" Then
            Response.Redirect("ViewProductDetails.aspx?id=" & e.CommandArgument.ToString())
        End If
    End Sub
    Protected Sub DataListProduct_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles DataListProduct.ItemDataBound
        'Product Stock coding
        Dim LabelProductAvailability As Label = TryCast(e.Item.FindControl("LabelProductAvailability"), Label)
        Dim LabelProductId As Label = TryCast(e.Item.FindControl("LabelProductId"), Label)
        Dim ButtonAddCart As Button = TryCast(e.Item.FindControl("ButtonAddCart"), Button)
        Dim ButtonViewProductDetails As Button = TryCast(e.Item.FindControl("ButtonViewProductDetails"), Button)
        Dim mycon As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
        Dim myquery As String = "Select * From Products Where ProductId=" & LabelProductId.Text
        Dim con As SqlConnection = New SqlConnection(mycon)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.CommandText = myquery
        cmd.Connection = con
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        da.SelectCommand = cmd
        Dim ds As DataSet = New DataSet()
        da.Fill(ds)
        Dim ProductQuantityInDB As Integer = Nothing
        If ds.Tables(0).Rows.Count > 0 Then
            ProductQuantityInDB = ds.Tables(0).Rows(0)("ProductQuantity").ToString()
        End If
        If ProductQuantityInDB <= 0 Then
            LabelProductAvailability.Text = "Sold Out"
            LabelProductAvailability.ForeColor = System.Drawing.Color.Red
            ButtonAddCart.Enabled = False
            ButtonViewProductDetails.Enabled = False
        Else
            LabelProductAvailability.Text = ProductQuantityInDB
            con.Close()
        End If
        'Wishlist coding
        If Session("Email") IsNot Nothing Then
            Dim LabelWishlistStatus As Label = TryCast(e.Item.FindControl("LabelWishlistStatus"), Label)
            Dim ImageButtonWishlist As ImageButton = TryCast(e.Item.FindControl("ImageButtonWishlist"), ImageButton)
            Dim LabelProductIdWishlist As Label = TryCast(e.Item.FindControl("LabelProductId"), Label)
            Dim myconwishlist As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
            Dim myquerywishlist As String = "Select * From Wishlist Where ProductId=" & LabelProductIdWishlist.Text & " And Email='" & Session("Email") & "'"
            Dim conwishlist As SqlConnection = New SqlConnection(mycon)
            Dim cmdwishlist As SqlCommand = New SqlCommand()
            cmdwishlist.CommandText = myquerywishlist
            cmdwishlist.Connection = conwishlist
            Dim daWishlist As SqlDataAdapter = New SqlDataAdapter()
            daWishlist.SelectCommand = cmdwishlist
            Dim dsWishlist As DataSet = New DataSet()
            daWishlist.Fill(dsWishlist)
            If dsWishlist.Tables(0).Rows.Count > 0 Then
                LabelWishlistStatus.Text = "Already in Wishlist "
                ImageButtonWishlist.ImageUrl = "~/Images/Wishlist Icon/BlackHeart.png"
                ImageButtonWishlist.Enabled = False
            Else
                LabelWishlistStatus.Text = "Add Wishlist"
                ImageButtonWishlist.ImageUrl = "~/Images/Wishlist Icon/WhiteHeart.png"
            End If
        Else
            Dim LabelWishlistStatus As Label = TryCast(e.Item.FindControl("LabelWishlistStatus"), Label)
            Dim ImageButtonWishlist As ImageButton = TryCast(e.Item.FindControl("ImageButtonWishlist"), ImageButton)
            LabelWishlistStatus.Text = "Add Wishlist"
            ImageButtonWishlist.ImageUrl = "~/Images/Wishlist Icon/WhiteHeart.png"
        End If
    End Sub
    Protected Sub LinkButtonAllCategory_Click(sender As Object, e As EventArgs) Handles LinkButtonAllCategory.Click
        DataListProduct.DataSourceID = Nothing
        DataListProduct.DataSource = SqlDataSourceProduct
        DataListProduct.DataBind()
    End Sub
    Protected Sub LinkButtonHoodie_Click(sender As Object, e As EventArgs) Handles LinkButtonHoodie.Click
        Response.Redirect("CustomerProduct.aspx?CategoryId=1")
    End Sub
    Protected Sub LinkButtonJeans_Click(sender As Object, e As EventArgs) Handles LinkButtonJeans.Click
        Response.Redirect("CustomerProduct.aspx?CategoryId=2")
    End Sub
    Protected Sub LinkButtonSneakers_Click(sender As Object, e As EventArgs) Handles LinkButtonSneakers.Click
        Response.Redirect("CustomerProduct.aspx?CategoryId=3")
    End Sub
    Protected Sub ButtonSort_Click(sender As Object, e As EventArgs) Handles ButtonSort.Click
        DataListProduct.DataSourceID = Nothing
        If DropDownListSortPrice.SelectedValue = "Low to high" Then
            DataListProduct.DataSource = SqlDataSourceSortPriceAscending
            DataListProduct.DataBind()
        ElseIf DropDownListSortPrice.SelectedValue = "High to low" Then
            DataListProduct.DataSource = SqlDataSourceSortPriceDescending
            DataListProduct.DataBind()
        Else
            DataListProduct.DataSource = SqlDataSourceProduct
            DataListProduct.DataBind()
        End If
    End Sub
End Class