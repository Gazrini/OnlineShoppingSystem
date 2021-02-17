Imports System.IO
Imports System.Data.SqlClient
Public Class AddProduct
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ProdId()
        DropDownListCategoryId.Items.FindByValue("Choose Category").Attributes.Add("style", "font-weight:bolder")
        DropDownListCategoryId.Items.FindByValue("Choose Category").Attributes.Add("disabled", "true")
    End Sub
    Public Sub ProdId() 'manually buat auto increment for product id
        Dim con As New SqlConnection
        con.ConnectionString = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
        con.Open()
        Dim query As String = "Select Max (ProductId) From Products"
        Dim cmd As SqlCommand = New SqlCommand(query, con)
        Dim dr As SqlDataReader
        dr = cmd.ExecuteReader()
        If dr.Read() Then
            Dim val As String = dr(0).ToString()
            If val = "" Then
                TextBoxProductId.Text = "1"
            Else
                Dim a As Integer
                a = Integer.Parse(dr(0).ToString())
                a = a + 1
                TextBoxProductId.Text = a.ToString()
            End If
            con.Close()
        End If
    End Sub
    Protected Sub ButtonAdd_Click(sender As Object, e As EventArgs) Handles ButtonAdd.Click
        If FileUploadProductImage.PostedFile IsNot Nothing Then
            Dim filename As String = Path.GetFileName(FileUploadProductImage.PostedFile.FileName)
            FileUploadProductImage.SaveAs(Server.MapPath("~/Images/" & filename))
            Me.ImageProduct.ImageUrl = "~/Images/Products/" & filename
            LabelStatusImage.Text = filename
            Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnStringStoreDB").ConnectionString)
            Dim sql As String = "Insert Into Products Values(@ProductId, @CategoryId, @ProductName, @ProductDescription, @ProductPrice,@ProductQuantity,@ProductImage)"
            Dim cmd As SqlCommand = New SqlCommand(sql, conn)
            cmd.Parameters.AddWithValue("@ProductId", TextBoxProductId.Text)
            cmd.Parameters.AddWithValue("@CategoryId", DropDownListCategoryId.Text)
            cmd.Parameters.AddWithValue("@ProductName", TextBoxProductName.Text)
            cmd.Parameters.AddWithValue("@ProductDescription", TextBoxProductDescription.Text)
            cmd.Parameters.AddWithValue("@ProductPrice", TextBoxProductPrice.Text)
            cmd.Parameters.AddWithValue("@ProductQuantity", TextBoxProductQuantity.Text)
            cmd.Parameters.AddWithValue("@ProductImage", LabelStatusImage.Text)
            Try
                conn.Open()
                cmd.ExecuteNonQuery()
                LabelStatus.Text = "Successfully Add Product."
                LabelStatus.ForeColor = System.Drawing.Color.Green
            Catch ex As SqlException
                LabelStatus.Text = ex.Message
            Finally
                conn.Close()
            End Try
        End If
    End Sub
    Protected Sub ButtonClear_Click(sender As Object, e As EventArgs) Handles ButtonClear.Click
        DropDownListCategoryId.SelectedValue = "Choose Category"
        TextBoxProductName.Text = ""
        TextBoxProductDescription.Text = ""
        TextBoxProductPrice.Text = ""
        TextBoxProductQuantity.Text = ""
        ImageProduct.ImageUrl = "~/Images/Camera Icon/Camera.png"
        LabelStatusImage.Text = ""
        LabelStatus.Text = ""
    End Sub
End Class