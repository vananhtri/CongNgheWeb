using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyKiTucXa
{
    public partial class DangNhap : System.Web.UI.Page
    {
        XuLyCode xl = new XuLyCode();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                Session["DN"] = null;
                bool check = xl.CheckDangNhap(txtTaiKhoan.Text.Trim(), txtMatKhau.Text.Trim());
                if(check==true)
                {
                    Session["DN"] = txtTaiKhoan.Text;
                    Response.Redirect("GioiThieu.aspx", false);

                }
               
            }
        }
    }
}