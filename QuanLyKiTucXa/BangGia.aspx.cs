using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuanLyKiTucXa.Model;

namespace QuanLyKiTucXa
{
    
    public partial class BangGia : System.Web.UI.Page
    {
        QLKiTucXaContextDataContext qlktx = new QLKiTucXaContextDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Load();
            }
        }
        void Load()
        {
            var bg = qlktx.LoaiPhongs.Select(t => t);
            foreach(var a in bg)
            {
                if(a.MaLoai.Trim()=="Loai1")
                {
                    lbPhongVIP.Text = a.GiaPhong.ToString();
                }
                if(a.MaLoai.Trim()=="Loai2")
                {
                    lbPhongNormal.Text = a.GiaPhong.ToString();
                }

            }
        }
        protected void btnCN_Click(object sender, EventArgs e)
        {
            if ((string)Session["DN"] == "admin")
            {
                Response.Redirect("CapNhatBangGia.aspx", false);
            }
            else
            {
                XuLyCode xl = new XuLyCode();
                xl.Show("Cần admin để chỉnh giá phòng");
            }
        }
    }
}