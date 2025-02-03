<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addroom.aspx.cs" Inherits="projectc_.Amal.addroom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <title>Add Room</title>

    <style>
        /* Styling for the main container */
        .container {
            max-width: 600px;
            margin-top: 40px;
            padding: 30px;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-label {
            font-size: 1.2rem;
        }

        .form-control {
            font-size: 1rem;
            padding: 10px;
            border-radius: 5px;
        }

        .btn-primary {
            width: 100%;
            font-size: 1.1rem;
            padding: 12px;
            border-radius: 5px;
        }

        .mb-3 {
            margin-bottom: 1.5rem;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Add New Room</h2>

            <!-- Room ID Input -->
            <div class="mb-3">
                <label for="roomid" class="form-label">Room ID</label>
                <asp:TextBox Style="width: 100%;" class="form-control" ID="roomid" runat="server"></asp:TextBox>
            </div>

            <!-- Date Input -->
            <div class="mb-3">
                <label for="roomname" class="form-label">Room Name</label>
                <asp:TextBox Style="width: 100%;"  class="form-control" ID="roomname" runat="server"></asp:TextBox>
            </div>



            <!-- Room Capacity Input -->
            <div class="mb-3">
                <label for="roomcapacity" class="form-label">Room Capacity</label>
                <asp:TextBox Style="width: 100%;" class="form-control" ID="roomcapacity" runat="server"></asp:TextBox>
            </div>

            <!-- Room Location Input -->
            <div class="mb-3">
                <label for="roomlocation" class="form-label">Room Location</label>
                <asp:TextBox Style="width: 100%;" class="form-control" ID="roomlocation" runat="server"></asp:TextBox>
            </div>

            <!-- Start Time Input -->
            <!--
            <div class="mb-3">
                <label for="tstart" class="form-label">Time (Start)</label>
                <asp:TextBox style="width: 100%;" type="time" class="form-control" ID="tstart" runat="server"></asp:TextBox>
            </div>-->

            <!-- End Time Input -->
            <!--
            <div class="mb-3">
                <label for="tend" class="form-label">Time (End)</label>
                <asp:TextBox style="width: 100%;" type="time" class="form-control" ID="tend" runat="server"></asp:TextBox>
            </div>-->


            <!-- Add Button -->
            <div class="mb-3">
                <asp:Button ID="butadd" runat="server" OnClick="butadd_Click" Text="Add Room" type="submit" class="btn btn-primary"></asp:Button>
            </div>

                <asp:Button ID="back2" runat="server" OnClick="back2_Click" Text="Go back"  CssClass="btn btn-danger"  />

        </div>
    </form>
</body>
</html>
