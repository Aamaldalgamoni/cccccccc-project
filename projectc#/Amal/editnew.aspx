<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editnew.aspx.cs" Inherits="projectc_.editnew" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Room</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script type="text/javascript">
        function confirmDelete() {
            return confirm("Are you sure you want to delete this room?");
        }
    </script>
</head>
<body class="container mt-4">
    <form id="form1" runat="server">
        <div>
            <h2 class="text-center">Edit Room</h2>

            <!-- Select Room -->
            <div class="mb-3">
                <asp:Label ID="lblSelectRoom" runat="server" AssociatedControlID="ddlRooms" CssClass="form-label" Text="Select Room"></asp:Label>
                <asp:DropDownList ID="ddlRooms" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlRooms_SelectedIndexChanged"></asp:DropDownList>
            </div>

            <!-- Room Name -->
            <div class="mb-3">
                <asp:Label ID="lblRoomName" runat="server" AssociatedControlID="txtRoomName" CssClass="form-label" Text="Room Name"></asp:Label>
                <asp:TextBox ID="txtRoomName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <!-- Capacity -->
            <div class="mb-3">
                <asp:Label ID="lblCapacity" runat="server" AssociatedControlID="txtCapacity" CssClass="form-label" Text="Capacity"></asp:Label>
                <asp:TextBox ID="txtCapacity" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>

            <!-- Description -->
            <div class="mb-3">
                <asp:Label ID="lblDescription" runat="server" AssociatedControlID="txtDescription" CssClass="form-label" Text="Description"></asp:Label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            </div>

           

            <!-- Buttons -->
            <div class="mb-3 text-center">
                <asp:Button ID="btnUpdateRoom" runat="server" Text="Update Room" CssClass="btn btn-primary" OnClick="btnUpdateRoom_Click" />
                <asp:Button ID="btnDeleteRoom" runat="server" Text="Delete Room" CssClass="btn btn-danger ms-2" OnClientClick="return confirmDelete();" OnClick="btnDeleteRoom_Click" />
            </div>

            <!-- Success/Error Message -->
            <div class="mb-3 text-center">
                <asp:Label ID="lblmsg" runat="server" CssClass="fw-bold" ForeColor="Green" Visible="false"></asp:Label>


        </div>
            <div class="bb">
                <asp:Button ID="back1" runat="server" OnClick="back1_Click" CssClass="btn btn-primary" Text="Go Back" />
            </div>
    </form>
</body>
</html>