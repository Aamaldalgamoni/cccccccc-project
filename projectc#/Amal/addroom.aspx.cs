using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectc_.Amal
{
    public partial class addroom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void butadd_Click(object sender, EventArgs e)
        {
            string file = Server.MapPath("addroomfile.txt"); 
            if (!File.Exists(file))
            {
                using (StreamWriter s1 = File.CreateText(file))
                {
                    s1.WriteLine($"{roomid.Text},{roomname.Text},{roomcapacity.Text},{roomlocation.Text},PANDING");
                }
            }
            else
            {
                using(StreamWriter s2=new StreamWriter(file, true))
                {
                    s2.WriteLine($"{roomid.Text},{roomname.Text},{roomcapacity.Text},{roomlocation.Text},PANDING");

                }
            }

            Response.Redirect("page1.aspx");
            }

        protected void back2_Click(object sender, EventArgs e) { Response.Redirect("~/hala2/WebForm1.aspx");
        
        }  
    }
    }
