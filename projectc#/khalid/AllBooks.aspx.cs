using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace projectc_.khalid
{
    public partial class AllBooks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBooks();
                LoadUserHistory();
            }
        }

        private void LoadBooks()
        {
            string filePath = Server.MapPath("books.txt");
            string borrowFilePath = Server.MapPath("borrow.txt");

            HashSet<string> borrowedBooks = new HashSet<string>();
            if (File.Exists(borrowFilePath))
            {
                string[] borrowedEntries = File.ReadAllLines(borrowFilePath);
                foreach (string entry in borrowedEntries)
                {
                    string[] parts = entry.Split('|');
                    if (parts.Length >= 7 && parts[6].Trim().ToLower() == "borrowed")
                    {
                        borrowedBooks.Add(parts[1]); // bookId
                    }
                }
            }

            if (File.Exists(filePath))
            {
                string[] books = File.ReadAllLines(filePath);
                foreach (string book in books)
                {
                    string[] parts = book.Split('|');
                    if (parts.Length >= 6)
                    {
                        string bookId = parts[0];
                        string title = parts[1];
                        string author = parts[2];
                        string category = parts[3];
                        string imageName = parts[4];

                        string imagePath = ResolveUrl($"~/khalid/Images/{imageName}");
                        string buttonState = borrowedBooks.Contains(bookId) ? "disabled" : "";
                        string buttonText = borrowedBooks.Contains(bookId) ? "Borrowed" : "Borrow";

                        HtmlGenericControl card = new HtmlGenericControl("div");
                        card.Attributes["class"] = "col-md-4 mb-4";
                        card.InnerHtml = $@"
                <div class='card book-card'>
                    <img src='{imagePath}' class='card-img-top book-image' alt='{title}' />
                    <div class='card-body'>
                        <h5 class='card-title'>{title}</h5>
                        <p class='card-text'><strong>Author:</strong> {author}</p>
                        <p class='card-text'><strong>Category:</strong> {category}</p>
                        <button class='btn btn-primary' onclick=""borrowBook('{bookId}', '{title}', '{author}', '{category}', '{imageName}', this, event)"" {buttonState}>
                            {buttonText}
                        </button>
                    </div>
                </div>";

                        booksContainer.Controls.Add(card);
                    }
                }
            }
        }

        private void LoadUserHistory()
        {
            string borrowFilePath = Server.MapPath("borrow.txt");
            string email = Session["UserEmail"] as string;

            if (string.IsNullOrEmpty(email)) return;

            if (File.Exists(borrowFilePath))
            {
                string[] borrowEntries = File.ReadAllLines(borrowFilePath);
                foreach (string entry in borrowEntries)
                {
                    string[] parts = entry.Split('|');
                    if (parts.Length >= 7 && parts[0] == email)
                    {
                        string bookId = parts[1];
                        string title = parts[2];
                        string author = parts[3];
                        string category = parts[4];
                        string imageName = parts[5];
                        string status = parts[6].Trim();

                        string imagePath = ResolveUrl($"~/khalid/Images/{imageName}");

                        HtmlGenericControl card = new HtmlGenericControl("div");
                        card.Attributes["class"] = "col-md-4 mb-4";
                        card.InnerHtml = $@"
                        <div class='card book-card'>
                            <img src='{imagePath}' class='card-img-top book-image' alt='{title}' />
                            <div class='card-body'>
                                <h5 class='card-title'>{title}</h5>
                                <p class='card-text'><strong>Author:</strong> {author}</p>
                                <p class='card-text'><strong>Category:</strong> {category}</p>
                                <p class='card-text'><strong>Status:</strong> {status}</p>
                            </div>
                        </div>";

                    
                    }
                }
            }
        }

        [WebMethod]
        public static string BorrowBook(string bookId, string title, string author, string category, string imageName)
        {
            //string email = HttpContext.Current.Session["UserEmail"] as string;

            string email = "khalid@gmail.com";


            if (string.IsNullOrEmpty(email))
            {
                return "Error: User not logged in.";
            }

            string borrowFilePath = HttpContext.Current.Server.MapPath("borrow.txt");
            if (!File.Exists(borrowFilePath))
            {
                File.Create(borrowFilePath).Close();
            }

            string bookData = $"{email}|{bookId}|{title}|{author}|{category}|{imageName}|pending";

            using (StreamWriter writer = new StreamWriter(borrowFilePath, true))
            {
                writer.WriteLine(bookData);
            }

            return "Your borrow request has been successfully submitted! Waiting for admin approval.";
        }
    }
}
