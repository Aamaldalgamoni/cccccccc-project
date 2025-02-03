<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="showallroom.aspx.cs" Inherits="projectc_.Amal.showallroom" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Show All Rooms</title>
    <style>
        body {
            background-color: #f0f2f5;
            padding-top: 30px;
            font-family: Arial, sans-serif;
        }
        
        .container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 30px;
            background-color: #ffffff;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .table {
            width: 100%;
            table-layout: fixed;
            margin-top: 30px;
            border-collapse: collapse;
        }

        .table th, .table td {
            padding: 15px;
            text-align: center;
        }

        .table th {
            background-color: #007bff;
            color: white;
        }

        .table td {
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
        }

        .table-striped tbody tr:nth-child(odd) {
            background-color: #f2f2f2;
        }

        h2 {
            text-align: center;
            color: #333;
            font-size: 36px;
            margin-bottom: 30px;
        }

        /* Responsive table */
        .table-responsive {
            overflow-x: auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>All Room </h2>

            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Room ID</th>
                        <th scope="col">Room Name</th>
                        <th scope="col">Room Capacity</th>
                        <th scope="col">Room Location</th>
                    </tr>
                </thead>

                <tbody id="tableBody" runat="server">
                </tbody>
            </table>
            <asp:Button ID="back2" runat="server" OnClick="back2_Click" Text="Go back"  CssClass="btn btn-primary"  />
        </div>
    </form>
</body>
</html>

