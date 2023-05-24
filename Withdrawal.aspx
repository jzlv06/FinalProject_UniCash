<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Withdrawal.aspx.cs" Inherits="FinalProject_UniCash.Withdrawal" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Withdrawal Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('b4.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            padding: 20px;
            margin: 0;
        }

        .container {
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 100px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 1px;
            font-weight: bold;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
        }

        th,
        td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Withdrawal Information</h1>
            <asp:Label ID="lblMsg4" runat="server" Text=""></asp:Label>
            <br /><br />
            <label for="withdrawalIDNumLabel">Withdrawal ID:</label>
            <asp:TextBox ID="withdrawalIDNumTextbox" runat="server" Placeholder="Enter withdrawal ID number"></asp:TextBox>
            <br /><br />
            <label for="parentIDNumLabel">Parent ID:</label>
            <asp:TextBox ID="parentIDNumTextbox" runat="server" Placeholder="Enter parent ID number"></asp:TextBox>
            <br /><br />
            <label for="studentIDNumLabel">Student ID:</label>
            <asp:TextBox ID="studentIDNumTextbox" runat="server" Placeholder="Enter student ID number"></asp:TextBox>
            <br /><br />
            <label for="transactionIDNumLabel">Transaction ID:</label>
            <asp:TextBox ID="transactionIDNumTextbox" runat="server" Placeholder="Enter transaction ID number"></asp:TextBox>
            <br /><br />
            <label for="gatewayIDNumLabel">Gateway ID:</label>
            <asp:TextBox ID="gatewayIDNumTextbox" runat="server" Placeholder="Enter gateway ID number"></asp:TextBox>
            <br /><br />
            <label for="withdrawalAmountLabel">Withdrawal Amount:</label>
            <asp:TextBox ID="withdrawalAmountTextbox" runat="server" Placeholder="Enter withdrawal amount"></asp:TextBox>
            <br /><br />
            <label for="withdrawalDateLabel">Withdrawal Date:</label>
            <br /><br />
            <label for="withdrawalStatusLabel">Withdrawal Status:</label>
            <asp:TextBox ID="withdrawalStatusTextbox" runat="server" Placeholder="Enter withdrawal status"></asp:TextBox>
            <br /><br />
            <asp:Button ID="submitButton4" runat="server" Text="Submit" OnClick="submitButton4_Click"/>
        </div>

        <div class="container">
            <h3>Withdrawal Information from Database</h3>
            <br />
            <asp:GridView ID="withdrawalGridView" runat="server"></asp:GridView>
            <br /><br />
        </div>
    </form>
</body>
</html>
