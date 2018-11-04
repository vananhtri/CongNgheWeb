using QuanLyKiTucXa.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyKiTucXa
{
    public partial class CapNhatThongTin : System.Web.UI.Page
    {
        QLKiTucXaContextDataContext db = new QLKiTucXaContextDataContext();
        object mssv;
        protected void Page_Load(object sender, EventArgs e)
        {

            mssv = Session["MSSV"];
            if (mssv == null) //go to login
            {
                Response.Redirect("DangNhap.aspx", false);
            }
            else
            {
                if (!Page.IsPostBack) // set textbox change value
                {
                    LoadInfoSinhVien(mssv.ToString());
                }
            }
        }

        private void LoadInfoSinhVien(string mssv)
        {
            var sinhVien = db.ThongTinSinhViens.FirstOrDefault(t => t.TenTaiKhoan == mssv);
            if (sinhVien != null)
            {
                lbMSSV.Text = mssv;
                lbHoTen.Text = sinhVien.HoTen;
                txtCMND.Text = sinhVien.SoCMND.HasValue ? sinhVien.SoCMND.ToString() : string.Empty;
                txtDiaChi.Text = sinhVien.DiaChi;
                txtEmail.Text = sinhVien.Email;
                lbKhoa.Text = sinhVien.Khoa;
                lbNgaySinh.Text = sinhVien.NgaySinh.HasValue ? sinhVien.NgaySinh.Value.ToString("dd/MM/yyyy") : string.Empty;
                txtSDT.Text = sinhVien.SoDienThoai;
                lbGioiTinh.Text = sinhVien.GioiTinh == true ? "Nam" : "Nữ";
                imgHinhSV.ImageUrl = Helper.GetImage(sinhVien.HinhAnh);

            }

        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtDiaChi.Text) || string.IsNullOrWhiteSpace(txtCMND.Text)
                || string.IsNullOrWhiteSpace(txtEmail.Text) || string.IsNullOrWhiteSpace(txtSDT.Text))
            {
                return;
            }
            var sinhVien = db.ThongTinSinhViens.FirstOrDefault(t => t.TenTaiKhoan == mssv.ToString());
            if (sinhVien != null)
            {
                sinhVien.DiaChi = txtDiaChi.Text;
                sinhVien.SoDienThoai = txtSDT.Text;
                sinhVien.SoCMND = int.Parse(txtCMND.Text);
                sinhVien.Email = txtEmail.Text;
            }
            db.SubmitChanges();
            Response.Redirect("ThongTinSinhVien.aspx", false);

        }


    }
}