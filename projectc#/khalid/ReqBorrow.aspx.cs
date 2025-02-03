﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectc_.khalid
{
    public partial class ReqBorrow : Page
    {
        protected global::System.Web.UI.WebControls.Label lblMessage;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRequestedBooks();
            }
        }

        // Loads borrow requests from borrow.txt and displays them
        private void LoadRequestedBooks()
        {
            string borrowFilePath = Server.MapPath("borrow.txt");

            // Ensure borrow.txt exists
            if (File.Exists(borrowFilePath))
            {
                string[] borrowedBooks = File.ReadAllLines(borrowFilePath);
                List<Book> bookList = new List<Book>();

                foreach (string book in borrowedBooks)
                {
                    string[] parts = book.Split('|');

                    // Ensure the line has the expected number of fields
                    if (parts.Length >= 7)
                    {
                        Book bookItem = new Book
                        {
                            BookId = parts[1],
                            Title = parts[2],
                            Author = parts[3],
                            Category = parts[4],
                            ImagePath = parts[5],
                            Status = parts[6] // "pending" or "borrowed"
                        };
                        bookList.Add(bookItem);
                    }
                }

                // Bind the list to the GridView
                BooksGridView.DataSource = bookList;
                BooksGridView.DataBind();
            }
            else
            {
                // Error message if the borrow.txt file is not found
                lblMessage.Text = "No borrow requests found.";
                lblMessage.Visible = true;
            }
        }

        // Handles accept or cancel actions from the GridView
        // Handles accept or cancel actions from the GridView
        // Handles accept or cancel actions from the GridView
        // Handles accept or cancel actions from the GridView
        protected void BooksGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AcceptRequest")
            {
                string bookId = e.CommandArgument.ToString();
                string borrowFilePath = Server.MapPath("borrow.txt");

                if (!File.Exists(borrowFilePath))
                {
                    lblMessage.Text = "Error: borrow.txt not found.";
                    lblMessage.Visible = true;
                    return;
                }

                // Read all borrow requests
                string[] borrowedBooks = File.ReadAllLines(borrowFilePath);
                var updatedRequests = new List<string>();
                string email = string.Empty;
                string bookTitle = string.Empty;

                foreach (string book in borrowedBooks)
                {
                    string[] parts = book.Split('|');

                    if (parts.Length >= 7 && parts[1] == bookId)
                    {
                        email = parts[0]; // Get the user's email
                        bookTitle = parts[2]; // Get the book title

                        // Check if the email is in the blacklist
                        if (IsEmailInBlacklist(email))
                        {
                            lblMessage.Text = "This user is blacklisted and cannot borrow books.";
                            lblMessage.Visible = true;
                            return;
                        }

                        // Change status to "borrowed"
                        parts[6] = "borrowed";
                    }

                    updatedRequests.Add(string.Join("|", parts));
                }

                // Write back the updated list
                File.WriteAllLines(borrowFilePath, updatedRequests);

                lblMessage.Text = "Borrow request approved.";
                lblMessage.Visible = true;

                // Start the countdown for the user after accepting the request
                if (!string.IsNullOrEmpty(email))
                {
                    StartCountdownForReturn(email, bookId, bookTitle); // Pass book title as well
                }

                // Refresh the grid to reflect the change
                LoadRequestedBooks();
            }
        }



        // Function to check if email is in the blacklist
        private bool IsEmailInBlacklist(string email)
        {
            string blacklistFilePath = Server.MapPath("blacklist.txt");

            // Ensure the blacklist file exists
            if (File.Exists(blacklistFilePath))
            {
                string[] blacklistedEmails = File.ReadAllLines(blacklistFilePath);

                // Check if the email is in the blacklist
                return blacklistedEmails.Any(line => line.StartsWith(email + "|"));
            }

            return false;
        }



        private void StartCountdownForReturn(string email, string bookId, string bookTitle)
        {
            // Simulate a 20-second countdown after approval
            var timer = new System.Threading.Timer((state) =>
            {
                // After 20 seconds, check if the book has been returned, if not, blacklist the user
                CheckBookReturnStatusAndBlacklist(email, bookId, bookTitle);
            }, null, 10000, System.Threading.Timeout.Infinite);
        }


        private void CheckBookReturnStatusAndBlacklist(string email, string bookId, string bookTitle)
        {
            string borrowFilePath = Server.MapPath("borrow.txt");
            string[] borrowedBooks = File.ReadAllLines(borrowFilePath);
            bool returned = borrowedBooks.Any(b => b.Contains(bookId) && b.Contains("returned"));

            if (!returned)
            {
                // Blacklist the user if the book is not returned
                AddToBlacklist(email, bookTitle);
            }
        }


        // Blacklist user if they fail to return a book
        private void AddToBlacklist(string email, string bookTitle)
        {
            string blacklistFilePath = Server.MapPath("blacklist.txt");
            using (StreamWriter writer = new StreamWriter(blacklistFilePath, true))
            {
                writer.WriteLine($"{email}|{bookTitle}");
            }
        }



        // Button to edit books (redirects to UpdateBooks page)
        protected void btnEditBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateBooks.aspx");
        }

        // Button to delete books (redirects to DeleteBooks page)
        protected void btnDeleteBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeleteBooks.aspx");
        }

        // Button to add new books (redirects to AddBooks page)
        protected void btnAddBorrow_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddBooks.aspx");
        }
    }

    // Book class representing the book information
    public class Book
    {
        public string BookId { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public string Category { get; set; }
        public string ImagePath { get; set; }
        public string Status { get; set; } // Track book status: "pending" or "borrowed"
    }
}