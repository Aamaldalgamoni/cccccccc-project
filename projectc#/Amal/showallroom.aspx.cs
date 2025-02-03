using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectc_.Amal
{
    public partial class showallroom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string file = Server.MapPath("addroomfile.txt");
            if (File.Exists(file))
            {

                string[] da = File.ReadAllLines(file);
                foreach (string d in da)
                {
                    string[] dataSplit = d.Split(',');

                    tableBody.InnerHtml += $"<tr><td>  {dataSplit[0]}   </td> <td>  {dataSplit[1]}    </td> <td>   {dataSplit[2]}     </td> <td> {dataSplit[3]}   </td></tr>";
                }
            }
        }

        protected void back2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/hala2/WebForm1.aspx");
        }
    }
}
