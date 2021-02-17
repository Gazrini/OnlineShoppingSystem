Imports System.IO
Imports iTextSharp.text.html.simpleparser
Imports iTextSharp.text.pdf
Imports iTextSharp.text
Imports System.Data.SqlClient
Public Class Receipt
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("buyproduct") = Nothing
        LabelOrderId.Text = Request.QueryString("OrderId")
        FindCustomerName(LabelOrderId.Text)
        FindCustomerEmail(LabelOrderId.Text)
        FindCustomerPhoneNumber(LabelOrderId.Text)
        FindCustomerAddress(LabelOrderId.Text)
        FindOrderDate(LabelOrderId.Text)
        FindPaymentType(LabelOrderId.Text)
        DisplayGridviewInformation(LabelOrderId.Text)
    End Sub
    Private Sub ExportTopdf()
        Response.ContentType = "application/pdf"
        Response.AddHeader("content-disposition", "attachment;filename=Receipt.pdf")
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Dim sw As StringWriter = New StringWriter()
        Dim hw As HtmlTextWriter = New HtmlTextWriter(sw)
        PanelReceipt.RenderControl(hw)
        Dim sr As StringReader = New StringReader(sw.ToString())
        Dim pdfDoc As Document = New Document(PageSize.A4, 10.0F, 10.0F, 100.0F, 0F)
#Disable Warning BC40008 ' Type or member is obsolete
        Dim htmlparser As HTMLWorker = New HTMLWorker(pdfDoc)
#Enable Warning BC40008 ' Type or member is obsolete
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream)
        pdfDoc.Open()
        htmlparser.Parse(sr)
        pdfDoc.Close()
        Response.Write(pdfDoc)
        Response.[End]()
    End Sub
    Private Sub FindOrderDate(ByVal OrderId As String)
        Dim mycon As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
        Dim myquery As String = "SELECT * FROM OrderDetails WHERE OrderId='" & OrderId & "'"
        Dim con As SqlConnection = New SqlConnection(mycon)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.CommandText = myquery
        cmd.Connection = con
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        da.SelectCommand = cmd
        Dim ds As DataSet = New DataSet()
        da.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            LabelOrderDate.Text = ds.Tables(0).Rows(0)("DateOfOrder").ToString()
        End If
        con.Close()
    End Sub
    Private Sub FindCustomerName(ByVal OrderId As String)
        Dim mycon As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
        Dim myquery As String = "SELECT * FROM OrderDetails WHERE OrderId='" & OrderId & "'"
        Dim con As SqlConnection = New SqlConnection(mycon)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.CommandText = myquery
        cmd.Connection = con
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        da.SelectCommand = cmd
        Dim ds As DataSet = New DataSet()
        da.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            LabelCustomerName.Text = ds.Tables(0).Rows(0)("CustomerName").ToString()
        End If
        con.Close()
    End Sub
    Private Sub FindCustomerEmail(ByVal OrderId As String)
        Dim mycon As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
        Dim myquery As String = "SELECT * FROM OrderDetails WHERE OrderId='" & OrderId & "'"
        Dim con As SqlConnection = New SqlConnection(mycon)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.CommandText = myquery
        cmd.Connection = con
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        da.SelectCommand = cmd
        Dim ds As DataSet = New DataSet()
        da.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            LabelCustomerEmail.Text = ds.Tables(0).Rows(0)("Email").ToString()
        End If
        con.Close()
    End Sub
    Private Sub FindCustomerPhoneNumber(ByVal OrderId As String)
        Dim mycon As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
        Dim myquery As String = "SELECT * FROM OrderDetails WHERE OrderId='" & OrderId & "'"
        Dim con As SqlConnection = New SqlConnection(mycon)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.CommandText = myquery
        cmd.Connection = con
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        da.SelectCommand = cmd
        Dim ds As DataSet = New DataSet()
        da.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            LabelCustomerPhoneNumber.Text = ds.Tables(0).Rows(0)("PhoneNumber").ToString()
        End If
        con.Close()
    End Sub
    Private Sub FindCustomerAddress(ByVal OrderId As String)
        Dim mycon As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
        Dim myquery As String = "SELECT * FROM OrderDetails WHERE OrderId='" & OrderId & "'"
        Dim con As SqlConnection = New SqlConnection(mycon)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.CommandText = myquery
        cmd.Connection = con
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        da.SelectCommand = cmd
        Dim ds As DataSet = New DataSet()
        da.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            LabelCustomerAddress.Text = ds.Tables(0).Rows(0)("Address").ToString()
        End If
        con.Close()
    End Sub
    Private Sub FindPaymentType(ByVal OrderId As String)
        Dim mycon As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
        Dim myquery As String = "SELECT * FROM OrderDetails WHERE OrderId='" & OrderId & "'"
        Dim con As SqlConnection = New SqlConnection(mycon)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.CommandText = myquery
        cmd.Connection = con
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        da.SelectCommand = cmd
        Dim ds As DataSet = New DataSet()
        da.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            LabelPaymentType.Text = ds.Tables(0).Rows(0)("PaymentType").ToString()
        End If
        con.Close()
    End Sub
    Private Sub DisplayGridviewInformation(ByVal OrderId As String)
        Dim dt As DataTable = New DataTable()
        Dim dr As DataRow
        dt.Columns.Add("Number")
        dt.Columns.Add("ProductName")
        dt.Columns.Add("ProductPrice")
        dt.Columns.Add("quantity")
        dt.Columns.Add("TotalPrice")
        Dim mycon As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
        Dim scon As SqlConnection = New SqlConnection(mycon)
        Dim myquery As String = "SELECT * FROM OrderDetails where OrderId='" & OrderId & "'"
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.CommandText = myquery
        cmd.Connection = scon
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        da.SelectCommand = cmd
        Dim ds As DataSet = New DataSet()
        da.Fill(ds)
        Dim totalrows As Integer = ds.Tables(0).Rows.Count
        Dim i As Integer = 0
        Dim grandtotal As Integer = 0
        While i < totalrows
            dr = dt.NewRow()
            dr("Number") = ds.Tables(0).Rows(i)("Number").ToString()
            dr("ProductName") = ds.Tables(0).Rows(i)("ProductName").ToString()
            dr("ProductPrice") = ds.Tables(0).Rows(i)("ProductPrice").ToString()
            dr("quantity") = ds.Tables(0).Rows(i)("quantity").ToString()
            Dim price As Integer = Convert.ToInt16(ds.Tables(0).Rows(i)("ProductPrice").ToString())
            Dim quantity As Integer = Convert.ToInt16(ds.Tables(0).Rows(i)("quantity").ToString())
            Dim totalprice As Integer = price * quantity
            dr("TotalPrice") = totalprice
            grandtotal = grandtotal + totalprice
            dt.Rows.Add(dr)
            i = i + 1
        End While
        GridViewProductReceipt.DataSource = dt
        GridViewProductReceipt.DataBind()
        LabelTotal.Text = grandtotal.ToString()
    End Sub
    Protected Sub ButtonDownload_Click(sender As Object, e As EventArgs) Handles ButtonDownload.Click
        ExportTopdf()
    End Sub
    Public Overrides Sub VerifyRenderingInServerForm(ByVal control As Control) 'untuk fetch gridview data untuk send email
        'Tell the compiler that the control is rendered
        'explicitly by overriding the VerifyRenderingInServerForm event.
    End Sub
End Class