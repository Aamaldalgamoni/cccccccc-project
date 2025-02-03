using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;

namespace projectc_.Mohammed
{
    public partial class history : System.Web.UI.Page
    {
        string roomsFilePath = HttpContext.Current.Server.MapPath("~/App_Data/UserRooms.txt");
        string booksFilePath = HttpContext.Current.Server.MapPath("~/App_Data/UserBooks.txt");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] != null)
            {
                lblUserName.Text = Session["UserName"]?.ToString() ?? "User";
                EnsureFilesExist(); // ✅ إنشاء الملفات إذا لم تكن موجودة
                LoadUserHistory();
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        // ✅ إنشاء الملفات إذا لم تكن موجودة
        private void EnsureFilesExist()
        {
            if (!File.Exists(roomsFilePath))
            {
                File.Create(roomsFilePath).Close(); // إنشاء ملف غرف فارغ
            }

            if (!File.Exists(booksFilePath))
            {
                File.Create(booksFilePath).Close(); // إنشاء ملف كتب فارغ
            }
        }

        // ✅ تحميل السجل
        private void LoadUserHistory()
        {
            List<object> books = new List<object>();
            List<object> rooms = new List<object>();

            string userEmail = Session["UserEmail"].ToString();

            // ✅ قراءة البيانات من ملف الكتب المستعارة
            foreach (string line in File.ReadAllLines(booksFilePath))
            {
                string[] data = line.Split('|');
                if (data.Length >= 6 && data[0] == userEmail)
                {
                    books.Add(new
                    {
                        BookID = data[1],
                        BookTitle = data[2],
                        Author = data[3],
                        Category = data[4],
                        BorrowDate = data[5],
                        ReturnDate = data[6]
                    });
                }
            }

            // ✅ قراءة البيانات من ملف الغرف المحجوزة
            foreach (string line in File.ReadAllLines(roomsFilePath))
            {
                string[] data = line.Split('|');
                if (data.Length >= 5 && data[0] == userEmail)
                {
                    rooms.Add(new
                    {
                        RoomID = data[1],
                        RoomName = data[2],
                        Time = data[3],
                        Date = data[4]
                    });
                }
            }

            // ✅ ربط البيانات بالـ Repeater
            rptBooks.DataSource = books;
            rptBooks.DataBind();

            rptRooms.DataSource = rooms;
            rptRooms.DataBind();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("userdashboard.aspx");
        }
    }
}
