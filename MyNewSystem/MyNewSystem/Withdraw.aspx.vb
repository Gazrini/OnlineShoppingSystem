Imports System.Data.SqlClient
Public Class Withdraw
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LabelGetEmailValueFromSession.Text = Session("Email") 'For EwalletTransaction Database Table 
        EWalletTransactionid()
        Dim DateTime As DateTime = DateTime.Now
        TextBoxDate.Text = DateTime.ToString("dd/MM/yyyy")
        DropDownListBank.Items.FindByValue("Choose Bank").Attributes.Add("style", "font-weight:bolder")
        DropDownListBank.Items.FindByValue("Choose Bank").Attributes.Add("disabled", "true")
        If Not Page.IsPostBack Then
            Using con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnStringStoreDB").ConnectionString)
                Using cmd As SqlCommand = New SqlCommand("Select * From EWallet Where Email = @email", con)
                    cmd.Parameters.AddWithValue("@email", Session("Email"))
                    cmd.CommandType = CommandType.Text
                    con.Open()
                    Using reader As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection Or CommandBehavior.SingleResult Or CommandBehavior.SingleRow)
                        If reader.Read() Then
                            TextBoxAccountId.Text = Convert.ToString(reader("AccountId"))
                            TextBoxBalance.Text = Convert.ToString("RM " & reader("Balance") & ".00")
                        End If
                    End Using
                End Using
            End Using
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
    Protected Sub ButtonWithdraw_Click(sender As Object, e As EventArgs) Handles ButtonWithdraw.Click
        Dim AccountId, Bank, Tarikh As String
        Dim Balance, Withdraw As Integer
        Dim BankAccount As Double
        Dim Con As SqlConnection
        Dim Cmd As SqlCommand = New SqlCommand()
        AccountId = TextBoxAccountId.Text
        Bank = DropDownListBank.Text
        Tarikh = TextBoxDate.Text
        BankAccount = Convert.ToInt64(TextBoxBankAccount.Text) 'Convert value from double to Integer sebab integer punya max number tak support, double dia support sebab dia unlimited tak ada max value. Dekat database aku letak datatype balance as VARCHAR 
        Balance = TextBoxBalance.Text
        Withdraw = TextBoxWithdraw.Text
        Con = New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True")
        Cmd.Connection = Con
        Con.Open()
        Dim Transactions As SqlTransaction
        Transactions = Con.BeginTransaction()
        Cmd.Transaction = Transactions
        Try
            Cmd.CommandText = "Insert Into EwalletTransactions (TransactionId, AccountId, Bank, BankAccount, Date, Balance, Withdraw, Email) Values('" & LabelTransactionId.Text & "','" & AccountId & "','" & Bank & "','" & BankAccount & "','" & Tarikh & "','" & Balance & "','" & Withdraw & "', '" & LabelGetEmailValueFromSession.Text & "') "
            Cmd.ExecuteNonQuery()
            Cmd.CommandText = "Update Ewallet Set Balance = Balance - '" & Withdraw & "' where AccountId = '" & AccountId & "'"
            Cmd.ExecuteNonQuery()
            Cmd.CommandText = "Update EwalletTransactions Set Balance = Balance - '" & Withdraw & "' Where TransactionId = '" & LabelTransactionId.Text & "'"
            Cmd.ExecuteNonQuery()
            If Withdraw > Balance Then
                LabelStatus.Text = "You have insufficient balance in E-wallet"
                LabelStatus.ForeColor = System.Drawing.Color.Red
            ElseIf Withdraw = 0 Then
                LabelStatus.Text = "Withdraw RM 0.00 is not allowed"
                LabelStatus.ForeColor = System.Drawing.Color.Red
            Else
                Transactions.Commit()
                LabelStatus.Text = "Withdraw complete"
                LabelStatus.ForeColor = System.Drawing.Color.Green
            End If
        Catch ex As Exception
            Transactions.Rollback()
            LabelStatus.Text = ex.Message
        Finally
            Con.Close()
        End Try
    End Sub
    Protected Sub ButtonClear_Click(sender As Object, e As EventArgs) Handles ButtonClear.Click
        DropDownListBank.SelectedValue = "Choose Bank"
        TextBoxBankAccount.Text = ""
        TextBoxWithdraw.Text = ""
        LabelStatus.Text = ""
    End Sub
End Class