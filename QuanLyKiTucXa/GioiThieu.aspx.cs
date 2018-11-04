using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyKiTucXa
{
    public partial class GioiThieu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string path = Server.MapPath("GioiThieu.txt");

            StringBuilder stringBuilder = new StringBuilder();
            using (var reader = new StreamReader(path))
            {
                while (reader.ReadLine() != null)
                {
                    stringBuilder.Append(reader.ReadLine());
                }
                Label1.Text = stringBuilder.ToString();
            }
        }
    }
}