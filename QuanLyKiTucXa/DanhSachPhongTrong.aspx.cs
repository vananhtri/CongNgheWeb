using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace QuanLyKiTucXa
{

    public partial class WebForm2 : System.Web.UI.Page
    {
        XuLyCode xl = new XuLyCode();

        void LoadAll(DataTable dt)
        {
            DataTable dulieu = new DataTable();
            dulieu.Columns.Add("MaPhong");
            dulieu.Columns.Add("TenPhong");
            dulieu.Columns.Add("SoNguoi");
            dulieu.Columns.Add("SDK");
            dulieu.Columns.Add("MaLau");
            dulieu.Columns.Add("DoiTuong");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataRow dr = dulieu.NewRow();
                dr[0] = dt.Rows[i]["MaPhong"];
                dr[1] = dt.Rows[i]["TenPhong"];
                dr[2] = dt.Rows[i]["SoNguoi"];
                dr[3] = xl.LaySoLuong(dr[0].ToString());
                dr[4] = xl.LayTenLau(dr[0].ToString());
                if (dt.Rows[i]["DoiTuong"].ToString() == "False")
                {
                    dr[5] = "Nữ";
                }
                else
                {
                    dr[5] = "Nam";
                }
                dulieu.Rows.Add(dr);
            }
            DSPhong.DataSource = dulieu;

            DSPhong.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                Session["LoaiPhong"] = xl.LoaiPhong();
                if (Session["LoaiPhong"] != null)
                {
                    ddlLoaiPhong.DataSource = (DataTable)Session["LoaiPhong"];

                    ddlLoaiPhong.DataValueField = "MaLoai";
                    ddlLoaiPhong.DataTextField = "TenLoai";
                    ddlLoaiPhong.DataBind();
                }
                LoadAll(xl.CheckPhongTrong());
            }
        }

        protected void ddlLoaiPhong_SelectedIndexChanged(object sender, EventArgs e)
        {

            ddlSoNguoi.DataSource = xl.LoadSN(ddlLoaiPhong.SelectedValue.ToString().Trim());
            ddlSoNguoi.DataValueField = "SoNguoi";
            ddlSoNguoi.DataTextField = "SoNguoi";
            ddlSoNguoi.DataBind();

        }

        protected void btnTim_Click(object sender, EventArgs e)
        {
            string doituong = ddlDoiTuong.SelectedIndex.ToString();
            string loaiphong = ddlLoaiPhong.SelectedValue.ToString().Trim();
            string sn = ddlSoNguoi.SelectedValue.ToString().Trim();
            LoadAll(xl.SearchRoom(doituong, loaiphong, sn));

        }

        protected void btn_reload_Click(object sender, EventArgs e)
        {
            LoadAll(xl.CheckPhongTrong());
        }

        protected void ImageButton2_Command(object sender, CommandEventArgs e)
        {
            if (IsPostBack)
            {
                if (Session["DN"] != null)
                {

                    bool check = xl.CheckDoiTuongDangKy(xl.CheckDoiTuong(Session["DN"].ToString()), e.CommandArgument.ToString());

                    if (check == true)
                    {
                        Session["Phong"] = e.CommandArgument;
                        Server.Transfer("DangKiPhong.aspx");
                    }
                    else
                    {
                        Response.Write("<script language='JavaScript'> alert(' Đăng ký đúng phòng phù hợp với giới tính của bạn'); </script>");
                    }
                }
                else
                {
                    Server.Transfer("DangNhap.aspx");
                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Calendar cld = new Calendar();
            cld.Visible = true;
        }
    }
}