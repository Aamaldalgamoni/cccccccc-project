<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="seeroom.aspx.cs" Inherits="projectc_.Amal.seeroom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

    <style>
        body {
            background-color: #f8f9fa; /* Light gray background */
        }
        .table-container {
            max-width: 900px;
            margin: 50px auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .table {
            border-radius: 10px;
            overflow: hidden;
        }
        thead {
            background-color: #007bff;
            color: white;
            text-align: center;
        }
        tbody tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>

    <form id="form2" runat="server">
        <div class="container">
            <div class="table-container">
                <h2 class="text-center mb-4 text-primary">Room Details</h2>
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Room Name</th>
                            <th scope="col">Room Location</th>
                            <th scope="col">Room Capacity</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody id="table1" runat="server">

                    </tbody>
                </table>
                <asp:Button ID="goreserve" runat="server" Text="Go to reserve room" OnClick="goreserve_Click" class="btn btn-primary" />
            </div>
        </div>
    </form>

</body>
</html>
 