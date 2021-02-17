Imports System.Data.SqlClient
Public Class UpdateShoppingCart
    Inherits System.Web.UI.Page
    Dim dt As DataTable
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
        Else
            If Request.QueryString("Number") IsNot Nothing Then
                dt = CType(Session("buyproduct"), DataTable)
                For i As Integer = 0 To dt.Rows.Count - 1
                    Dim sr As Integer
                    Dim sr1 As Integer
                    sr = Convert.ToInt32(dt.Rows(i)("Number").ToString())
                    LabelNumber.Text = Request.QueryString("Number")
                    LabelTotalPrice.Text = sr.ToString()
                    sr1 = Convert.ToInt32(LabelNumber.Text)
                    If sr = sr1 Then
                        LabelNumber.Text = dt.Rows(i)("Number").ToString()
                        LabelProductName.Text = dt.Rows(i)("ProductName").ToString()
                        DropDownListProductQuantity.Text = dt.Rows(i)("quantity").ToString()
                        LabelProductPrice.Text = dt.Rows(i)("ProductPrice").ToString()
                        LabelTotalPrice.Text = dt.Rows(i)("TotalPrice").ToString()
                        Exit For
                    End If
                Next
            Else
            End If
        End If
    End Sub
    Private Sub UpdateSavedShoppingCartDetails() 'ni untuk update product quantity dalam database SaveShoppingCartDetails
        Using con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnStringStoreDB").ConnectionString)
            Using cmd As SqlCommand = New SqlCommand("Update SaveShoppingCartDetails Set Quantity = @Quantity Where Email = @Email AND Number = @Number", con)
                cmd.Parameters.AddWithValue("@Number", LabelNumber.Text)
                cmd.Parameters.AddWithValue("@Quantity", DropDownListProductQuantity.Text)
                cmd.Parameters.AddWithValue("@Email", Session("Email"))
                cmd.CommandType = CommandType.Text
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Using
    End Sub
    Protected Sub DropDownListQuantity_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownListProductQuantity.SelectedIndexChanged
        Dim Quantity As Integer
        Quantity = Convert.ToInt32(DropDownListProductQuantity.Text)
        Dim Price As Integer
        Price = Convert.ToInt32(LabelProductPrice.Text)
        Dim TotalPrice As Integer
        TotalPrice = Price * Quantity
        LabelTotalPrice.Text = TotalPrice.ToString()
    End Sub
    Protected Sub ButtonUpdate_Click(sender As Object, e As EventArgs) Handles ButtonUpdate.Click
        dt = CType(Session("buyproduct"), DataTable)
        For i As Integer = 0 To dt.Rows.Count - 1
            Dim sr As Integer
            Dim sr1 As Integer
            sr = Convert.ToInt32(dt.Rows(i)("Number").ToString())
            sr1 = Convert.ToInt32(LabelNumber.Text)
            If sr = sr1 Then
                dt.Rows(i)("Number") = LabelNumber.Text
                dt.Rows(i)("ProductName") = LabelProductName.Text
                dt.Rows(i)("quantity") = DropDownListProductQuantity.Text
                dt.Rows(i)("ProductPrice") = LabelProductPrice.Text
                dt.Rows(i)("TotalPrice") = LabelTotalPrice.Text
                UpdateSavedShoppingCartDetails() 'ni untuk update product quantity dalam database SaveShoppingCartDetails
                dt.AcceptChanges()
                Exit For
            End If
        Next
        Response.Redirect("ShoppingCart.aspx")
    End Sub
End Class