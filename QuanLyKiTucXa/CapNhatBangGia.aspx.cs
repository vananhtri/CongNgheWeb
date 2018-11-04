using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuanLyKiTucXa.Model;

namespace QuanLyKiTucXa
{
    public partial class CapNhatBangGia : System.Web.UI.Page
    {
        QLKiTucXaContextDataContext qlktx = new QLKiTucXaContextDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            XuLyCode xl = new XuLyCode();
            try
            {
                if (txtGiaNormal.Text != "" && txtGiaVIP.Text != "")
                {
                    var a = qlktx.LoaiPhongs.Where(t => t.MaLoai == "Loai1").FirstOrDefault();
                    if (a != null)
                    {
                        a.GiaPhong = txtGiaVIP.Text;
                    }
                    var b = qlktx.LoaiPhongs.Where(t => t.MaLoai == "Loai2").FirstOrDefault();
                    if (b != null)
                    {
                        b.GiaPhong = txtGiaNormal.Text;
                    }
                    qlktx.SubmitChanges();
                }
               
                xl.Show("Thay đổi giá thành công");
            }
            catch
            {
                xl.Show("Thay đổi thất bại");
            }
        }
    }
}