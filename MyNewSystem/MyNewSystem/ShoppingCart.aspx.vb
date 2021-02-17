Imports System.Data.SqlClient
Public Class ShoppingCart
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim dt As DataTable = New DataTable()
            Dim dr As DataRow
            dt.Columns.Add("Number")
            dt.Columns.Add("ProductId")
            dt.Columns.Add("ProductName")
            dt.Columns.Add("ProductImage")
            dt.Columns.Add("ProductPrice")
            dt.Columns.Add("quantity")
            dt.Columns.Add("TotalPrice")
            If Request.QueryString("id") IsNot Nothing Then
                If Session("buyproduct") Is Nothing Then
                    dr = dt.NewRow()
                    Dim mycon As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
                    Dim scon As SqlConnection = New SqlConnection(mycon)
                    Dim myquery As String = "Select * From Products Where ProductId=" & Request.QueryString("id")
                    Dim cmd As SqlCommand = New SqlCommand()
                    cmd.CommandText = myquery
                    cmd.Connection = scon
                    Dim da As SqlDataAdapter = New SqlDataAdapter()
                    da.SelectCommand = cmd
                    Dim ds As DataSet = New DataSet()
                    da.Fill(ds)
                    dr("Number") = 1
                    dr("ProductId") = ds.Tables(0).Rows(0)("ProductId").ToString()
                    dr("ProductName") = ds.Tables(0).Rows(0)("ProductName").ToString()
                    dr("ProductImage") = ds.Tables(0).Rows(0)("ProductImage").ToString()
                    dr("quantity") = Request.QueryString("quantity")
                    dr("ProductPrice") = ds.Tables(0).Rows(0)("ProductPrice").ToString()
                    Dim Price As Integer = Convert.ToInt32(ds.Tables(0).Rows(0)("ProductPrice").ToString())
                    Dim Quantity As Integer = Convert.ToInt16(Request.QueryString("quantity").ToString())
                    Dim TotalPrice As Integer = Price * Quantity
                    dr("TotalPrice") = TotalPrice
                    SaveShoppingCartDetail(1, ds.Tables(0).Rows(0)("ProductId").ToString(), ds.Tables(0).Rows(0)("ProductName").ToString(), ds.Tables(0).Rows(0)("ProductImage").ToString(), Request.QueryString("quantity"), ds.Tables(0).Rows(0)("ProductPrice").ToString(), TotalPrice.ToString())
                    dt.Rows.Add(dr)
                    GridViewShoppingCart.DataSource = dt
                    GridViewShoppingCart.DataBind()
                    Session("buyproduct") = dt
                    GridViewShoppingCart.FooterRow.Cells(5).Text = "Total Amount"
                    GridViewShoppingCart.FooterRow.Cells(6).Text = Grandtotal().ToString()
                    Response.Redirect("ShoppingCart.aspx")
                Else
                    dt = CType(Session("buyproduct"), DataTable)
                    Dim sr As Integer
                    sr = dt.Rows.Count
                    dr = dt.NewRow()
                    Dim mycon As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
                    Dim scon As SqlConnection = New SqlConnection(mycon)
                    Dim myquery As String = "Select * From Products Where ProductId=" & Request.QueryString("id")
                    Dim cmd As SqlCommand = New SqlCommand()
                    cmd.CommandText = myquery
                    cmd.Connection = scon
                    Dim da As SqlDataAdapter = New SqlDataAdapter()
                    da.SelectCommand = cmd
                    Dim ds As DataSet = New DataSet()
                    da.Fill(ds)
                    dr("Number") = sr + 1
                    dr("ProductId") = ds.Tables(0).Rows(0)("ProductId").ToString()
                    dr("ProductName") = ds.Tables(0).Rows(0)("ProductName").ToString()
                    dr("ProductImage") = ds.Tables(0).Rows(0)("ProductImage").ToString()
                    dr("quantity") = Request.QueryString("quantity")
                    dr("ProductPrice") = ds.Tables(0).Rows(0)("ProductPrice").ToString()
                    Dim Price As Integer = Convert.ToInt32(ds.Tables(0).Rows(0)("ProductPrice").ToString())
                    Dim Quantity As Integer = Convert.ToInt16(Request.QueryString("quantity").ToString())
                    Dim TotalPrice As Integer = Price * Quantity
                    dr("TotalPrice") = TotalPrice
                    SaveShoppingCartDetail(sr + 1, ds.Tables(0).Rows(0)("ProductId").ToString(), ds.Tables(0).Rows(0)("ProductName").ToString(), ds.Tables(0).Rows(0)("ProductImage").ToString(), Request.QueryString("quantity"), ds.Tables(0).Rows(0)("ProductPrice").ToString(), TotalPrice.ToString())
                    dt.Rows.Add(dr)
                    GridViewShoppingCart.DataSource = dt
                    GridViewShoppingCart.DataBind()
                    Session("buyproduct") = dt
                    GridViewShoppingCart.FooterRow.Cells(5).Text = "Total Amount"
                    GridViewShoppingCart.FooterRow.Cells(6).Text = " RM " & Grandtotal().ToString() & ".00"
                    Response.Redirect("ShoppingCart.aspx")
                End If
            Else
                dt = CType(Session("buyproduct"), DataTable)
                GridViewShoppingCart.DataSource = dt
                GridViewShoppingCart.DataBind()
                If GridViewShoppingCart.Rows.Count > 0 Then
                    GridViewShoppingCart.FooterRow.Cells(5).Text = " Total Amount "
                    GridViewShoppingCart.FooterRow.Cells(6).Text = " RM " & Grandtotal().ToString() & ".00"
                End If
            End If
        End If
        LabelShoppingCartQuantity.Text = GridViewShoppingCart.Rows.Count.ToString()
    End Sub
    Public Function Grandtotal() As Integer
        Dim dt As DataTable = New DataTable()
        dt = CType(Session("buyproduct"), DataTable)
        Dim nrow As Integer = dt.Rows.Count
        Dim i As Integer = 0
        Dim gtotal As Integer = 0
        While i < nrow
            gtotal = gtotal + Convert.ToInt32(dt.Rows(i)("TotalPrice").ToString())
            i = i + 1
        End While
        Return gtotal
    End Function
    Private Sub SaveShoppingCartDetail(ByVal Number As Integer, ByVal ProductId As Integer, ByVal ProductName As String, ByVal ProductImage As String, ByVal Quantity As String, ByVal ProductPrice As String, ByVal TotalPrice As String)
        Dim query As String = "Insert Into SaveShoppingCartDetails(Number,ProductId,ProductName,ProductImage,Quantity,ProductPrice,TotalPrice,Email) Values('" & Number & "','" & ProductId & "','" & ProductName & "','" & ProductImage & "','" & Quantity & "','" & ProductPrice & "','" & TotalPrice & "','" & Session("Email").ToString() & "')"
        Dim mycon As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
        Dim con As SqlConnection = New SqlConnection(mycon)
        con.Open()
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.CommandText = query
        cmd.Connection = con
        cmd.ExecuteNonQuery()
    End Sub
    Private Sub ClearSavedShoppingCartDetails()
        Dim mycon As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
        Dim updatedata As String = "Delete From SaveShoppingCartDetails Where Email='" & Session("Email").ToString() & "'"
        Dim con As SqlConnection = New SqlConnection(mycon)
        con.Open()
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.CommandText = updatedata
        cmd.Connection = con
        cmd.ExecuteNonQuery()
        Response.Redirect("CustomerProduct.aspx")
    End Sub
    Protected Sub GridViewShoppingCart_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridViewShoppingCart.RowDeleting
        Dim dt As DataTable = New DataTable()
        dt = CType(Session("buyproduct"), DataTable)
        For i As Integer = 0 To dt.Rows.Count - 1
            Dim sr As Integer
            Dim sr1 As Integer
            Dim qdata As String
            Dim dtdata As String
            sr = Convert.ToInt32(dt.Rows(i)("Number").ToString())
            Dim cell As TableCell = GridViewShoppingCart.Rows(e.RowIndex).Cells(0)
            qdata = cell.Text
            dtdata = sr.ToString()
            sr1 = Convert.ToInt32(qdata)
            If sr = sr1 Then
                dt.Rows(i).Delete()
                dt.AcceptChanges()
                Exit For
            End If
        Next
        For i As Integer = 1 To dt.Rows.Count
            dt.Rows(i - 1)("Number") = i
            dt.AcceptChanges()
        Next
        Session("buyproduct") = dt
        Response.Redirect("ShoppingCart.aspx")
    End Sub
    Protected Sub GridViewShoppingCart_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewShoppingCart.SelectedIndexChanged
        Response.Redirect("UpdateShoppingCart.aspx?Number=" & GridViewShoppingCart.SelectedRow.Cells(0).Text)
    End Sub
    Protected Sub GridViewShoppingCart_DataBound(sender As Object, e As EventArgs) Handles GridViewShoppingCart.DataBound
        ButtonCheckout.Visible = GridViewShoppingCart.Rows.Count > 0 'to hide button checkout if there is no product in shopping cart
        LinkButtonClearShoppingCart.Visible = GridViewShoppingCart.Rows.Count > 0 'to hide button if there is no product in shopping cart
    End Sub
    Protected Sub ButtonCheckout_Click(sender As Object, e As EventArgs) Handles ButtonCheckout.Click
        Response.Redirect("Checkout.aspx")
    End Sub
    Protected Sub LinkButtonClearShoppingCart_Click(sender As Object, e As EventArgs) Handles LinkButtonClearShoppingCart.Click
        Session("buyproduct") = Nothing
        ClearSavedShoppingCartDetails()
    End Sub
End Class