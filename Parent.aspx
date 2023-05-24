<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Parent.aspx.cs" Inherits="FinalProject_UniCash.Parent" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Parent Information</title>
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
            max-width: 600px;
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
            <h1>Parent Information</h1>
            <asp:Label ID="lblMsg2" runat="server" Text=""></asp:Label>
            <br /><br />
            <label for="parentIDNumLabel">Parent ID:</label>
            <asp:TextBox ID="parentIDNumTextbox" runat="server" Placeholder="Enter your ID number"></asp:TextBox>
            <br /><br />
            <label for="parentFNameLabel">First Name:</label>
            <asp:TextBox ID="parentFNameTextbox" runat="server" Placeholder="Enter your first name"></asp:TextBox>
            <br /><br />
            <label for="parentLNameLabel">Last Name:</label>
            <asp:TextBox ID="parentLNameTextbox" runat="server" Placeholder="Enter your last name"></asp:TextBox>
            <br /><br />
            <label for="parentAgeLabel">Age:</label>
            <asp:TextBox ID="parentAgeTextbox" runat="server" Placeholder="Enter your age"></asp:TextBox>
            <br /><br />
            <label for="parentContactNumLabel">Contact Number:</label>
            <asp:TextBox ID="parentContactNumTextbox" runat="server" Placeholder="Enter your contact number"></asp:TextBox>
            <br /><br />
            <asp:Button ID="submitButton2" runat="server" Text="Submit" OnClick="submitButton2_Click" />
        </div>

        <div class="container">
            <h3>Parent Information from Database</h3>
            <br />
            <asp:GridView ID="parentGridView" runat="server"></asp:GridView>
            <br /><br />
        </div>
    </form>
</body>
</html>
