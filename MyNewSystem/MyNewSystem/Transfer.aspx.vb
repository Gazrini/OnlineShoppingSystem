﻿Imports System.Data.SqlClient
Public Class Transfer
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LabelGetEmailValueFromSession.Text = Session("Email") 'For EwalletTransaction Database Table 
        EWalletTransactionid()
        Dim DateTime As DateTime = DateTime.Now
        TextBoxDate.Text = DateTime.ToString("dd/MM/yyyy")
        If Not Page.IsPostBack Then
            Using con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnStringStoreDB").ConnectionString)
                Using cmd As SqlCommand = New SqlCommand("Select * From EWallet Where Email = @email", con)
                    cmd.Parameters.AddWithValue("@email", Session("Email"))
                    cmd.CommandType = CommandType.Text
                    con.Open()

                    Using reader As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection Or CommandBehavior.SingleResult Or CommandBehavior.SingleRow)
                        If reader.Read() Then
                            TextBoxFromAccountId.Text = Convert.ToString(reader("AccountId"))
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
    Protected Sub ButtonTransfer_Click(sender As Object, e As EventArgs) Handles ButtonTransfer.Click
        Dim AccountId As String
        Dim FromAccount As String
        Dim ToAccount As String
        Dim Tarikh As String
        Dim Balance As Integer
        Dim TransferAmount As Integer
        Dim Con As SqlConnection
        Dim Cmd As SqlCommand = New SqlCommand()
        AccountId = TextBoxFromAccountId.Text
        FromAccount = TextBoxFromAccountId.Text
        ToAccount = TextBoxToAccountId.Text
        Tarikh = TextBoxDate.Text
        Balance = TextBoxBalance.Text
        TransferAmount = TextBoxTransferAmount.Text
        Con = New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MySystemDatabase.mdf;Integrated Security=True")
        Cmd.Connection = Con
        Con.Open()
        Dim Transactions As SqlTransaction
        Transactions = Con.BeginTransaction()
        Cmd.Transaction = Transactions
        Try
            Cmd.CommandText = "Update Ewallet Set Balance = Balance - '" & TransferAmount & "' where AccountId = '" & FromAccount & "'"
            Cmd.ExecuteNonQuery()
            Cmd.CommandText = "Update Ewallet Set Balance = Balance + '" & TransferAmount & "' where AccountId = '" & ToAccount & "'"
            Cmd.ExecuteNonQuery()
            Cmd.CommandText = "Insert Into EwalletTransactions (TransactionId, AccountId, SenderAccount, RecipientAccount, Date,  Balance, TransferAmount, Email) Values('" & LabelTransactionId.Text & "','" & AccountId & "','" & FromAccount & "','" & ToAccount & "','" & Tarikh & "','" & Balance & "','" & TransferAmount & "','" & LabelGetEmailValueFromSession.Text & "') "
            Cmd.ExecuteNonQuery()
            Cmd.CommandText = "Update EwalletTransactions Set Balance = Balance - '" & TransferAmount & "' Where TransactionId = '" & LabelTransactionId.Text & "'"
            Cmd.ExecuteNonQuery()
            If TransferAmount > Balance Then
                LabelStatus.Text = "You have insufficient balance in E-wallet"
                LabelStatus.ForeColor = System.Drawing.Color.Red
            ElseIf TransferAmount = 0 Then
                LabelStatus.Text = "Transfer RM 0.00 is not allowed"
                LabelStatus.ForeColor = System.Drawing.Color.Red
            Else
                Transactions.Commit()
                LabelStatus.Text = "Transfer complete"
                LabelStatus.ForeColor = System.Drawing.Color.Green
            End If
        Catch ex As Exception
            Transactions.Rollback()
            LabelStatus.Text = ex.Message
        Finally
            Con.Close()
        End Try
    End Sub
End Class