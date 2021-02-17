Imports System.Data.SqlClient
Imports System.IO
Public Class UpdateProduct
    Inherits System.Web.UI.Page
    Private str As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
    Private ProductId As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowProduct()
        End If
    End Sub
    Public Sub ShowProduct()
        Dim Con As SqlConnection = New SqlConnection(str)
        Dim Sda As SqlDataAdapter = New SqlDataAdapter("Select * From Products", Con)
        Dim Dt As DataTable = New DataTable()
        Sda.Fill(Dt)
        GridViewUpdateProduct.DataSource = Dt
        GridViewUpdateProduct.DataBind()
    End Sub
    Protected Sub GridViewUpdateProduct_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GridViewUpdateProduct.PageIndexChanging
        GridViewUpdateProduct.PageIndex = e.NewPageIndex
        ShowProduct()
    End Sub
    Protected Sub GridViewUpdateProduct_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles GridViewUpdateProduct.RowCancelingEdit
        GridViewUpdateProduct.EditIndex = -1
        DropDownListSelectCategory.SelectedValue = "All Category"
        ShowProduct()
    End Sub
    Protected Sub GridViewUpdateProduct_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles GridViewUpdateProduct.RowEditing
        GridViewUpdateProduct.EditIndex = e.NewEditIndex
        Dim Index As Integer = e.NewEditIndex
        Dim Row As GridViewRow = GridViewUpdateProduct.Rows(Index)
        Dim ProductId As Label = CType(Row.FindControl("LabelProductId"), Label)
        Dim ConvertProductIdLabelToInteger As Integer
        ConvertProductIdLabelToInteger = Convert.ToInt32(ProductId.Text)
        Dim Con As SqlConnection = New SqlConnection(str)
        Dim Sda As SqlDataAdapter = New SqlDataAdapter("Select * From Products Where ProductId='" & ConvertProductIdLabelToInteger & "' ", Con)
        Dim Dt As DataTable = New DataTable()
        Sda.Fill(Dt)
        GridViewUpdateProduct.DataSource = Dt
        GridViewUpdateProduct.DataBind()
    End Sub
    Protected Sub GridViewUpdateProduct_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles GridViewUpdateProduct.RowUpdating
        Dim Index As Integer = ProductId
        Dim Row As GridViewRow = GridViewUpdateProduct.Rows(Index)
        Dim FileUploadProductImage As FileUpload = CType(Row.FindControl("FileUploadProductImage"), FileUpload)
        If FileUploadProductImage.HasFile Then
            Dim ProductId As Label = CType(Row.FindControl("LabelProductId"), Label)
            Dim ProductName As TextBox = CType(Row.FindControl("TextBoxProductName"), TextBox)
            Dim ProductDescription As TextBox = CType(Row.FindControl("TextBoxProductDescription"), TextBox)
            Dim ProductPrice As TextBox = CType(Row.FindControl("TextBoxProductPrice"), TextBox)
            Dim ProductQuantity As TextBox = CType(Row.FindControl("TextBoxProductQuantity"), TextBox)
            Dim ProductImage As String = Path.GetFileName(FileUploadProductImage.PostedFile.FileName)
            FileUploadProductImage.SaveAs(Server.MapPath("~/Images/Products/" & ProductImage) & Path.GetFileName(FileUploadProductImage.FileName))
            Dim ProductCategory As String = (CType(GridViewUpdateProduct.Rows(e.RowIndex).Cells(6).FindControl("DropDownListProductCategory"), DropDownList)).Text
            Dim Con As SqlConnection = New SqlConnection(str)
            Con.Open()
            Dim Cmd As SqlCommand = New SqlCommand("Update Products set ProductName=@ProductName, ProductDescription=@ProductDescription, ProductPrice=@ProductPrice, ProductQuantity=@ProductQuantity, ProductImage=@ProductImage, CategoryId=@ProductCategory where ProductId=@ProductId ", Con)
            Cmd.Parameters.AddWithValue("@ProductName", ProductName.Text)
            Cmd.Parameters.AddWithValue("@ProductDescription", ProductDescription.Text)
            Cmd.Parameters.AddWithValue("@ProductPrice", ProductPrice.Text)
            Cmd.Parameters.AddWithValue("@ProductQuantity", ProductQuantity.Text)
            Cmd.Parameters.AddWithValue("@ProductImage", ProductImage)
            Cmd.Parameters.AddWithValue("@ProductCategory", ProductCategory)
            Cmd.Parameters.AddWithValue("@ProductId", ProductId.Text)
            Cmd.ExecuteNonQuery()
            Con.Close()
            GridViewUpdateProduct.EditIndex = -1
            Response.Write("<script>alert('Product Updated Successfully');</script>")
            ShowProduct()
            DropDownListSelectCategory.SelectedValue = "All Category"
        Else
            Response.Write("<script>alert('Please Enter Product Image');</script>")
        End If
    End Sub
    Protected Sub DropDownListSelectCategory_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownListSelectCategory.SelectedIndexChanged
        Dim CategoryId As String = DropDownListSelectCategory.SelectedValue.ToString()
        If CategoryId = "All Category" Then
            ShowProduct()
        Else
            Dim Con As SqlConnection = New SqlConnection(str)
            Dim Sda As SqlDataAdapter = New SqlDataAdapter("Select * From Products Where CategoryId='" & CategoryId & "' ", Con)
            Dim Dt As DataTable = New DataTable()
            Sda.Fill(Dt)
            GridViewUpdateProduct.DataSource = Dt
            GridViewUpdateProduct.DataBind()
        End If
    End Sub
End Class