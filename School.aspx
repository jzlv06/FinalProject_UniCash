<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="School.aspx.cs" Inherits="FinalProject_UniCash.School" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>School Information</title>
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
            <h1>School Information</h1>
            <asp:Label ID="lblMsg1" runat="server" Text=""></asp:Label>
            <br /><br />
            <label for="schoolIDNumLabel">School ID:</label>
            <asp:TextBox ID="schoolIDNumTextbox" runat="server" Placeholder="Enter school ID number"></asp:TextBox>
            <br /><br />
            <label for="schoolNameLabel">School Name:</label>
            <asp:TextBox ID="schoolNameTextbox" runat="server" Placeholder="Enter school name"></asp:TextBox>
            <br /><br />
            <label for="schoolEmailLabel">School Email:</label>
            <asp:TextBox ID="schoolEmailTextbox" runat="server" Placeholder="Enter school email"></asp:TextBox>
            <br /><br />
            <label for="schoolContactNumLabel">School Contact Number:</label>
            <asp:TextBox ID="schoolContactNumTextbox" runat="server" Placeholder="Enter school contact number"></asp:TextBox>
            <br /><br />
            <label for="schoolAddressNumLabel">School Address:</label>
            <asp:TextBox ID="schoolAddressTextbox" runat="server" Placeholder="Enter school address"></asp:TextBox>
            <br /><br />
            <asp:Button ID="submitButton1" runat="server" Text="Submit" OnClick="submitButton1_Click" />
        </div>

        <div class="container">
            <h3>School Information from Database</h3>
            <br />
            <asp:GridView ID="schoolGridView" runat="server"></asp:GridView>
            <br /><br />
        </div>
    </form>
</body>
</html>