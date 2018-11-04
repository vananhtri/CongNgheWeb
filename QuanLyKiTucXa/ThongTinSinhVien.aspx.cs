using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuanLyKiTucXa.Model;

namespace QuanLyKiTucXa
{
    public partial class ThongTinSinhVien : System.Web.UI.Page
    {
        XuLyCode xl = new XuLyCode();
        QLKiTucXaContextDataContext db = new QLKiTucXaContextDataContext();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            object mssv = Session["DN"];
            if(mssv == null) //go to login
            {
                Response.Redirect("DangNhap.aspx", false);
            }
            else
            {
                LoadInfoSinhVien(mssv.ToString());
            }

        }

        private void LoadInfoSinhVien(string mssv)
        {
            var sinhVien = db.ThongTinSinhViens.FirstOrDefault(t => t.TenTaiKhoan == mssv);
            if(sinhVien != null)
            {
                lbMSSV.Text = mssv;
                lbHoTen.Text = sinhVien.HoTen;
                lbCMND.Text = sinhVien.SoCMND.HasValue? sinhVien.SoCMND.ToString(): string.Empty;
                lbDiaChi.Text = sinhVien.DiaChi;
                lbEmail.Text = sinhVien.Email;
                lbKhoa.Text = sinhVien.Khoa;
                lbNgaySinh.Text = sinhVien.NgaySinh.HasValue ? sinhVien.NgaySinh.Value.ToString("dd/MM/yyyy"): string.Empty;
                lbSoDT.Text = sinhVien.SoDienThoai;
                lbGioiTinh.Text = sinhVien.GioiTinh == true ? "Nam" : "Nữ";
                imgHinhSV.ImageUrl = Helper.GetImage(sinhVien.HinhAnh);

            }

        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            Response.Redirect("CapNhatThongTin.aspx", false);
        }
    }
}