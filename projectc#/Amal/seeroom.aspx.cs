using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectc_.Amal
{
    public partial class seeroom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRoomData(); // استدعاء دالة لربط بيانات الغرف
            }
        }

        private void BindRoomData()
        {
            string roomFile = Server.MapPath("addroomfile.txt"); // مسار ملف الغرف
            string[] roomData = File.ReadAllLines(roomFile); // قراءة بيانات الغرف

            string reservationFile = Server.MapPath("reserveroom.txt"); // مسار ملف الحجوزات
            string[] reservationData = File.Exists(reservationFile) ? File.ReadAllLines(reservationFile) : new string[0]; // قراءة بيانات الحجوزات إذا كان الملف موجودًا

            string tableContent = ""; // متغير لتخزين محتوى الجدول

            foreach (var line in roomData) // التكرار على كل غرفة
            {
                string[] roomLine = line.Split(','); // تقسيم بيانات الغرفة
                string roomID = roomLine[0]; // الحصول على Room ID
                string status = "Free to Book"; // الحالة الافتراضية

                // التحقق من حالة الحجز
                foreach (var resLine in reservationData) // التكرار على كل حجز
                {
                    string[] resData = resLine.Split(','); // تقسيم بيانات الحجز
                    if (resData[0] == roomID && resData.Length > 4 && resData[4] == "Approved") // إذا كان الحجز معتمدًا
                    {
                        status = "Booked"; // تغيير الحالة إلى Booked

                        break;
                    }
                }
                tableContent += $"<tr><th>{roomLine[0]}</th><td>{roomLine[1]}</td><td>{roomLine[2]}</td><td>{roomLine[3]}</td><td>{status}</td></tr>";


                // إضافة صف جديد إلى الجدول
            }

            table1.InnerHtml = tableContent; // تعيين محتوى الجدول
        }

        protected void goreserve_Click(object sender, EventArgs e)
        {
            Response.Redirect("roomreservation.aspx");
        }
    }
}