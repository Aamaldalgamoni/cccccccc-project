<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReqBorrow.aspx.cs" Inherits="projectc_.khalid.ReqBorrow" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Requested Books</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2 class="text-center mb-4">📚 Requested Books</h2>

            <!-- Success/Error Message -->
            <asp:Label ID="lblMessage" runat="server" CssClass="alert" Visible="false"></asp:Label>

            <!-- GridView displaying books -->
            <asp:GridView ID="BooksGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" OnRowCommand="BooksGridView_RowCommand">
                <Columns>
                    <asp:BoundField DataField="BookId" HeaderText="Book ID" SortExpression="BookId" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
                    <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                    <asp:BoundField DataField="ImagePath" HeaderText="Image Path" SortExpression="ImagePath" />

                    <asp:TemplateField>
                        <ItemTemplate>
                            <!-- Accept and Cancel buttons -->
                            <asp:Button ID="btnAccept" runat="server" Text="Accept" CommandName="AcceptRequest" CommandArgument='<%# Eval("BookId") %>' CssClass="btn btn-success" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="CancelRequest" CommandArgument='<%# Eval("BookId") %>' CssClass="btn btn-danger" />

                            <!-- Labels to show Approved or Rejected -->
                            <asp:Label ID="lblApproved" runat="server" Text="Approved" CssClass="text-success" Visible="false" />
                            <asp:Label ID="lblRejected" runat="server" Text="Rejected" CssClass="text-danger" Visible="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>





            <!-- Additional Buttons Section -->
            <%--    <div class="mt-4">
                <asp:Button ID="btnEditBook" runat="server" Text="Go To Edit Book" CssClass="btn btn-primary" OnClick="btnEditBook_Click" />
                <asp:Button ID="btnDeleteBook" runat="server" Text="Go To Delete Book" CssClass="btn btn-danger" OnClick="btnDeleteBook_Click" />
                <asp:Button ID="btnAddBorrow" runat="server" Text="Go To Add Book" CssClass="btn btn-success" OnClick="btnAddBorrow_Click" />
            </div>--%>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
