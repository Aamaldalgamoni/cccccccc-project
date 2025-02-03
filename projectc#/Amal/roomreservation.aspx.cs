using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectc_.Amal
{
    public partial class roomreservation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void sendreserve_Click(object sender, EventArgs e)
        {
            string file1 = Server.MapPath("reserveroom.txt"); // مسار ملف الحجوزات

            string reservationData = $"{idroom.Text},{nameroom.Text},{dateroom.Text},{timeroom.Text},Pending"; // بيانات الحجز مع حالة "Pending"

            if (!File.Exists(file1)) // إذا كان الملف غير موجود
            {
                using (StreamWriter rw = File.CreateText(file1)) // إنشاء الملف وكتابة البيانات
                {
                    rw.WriteLine(reservationData);
                }
            }
            else // إذا كان الملف موجودًا
            {
                using (StreamWriter sr1 = new StreamWriter(file1, true)) // إضافة البيانات إلى الملف
                {
                    sr1.WriteLine(reservationData);
                }
            }

            // إظهار رسالة نجاح
            Response.Write("<script>alert('Reservation request sent successfully!');</script>");
            Response.Redirect("userdash.aspx");
        }
        
    }
}
    
