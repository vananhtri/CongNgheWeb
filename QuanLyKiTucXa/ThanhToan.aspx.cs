using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyKiTucXa
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        XuLyCode xl = new XuLyCode();
        DataTable dulieu = new DataTable();
        string LoadPhong(string taikhoan)
        {
            return xl.LoadPhongThanhToan(taikhoan);
        }
        void LoadDSSV(string phong)
        {
            gv_dssv.DataSource = xl.LoadDSSV(phong);
            gv_dssv.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["DN"] != null)
                {
                    lb_Phong.Text = LoadPhong(Session["DN"].ToString());
                    LoadDSSV(lb_Phong.Text);
                    dulieu = xl.LoadDSSV(lb_Phong.Text);
                }
                else
                {
                    Server.Transfer("DangNhap.aspx");
                }

            }
           
        }
        void LoadGVTT()
        {
            if (Session["TT"] != null)
            {
                gv_thanhtoan.DataSource = (DataTable)Session["TT"];
                gv_thanhtoan.DataBind();
            }
        }
        void ThanhTien(DataTable dt)
        {
            int tt = 0;
            foreach (DataRow dr in dt.Rows)
            {
                tt += int.Parse(dr["TT"].ToString());
            }

            lb_thanhtien.Text = tt.ToString() + "   VNĐ";
        }
        void CheckTT(string phong, int vitri)
        {
            dulieu = xl.LoadDSSV(lb_Phong.Text);
            if (Session["TT"] == null)
            {
                DataTable dt = new DataTable();
                dt.Rows.Clear();
                dt.Columns.Clear();
                dt.Columns.Add("MaTT", typeof(int));
                dt.Columns.Add("MaSV", typeof(string));
                dt.Columns.Add("HoTen", typeof(string));
                dt.Columns.Add("SoThang", typeof(int));
                dt.Columns.Add("GiaPhong", typeof(int));
                dt.Columns.Add("TT", typeof(int), "SoThang * GiaPhong");

                int matt = int.Parse(dulieu.Rows[vitri]["MaTinhTrang"].ToString());
                string sv = dulieu.Rows[vitri]["TenTaiKhoan"].ToString();
                string ht = dulieu.Rows[vitri]["HoTen"].ToString();
                int st = 1;
                int gp = int.Parse(dulieu.Rows[vitri]["GiaPhong"].ToString());
                int tt = st * gp;
                dt.Rows.Add(matt, sv, ht, st, gp, tt);
                Session["TT"] = dt;
            }
            else
            {
                DataTable dt = (DataTable)Session["TT"];
                int vt = xl.CheckVTSP(dt, dulieu.Rows[vitri]["MaTinhTrang"].ToString());
                if (vt == 0) //chua ton tại
                {
                    int matt = int.Parse(dulieu.Rows[vitri]["MaTinhTrang"].ToString());
                    string sv = dulieu.Rows[vitri]["TenTaiKhoan"].ToString();
                    string ht = dulieu.Rows[vitri]["HoTen"].ToString();
                    int st = 1;
                    int gp = int.Parse(dulieu.Rows[vitri]["GiaPhong"].ToString());
                    int tt = st * gp;
                    dt.Rows.Add(matt, sv, ht, st, gp, tt);
                    Session["TT"] = dt;
                }
                else
                {
                    Session["TT"] = xl.UpdateSoluong(dt, dulieu.Rows[vitri]["MaTinhTrang"].ToString());
                }

            }
        }

        protected void btn_giam_Command(object sender, CommandEventArgs e)
        {
            if (Session["TT"] != null)
            {
                string a = ((Button)sender).CommandArgument;
                DataTable giohang = (DataTable)Session["TT"];

                foreach (DataRow dr in giohang.Rows)
                {
                    if (dr["MaTT"].ToString() == a.Trim())
                    {
                        if (int.Parse(dr["SoThang"].ToString()) <= 1)
                        {
                            ((Button)sender).Enabled = false;
                        }
                        else
                        {
                            dr["SoThang"] = int.Parse(dr["SoThang"].ToString()) - 1;
                        }
                    }
                }
                Session["TT"] = giohang;
                LoadGVTT();
                ThanhTien((DataTable)Session["TT"]);
            }
        }

        protected void btn_tang_Command(object sender, CommandEventArgs e)
        {
            if (Session["TT"] != null)
            {
                string a = ((Button)sender).CommandArgument;
                DataTable giohang = (DataTable)Session["TT"];
                foreach (DataRow dr in giohang.Rows)
                {
                    if (dr["MaTT"].ToString() == a.Trim())
                    {
                        dr["SoThang"] = int.Parse(dr["SoThang"].ToString()) + 1;
                    }
                }
                Session["TT"] = giohang;
                LoadGVTT();
                ThanhTien((DataTable)Session["TT"]);
            }
        }

        protected void gv_thanhtoan_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (Session["TT"] != null)
            {
                DataTable giohang = (DataTable)Session["TT"];
                string masp = giohang.Rows[e.RowIndex]["MaTT"].ToString();
                foreach (DataRow dr in giohang.Rows)
                {
                    if (dr["MaTT"].ToString() == masp)
                    {
                        dr.Delete();
                        break;
                    }
                }
                Session["TT"] = giohang;
                LoadGVTT();
                ThanhTien((DataTable)Session["TT"]);
            }
        }

        protected void gv_dssv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            CheckTT(lb_Phong.Text, int.Parse(e.CommandArgument.ToString()));
            LoadGVTT();
            ThanhTien((DataTable)Session["TT"]);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["TT"] != null)
                {
                    DataTable dt = (DataTable)Session["TT"];
                    xl.UodateThanhToan(dt);
                    xl.Show("Thanh toán thành công");
                }
            }
            catch
            {
                xl.Show("Thanh toán thất bại");
            }

        }
    }
}