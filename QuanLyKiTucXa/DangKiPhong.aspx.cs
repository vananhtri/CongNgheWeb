using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyKiTucXa
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        XuLyCode xl = new XuLyCode();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Phong"] != null)
                {
                    DataTable dt = xl.ThongTinPhong(Session["Phong"].ToString());
                    lb_lau.Text = dt.Rows[0]["TenLau"].ToString();
                    lb_gia.Text = dt.Rows[0]["GiaPhong"].ToString();
                    lb_tenphong.Text = dt.Rows[0]["TenPhong"].ToString();
                    lb_mota.Text = dt.Rows[0]["MoTa"].ToString();
                }
                if (Session["DN"] != null)
                {
                    txt_masv.Text = Session["DN"].ToString();
                }
                else
                {
                    Server.Transfer("DangNhap.aspx");
                }
            }

            txt_ngaydangky.Text = DateTime.Today.ToShortDateString();
        }

        protected void ImageButton1_Command(object sender, CommandEventArgs e)
        {
            if (IsPostBack)
            {
                Session["Phong"] = null;
                Server.Transfer("DanhSachPhongTrong.aspx");
            }
        }



        protected void btnDangKi_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                bool y = xl.CheckDaTonTaiDangKi(Session["DN"].ToString(), Session["Phong"].ToString());
                if (y == true)
                {
                    int i = xl.DangKi(Session["Phong"].ToString(), Session["DN"].ToString(), txt_ngaydangky.Text);
                    if (i == 0)
                    {
                        xl.Show("Bạn đăng kí phòng này thất bại");
                    }
                    else
                    {
                        xl.Show("Đã đăng kí thành công chờ thanh toán để xác nhận");
                        Server.Transfer("ThanhToan.aspx");
                    }
                }
                else
                {
                    xl.Show("Bạn đã đăng kí phòng kí túc xá rồi!");
                }
            }

        }


    }
}

