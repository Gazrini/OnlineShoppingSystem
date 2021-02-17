Imports System.Data.SqlClient
Imports System.IO
Imports System.Net.Mail
Public Class Checkout
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim ProdId As Integer = GetProductIdInGridview() 'Untuk calculate product stock
        LabelProductIdInGridview.Text = ProdId 'Untuk calculate product stock
        LabelGetEmailValueFromSession.Text = Session("Email") 'For EwalletTransaction Database Table 
        Dim ProdQty As Integer = GetProductQuantityInGridview() 'Untuk calculate product stock
        LabelProductQuantityInGridview.Text = ProdQty 'Untuk calculate product stock
        EWalletTransactionid() 'Untuk insert value transaction id dalam table EWalletTransactions
        Dim DateTime As DateTime = DateTime.Now
        TextBoxDateOfOrder.Text = DateTime.ToString("dd/MM/yyyy") 'Set date inside the TexBoxOrderDate
        GetOrderId() 'Get the value of order id from the GetOrderId constructor
        Session("TotalPrice") = Grandtotal().ToString() 'Call value for TotalPrice from gridview
        If Not Page.IsPostBack Then 'Get the value from Customers database table
            Using con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnStringStoreDB").ConnectionString)
                Using cmd As SqlCommand = New SqlCommand("Select * From Customers Where Email = @Email", con)
                    cmd.Parameters.AddWithValue("@Email", Session("Email"))
                    cmd.CommandType = CommandType.Text
                    con.Open()
                    Using reader As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection Or CommandBehavior.SingleResult Or CommandBehavior.SingleRow)
                        If reader.Read() Then
                            LabelCustomerId.Text = reader(0)
                            TextBoxUsername.Text = reader.GetString(4)
                            TextBoxEmail.Text = reader.GetString(5)
                            TextBoxPhoneNumber.Text = reader.GetString(6)
                            TextBoxAddress.Text = reader.GetString(7)
                        End If
                    End Using
                End Using
            End Using
        End If
        If Not Page.IsPostBack Then 'Get the value from E-wallet database table
            Using con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnStringStoreDB").ConnectionString)
                Using cmd As SqlCommand = New SqlCommand("Select * From Ewallet Where Email= @Email", con)
                    cmd.Parameters.AddWithValue("@Email", Session("Email"))
                    cmd.CommandType = CommandType.Text
                    con.Open()
                    Using reader As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection Or CommandBehavior.SingleResult Or CommandBehavior.SingleRow)
                        If reader.Read() Then
                            LabelEwalletAccountId.Text = Convert.ToString(reader("AccountId"))
                            LabelEWalletBalance.Text = reader(3)
                        End If
                    End Using
                End Using
            End Using
        End If
        If Not IsPostBack Then
            Dim dt As DataTable = New DataTable()
            Dim dr As DataRow
            dt.Columns.Add("Number")
            dt.Columns.Add("ProductId")
            dt.Columns.Add("ProductName")
            dt.Columns.Add("ProductImage")
            dt.Columns.Add("ProductPrice")
            dt.Columns.Add("quantity") 'quantity ni bukan untuk value dalam database table Product. Yang ni untuk tunjuk jumlah product quantity dalam shopping cart. So aku kecilkan huruf quantity instead of Quantity dari table product database untuk elak confuse 
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
                    dt.Rows.Add(dr)
                    GridViewCheckout.DataSource = dt
                    GridViewCheckout.DataBind()
                    Session("buyproduct") = dt
                    GridViewCheckout.FooterRow.Cells(4).Text = "Total Amount"
                    GridViewCheckout.FooterRow.Cells(5).Text = Grandtotal().ToString()
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
                    dt.Rows.Add(dr)
                    GridViewCheckout.DataSource = dt
                    GridViewCheckout.DataBind()
                    Session("buyproduct") = dt
                    GridViewCheckout.FooterRow.Cells(4).Text = "Total Amount"
                    GridViewCheckout.FooterRow.Cells(5).Text = " RM " & Grandtotal().ToString() & ".00"
                    Response.Redirect("ShoppingCart.aspx")
                End If
            Else
                dt = CType(Session("buyproduct"), DataTable)
                GridViewCheckout.DataSource = dt
                GridViewCheckout.DataBind()
                If GridViewCheckout.Rows.Count > 0 Then
                    GridViewCheckout.FooterRow.Cells(4).Text = " Total Amount "
                    GridViewCheckout.FooterRow.Cells(5).Text = " RM " & Grandtotal().ToString() & ".00"
                End If
            End If
        End If
    End Sub
    Public Sub EWalletTransactionid() 'manually buat auto increment for Transaction id in table EwalletTransactions
        Dim con As New SqlConnection
        con.ConnectionString = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
        con.Open()
        Dim query As String = "Select Max (TransactionId) From EwalletTransactions"
        Dim cmd As SqlCommand = New SqlCommand(query, con)
        Dim dr As SqlDataReader
        dr = cmd.ExecuteReader()
        If dr.Read() Then
            Dim val As String = dr(0).ToString()
            If val = "" Then
                LabelTransactionId.Text = "1"
            Else
                Dim a As Integer
                a = Integer.Parse(dr(0).ToString())
                a = a + 1
                LabelTransactionId.Text = a.ToString()
            End If
            con.Close()
        End If
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
    Public Sub GetOrderId() 'Set the TextBoxOrderId to get the order id
        Dim pass As String = "abcdefghijklmnopqrstuvwxyz123456789"
        Dim r As Random = New Random()
        Dim OrderId As String
        OrderId = "Order" & DateTime.Now.Hour.ToString() & DateTime.Now.Minute.ToString() & DateTime.Now.Second.ToString() & DateTime.Now.Day.ToString() & DateTime.Now.Month.ToString() & DateTime.Now.Year.ToString()
        TextBoxOrderId.Text = OrderId
    End Sub
    Public Function GetProductQuantityInGridview() As Integer 'Untuk ambil data Quantity dalam gridview untuk calculate product stock
        Dim dt As DataTable = New DataTable()
        dt = CType(Session("buyproduct"), DataTable)
        Dim nrow As Integer = dt.Rows.Count
        Dim i As Integer = 0
        Dim ProdQty As Integer = 0
        While i < nrow
            ProdQty += Convert.ToInt32(dt.Rows(i)("quantity").ToString())
            i += 1
        End While
        Return ProdQty
    End Function
    Public Function GetProductIdInGridview() As Integer 'Untuk ambil data product id dalam gridview untuk calculate product stock
        Dim dt As DataTable = New DataTable()
        dt = CType(Session("buyproduct"), DataTable)
        Dim nrow As Integer = dt.Rows.Count
        Dim i As Integer = 0
        Dim ProdId As Integer = 0
        While i < nrow
            ProdId += Convert.ToInt32(dt.Rows(i)("ProductId").ToString())
            i += 1
        End While
        Return ProdId
    End Function
    Public Sub SaveOrder()
        Dim TotalPrice As String = Convert.ToInt32(Session("TotalPrice").ToString())
        Dim InsertOrder As String = "Insert Into Orders(OrderId,CustomerId,Email,DateOfOrder,TotalPrice) Values('" & TextBoxOrderId.Text & "','" & LabelCustomerId.Text & "','" & TextBoxEmail.Text & "','" & TextBoxDateOfOrder.Text & "','" & TotalPrice & "')"
        Dim constr As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
        Dim sqlcon As SqlConnection = New SqlConnection(constr)
        sqlcon.Open()
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.CommandText = InsertOrder
        cmd.Connection = sqlcon
        cmd.ExecuteNonQuery()
        sqlcon.Close()
    End Sub
    Public Function GetGridviewData(ByVal gv As GridView) As String 'Function untuk get gridview data untuk send email
        Dim strBuilder As StringBuilder = New StringBuilder()
        Dim strWriter As StringWriter = New StringWriter(strBuilder)
        Dim htw As HtmlTextWriter = New HtmlTextWriter(strWriter)
        gv.RenderControl(htw)
        Return strBuilder.ToString()
    End Function
    Protected Sub RadioButtonListPayment_SelectedIndexChanged(sender As Object, e As EventArgs) Handles RadioButtonListPayment.SelectedIndexChanged
        If RadioButtonListPayment.SelectedItem.Text = "EWallet" Then
            ButtonEwallet.Visible = True
            ButtonCash.Visible = False
            ButtonCancelShopping.Visible = True
        ElseIf RadioButtonListPayment.SelectedValue = "Cash" Then
            ButtonCash.Visible = True
            ButtonEwallet.Visible = False
            ButtonCancelShopping.Visible = True
            LabelEwalletBalanceStatus.Text = ""
        End If
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
    End Sub
    Protected Sub ButtonCash_Click(sender As Object, e As EventArgs) Handles ButtonCash.Click
        Dim dt As DataTable
        dt = CType(Session("buyproduct"), DataTable)
        For i As Integer = 0 To dt.Rows.Count - 1
            Dim InsertOrderDetails As String = "Insert Into OrderDetails(OrderId,CustomerName,Email,PhoneNumber,Address,Number,ProductName,ProductPrice,Quantity,TotalPrice,DateOfOrder,PaymentType) Values('" & TextBoxOrderId.Text & "','" & TextBoxUsername.Text & "','" & TextBoxEmail.Text & "','" & TextBoxPhoneNumber.Text & "','" & TextBoxAddress.Text & "','" & dt.Rows(i)("Number") & "','" & dt.Rows(i)("ProductName") & "','" & dt.Rows(i)("ProductPrice") & "','" & dt.Rows(i)("quantity") & "','" & dt.Rows(i)("TotalPrice") & "','" & TextBoxDateOfOrder.Text & "','" & RadioButtonListPayment.SelectedItem.Text & "')"
            Dim mycon As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True"
            Dim sqlcon As SqlConnection = New SqlConnection(mycon)
            sqlcon.Open()
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.CommandText = InsertOrderDetails
            cmd.Connection = sqlcon
            cmd.ExecuteNonQuery()
            sqlcon.Close()
        Next
        Dim smtp As SmtpClient = New SmtpClient()
        smtp.Host = "smtp.gmail.com"
        smtp.Port = 587
        smtp.Credentials = New System.Net.NetworkCredential("admiiiineshop@gmail.com", "admin_1234")
        smtp.EnableSsl = True
        Dim msg As MailMessage = New MailMessage()
        msg.Subject = "Thank you for purchase our product online"
        msg.Body = "Please view your order details . " & "Order ID : " & TextBoxOrderId.Text & " , Date : " & TextBoxDateOfOrder.Text & vbLf & GetGridviewData(GridViewCheckout) 'GetGridviewData untuk ambil data dari gridview supaya customer boleh view product details di gridview
        msg.IsBodyHtml = True
        Dim EmailTo As String = (TextBoxEmail.Text)
        msg.[To].Add(EmailTo)
        Dim EmailFrom As String = "admiiiineshop@gmail.com"
        msg.From = New MailAddress(EmailFrom)
        Try
            smtp.Send(msg)
        Catch
            Throw
        End Try
        SaveOrder()
        ClearSavedShoppingCartDetails()
        Response.Redirect("Receipt.aspx?OrderId=" & TextBoxOrderId.Text)
    End Sub
    Protected Sub ButtonEwallet_Click(sender As Object, e As EventArgs) Handles ButtonEwallet.Click
        Dim dt As DataTable
        Dim con As SqlConnection = New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True")
        Dim EwalletAccountNumber As String = LabelEwalletAccountId.Text
        Dim TotalPrice As String = Convert.ToInt32(Session("TotalPrice").ToString())
        Dim EWalletBalance As Integer = LabelEWalletBalance.Text
        Dim cmd As SqlCommand = New SqlCommand()
        Dim Transaction As SqlTransaction
        con.Open()
        cmd.Connection = con
        dt = CType(Session("buyproduct"), DataTable)
        Transaction = con.BeginTransaction()
        cmd.Connection = con
        cmd.Transaction = Transaction
        Try
            cmd.CommandText = "Insert Into EwalletTransactions (TransactionId, AccountId, Date, OrderId, PurchaseAmount, Balance, Email) Values('" & LabelTransactionId.Text & "','" & LabelEwalletAccountId.Text & "', '" & TextBoxDateOfOrder.Text & "','" & TextBoxOrderId.Text & "','" & TotalPrice & "', '" & LabelEWalletBalance.Text & "', '" & LabelGetEmailValueFromSession.Text & "')"
            cmd.ExecuteNonQuery()
            cmd.CommandText = "Update EWallet Set Balance = Balance - '" & TotalPrice & "' Where AccountId = '" & EwalletAccountNumber & "'"
            cmd.ExecuteNonQuery()
            cmd.CommandText = "Update EWalletTransactions Set Balance = Balance - '" & TotalPrice & "' Where TransactionId = '" & LabelTransactionId.Text & "'"
            cmd.ExecuteNonQuery()
            cmd.CommandText = "Update Products Set ProductQuantity = ProductQuantity - '" & LabelProductQuantityInGridview.Text & "' Where ProductId = '" & LabelProductIdInGridview.Text & "'"
            cmd.ExecuteNonQuery()
            For i As Integer = 0 To dt.Rows.Count - 1
                cmd.CommandText = "Insert Into OrderDetails(OrderId,CustomerName,Email,PhoneNumber,Address,Number,ProductName,ProductPrice,Quantity,TotalPrice,DateOfOrder,PaymentType) Values('" & TextBoxOrderId.Text & "','" & TextBoxUsername.Text & "','" & TextBoxEmail.Text & "','" & TextBoxPhoneNumber.Text & "','" & TextBoxAddress.Text & "','" & dt.Rows(i)("Number") & "','" & dt.Rows(i)("ProductName") & "','" & dt.Rows(i)("ProductPrice") & "','" & dt.Rows(i)("quantity") & "','" & dt.Rows(i)("TotalPrice") & "','" & TextBoxDateOfOrder.Text & "','" & RadioButtonListPayment.SelectedItem.Text & "')"
                cmd.ExecuteNonQuery()
            Next
            If EWalletBalance <= 0 Then
                LabelEwalletBalanceStatus.Text = "You have no balance in E-Wallet"
                LabelEwalletBalanceStatus.ForeColor = System.Drawing.Color.Red
            ElseIf EWalletBalance < TotalPrice Then
                LabelEwalletBalanceStatus.Text = "You have insufficient balance in E-Wallet"
                LabelEwalletBalanceStatus.ForeColor = System.Drawing.Color.Red
            Else
                Transaction.Commit()
                SaveOrder()
                Dim smtp As SmtpClient = New SmtpClient()
                smtp.Host = "smtp.gmail.com"
                smtp.Port = 587
                smtp.Credentials = New System.Net.NetworkCredential("admiiiineshop@gmail.com", "admin_1234")
                smtp.EnableSsl = True
                Dim msg As MailMessage = New MailMessage()
                msg.Subject = "Thank you for purchase our product online"
                msg.Body = "Please view your order details . " & "Order ID : " & TextBoxOrderId.Text & " , Date :" + TextBoxDateOfOrder.Text & vbLf & GetGridviewData(GridViewCheckout)
                msg.IsBodyHtml = True
                Dim EmailTo As String = (TextBoxEmail.Text)
                msg.[To].Add(EmailTo)
                Dim EmailFrom As String = "admiiiineshop@gmail.com"
                msg.From = New MailAddress(EmailFrom)
                Try
                    smtp.Send(msg)
                Catch
                    Throw
                End Try
                ClearSavedShoppingCartDetails()
                Response.Redirect("Receipt.aspx?OrderId=" & TextBoxOrderId.Text)
            End If
        Catch ex As SqlException
            Transaction.Rollback()
            LabelStatus.Text = ex.Message
        Finally
            con.Close()
        End Try
    End Sub
    Protected Sub ButtonCancelShopping_Click(sender As Object, e As EventArgs) Handles ButtonCancelShopping.Click
        Session.Remove("buyproduct")
        ClearSavedShoppingCartDetails()
        Response.Redirect("CustomerProduct.aspx")
    End Sub
    Public Overrides Sub VerifyRenderingInServerForm(ByVal control As Control) 'untuk fetch gridview data untuk send email
        'Tell the compiler that the control is rendered
        'explicitly by overriding the VerifyRenderingInServerForm event.
    End Sub
End Class