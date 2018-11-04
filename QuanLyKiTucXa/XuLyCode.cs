using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text;
using System.Collections;
using System.Web.UI;

namespace QuanLyKiTucXa
{
    public class XuLyCode
    {
        
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DoAn"].ToString());
        public bool CheckDangNhap(string taikhoan, string matkhau)
        {
            if (string.IsNullOrEmpty(taikhoan) || string.IsNullOrEmpty(matkhau))
            {
                return false;
            }
            else
            {
                conn.Open();
                string check = "Select * from SinhVien where TenTaiKhoan='" + taikhoan + "' and MatKhau='" + matkhau + "'";
                SqlDataAdapter dta = new SqlDataAdapter(check, conn);
                DataTable dt = new DataTable();
                dta.Fill(dt);
                if (dt.Rows.Count == 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
                conn.Close();
            }

        }
        public string CheckDoiTuong(string taikhoan)
        {
            conn.Open();
            string sl = "select GioiTinh from ThongTinSinhVien where TenTaiKhoan='" + taikhoan + "' ";
            SqlDataAdapter dta = new SqlDataAdapter(sl, conn);
            DataTable dt = new DataTable();
            dta.Fill(dt);
            conn.Close();
            return dt.Rows[0][0].ToString();
        }
        public bool CheckDoiTuongDangKy(string gtinh, string maphong)
        {
            try
            {
                conn.Open();
                string sl = "select DoiTuong from Phong where Maphong='" + maphong + "' ";
                SqlDataAdapter dta = new SqlDataAdapter(sl, conn);
                DataTable dt = new DataTable();
                dta.Fill(dt);
                conn.Close();
                if (dt.Rows.Count > 0)
                {
                    string dtuong = dt.Rows[0][0].ToString();
                    //if (dtuong == "False")
                    //    dtuong = "0";
                    //if (dtuong == "True")
                    //    dtuong = "1";
                    if (dtuong == gtinh)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }
        public int LaySoLuong(string maphong)
        {
            conn.Open();
            string sl = "select count(*) as 'SDK' from DangKi dk, TinhTrangDangKi tt where dk.MaPhong ='" + maphong + "' and dk.MaDangKi = tt.MaDangKi and tt.TinhTrang =1 ";
            SqlDataAdapter dta = new SqlDataAdapter(sl, conn);
            DataTable dt = new DataTable();
            dta.Fill(dt);
            conn.Close();
            return int.Parse(dt.Rows[0][0].ToString());
        }
        public string LayTenLau(string maphong)
        {
            conn.Open();
            string sl = "select l.TenLau  from Lau l,Phong p  where p.MaLau=l.MaLau and p.MaPhong ='" + maphong + "'";
            SqlDataAdapter dta = new SqlDataAdapter(sl, conn);
            DataTable dt = new DataTable();
            dta.Fill(dt);
            conn.Close();
            return dt.Rows[0][0].ToString();
        }
        public DataTable CheckPhongTrong()
        {
            DataTable dt = new DataTable();
            conn.Open();
            string sl = "select  p.MaPhong,p.TenPhong,p.SoNguoi,p.DoiTuong from Phong p where p.SoNguoi >=1 and p.MaPhong not in (select p.MaPhong from Phong p,DangKi dk, TinhTrangDangKi tt where p.MaPhong = dk.MaPhong and dk.MaDangKi = tt.MaDangKi and tt.TinhTrang = 1";
            sl += "group by p.MaPhong,p.SoNguoi,p.DoiTuong having  p.SoNguoi = count(*))";
            SqlDataAdapter dta = new SqlDataAdapter(sl, conn);
            dta.Fill(dt);
            conn.Close();
            return dt;
        }

        public DataTable ThongTinPhong(string maphong)
        {
            conn.Open();
            string select = "Select * from Phong,Lau,LoaiPhong where Phong.MaLoai=LoaiPhong.MaLoai and Phong.MaLau=Lau.MaLau and MaPhong=" + maphong;
            SqlDataAdapter dta = new SqlDataAdapter(select, conn);
            DataTable dt = new DataTable();
            dta.Fill(dt);
            conn.Close();
            return dt;
        }
        public int DangKi(string maphong, string taikhoan, string ngaydk)
        {
            try
            {
                conn.Open();
                string ngay = ngaydk.Substring(0, 2);
                string thang = ngaydk.Substring(3, 2);
                ngaydk = thang + "/" + ngay + "/" + ngaydk.Substring(6, 4);
                string insert = "insert into DangKi(MaPhong,MaSV,NgayDangKi,GhiChu) values (" + maphong + ",'" + taikhoan + "','" + ngaydk + "',1)";
                SqlCommand cmd = new SqlCommand(insert, conn);
                cmd.ExecuteNonQuery();
                string sl = "select * from DangKi";
                SqlDataAdapter dta = new SqlDataAdapter(sl, conn);
                DataTable dt = new DataTable();
                dta.Fill(dt);
                string madk = dt.Rows[dt.Rows.Count - 1][0].ToString();
                string insert1 = "insert into TinhTrangDangKi(MaDangKi,TinhTrang) values (" + madk + ",0)";
                SqlCommand cmd1 = new SqlCommand(insert1, conn);
                cmd1.ExecuteNonQuery();
                conn.Close();
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        public DataTable LoaiPhong()
        {
            conn.Open();
            string select = "Select * from LoaiPhong";
            SqlDataAdapter dta = new SqlDataAdapter(select, conn);
            DataTable dt = new DataTable();
            dta.Fill(dt);
            int i = dt.Rows.Count;
            conn.Close();
            return dt;
        }
        public DataTable LoadSN(string loaiphong)
        {
            conn.Open();
            string sl = "select * from Phong where MaLoai='" + loaiphong + "'";
            SqlDataAdapter dta = new SqlDataAdapter(sl, conn);
            DataTable dt = new DataTable();
            dta.Fill(dt);
            conn.Close();
            return dt;
        }

        public DataTable SearchRoom(string dt, string lp, string sn)
        {
            DataTable dtable = new DataTable();
            conn.Open();
            string sl = "select p.MaPhong,p.TenPhong, p.SoNguoi,l.TenLau,p.DoiTuong from Phong p, Lau l";
            sl += " where p.MaLau = l.MaLau  and p.MaPhong in";
            sl += " (select  p.MaPhong from Phong p";
            sl += " where p.SoNguoi >= 1 and p.MaLoai = '" + lp + "' and p.DoiTuong = " + dt + " and p.MaPhong not in";
            sl += " (select p.MaPhong from Phong p, DangKi dk, TinhTrangDangKi tt";
            sl += " where p.MaPhong = dk.MaPhong";
            sl += " and dk.MaDangKi = tt.MaDangKi and tt.TinhTrang = 1";
            sl += " group by p.MaPhong,p.SoNguoi having  p.SoNguoi = count(*)))";
            sl += " group by p.MaPhong,p.TenPhong, p.SoNguoi,l.TenLau,p.DoiTuong";
            SqlDataAdapter dta = new SqlDataAdapter(sl, conn);
            dta.Fill(dtable);
            conn.Close();
            return dtable;
        }
        public bool CheckDaTonTaiDangKi(string taikhoan, string maphong)
        {
            conn.Open();
            string sl = "select * from DangKi where MaSV='" + taikhoan + "' and GhiChu='1'";
            SqlDataAdapter dta = new SqlDataAdapter(sl, conn);
            DataTable dt = new DataTable();
            dta.Fill(dt);
            conn.Close();
            if (dt.Rows.Count == 1)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        public string LoadPhongThanhToan(string taikhoan)
        {
            conn.Open();
            string sl = "Select * from DangKi where MaSV='" + taikhoan + "' and GhiChu=1";
            SqlDataAdapter dta = new SqlDataAdapter(sl, conn);
            DataTable dt = new DataTable();
            dta.Fill(dt);
            conn.Close();
            return dt.Rows[0][0].ToString();
        }
        public DataTable LoadDSSV(string maphong)
        {
            conn.Open();
            string sl = "Select ttsv.*,lp.GiaPhong,tt.* from SinhVien sv,ThongTinSinhVien ttsv, DangKi dk,Phong p,TinhTrangDangKi tt,LoaiPhong lp where sv.TenTaiKhoan=ttsv.TenTaiKhoan ";
            sl += " and sv.TenTaiKhoan=dk.MaSV and dk.MaDangKi=tt.MaDangKi and p.MaPhong=dk.MaPhong and lp.MaLoai=p.MaLoai and dk.GhiChu = 1";
            SqlDataAdapter dta = new SqlDataAdapter(sl, conn);
            DataTable dt = new DataTable();
            dta.Fill(dt);
            conn.Close();
            return dt;
        }
        public int CheckVTSP(DataTable dt, string masp)
        {
            foreach (DataRow dr in dt.Rows)
            {
                if (dr["MaTT"].ToString() == masp)
                {
                    return 1;
                }
            }
            return 0;
        }
        public DataTable UpdateSoluong(DataTable arr, string masp)
        {
            foreach (DataRow dr in arr.Rows)
            {
                if (dr["MaTT"].ToString() == masp)
                {
                    dr["SoThang"] = int.Parse(dr["SoThang"].ToString()) + 1;
                }
            }
            return arr;
        }
        protected static Hashtable handlerPages = new Hashtable();

        public void Show(string Message)
        {
            if (!(handlerPages.Contains(HttpContext.Current.Handler)))
            {
                Page currentPage = (Page)HttpContext.Current.Handler;
                if (!((currentPage == null)))
                {
                    Queue messageQueue = new Queue();
                    messageQueue.Enqueue(Message);
                    handlerPages.Add(HttpContext.Current.Handler, messageQueue);
                    currentPage.Unload += new EventHandler(CurrentPageUnload);
                }
            }
            else
            {
                Queue queue = ((Queue)(handlerPages[HttpContext.Current.Handler]));
                queue.Enqueue(Message);
            }
        }
        private static void CurrentPageUnload(object sender, EventArgs e)
        {
            Queue queue = ((Queue)(handlerPages[HttpContext.Current.Handler]));
            if (queue != null)
            {
                StringBuilder builder = new StringBuilder();
                int iMsgCount = queue.Count;
                builder.Append("<script language='javascript'>");
                string sMsg;
                while ((iMsgCount > 0))
                {
                    iMsgCount = iMsgCount - 1;
                    sMsg = System.Convert.ToString(queue.Dequeue());
                    sMsg = sMsg.Replace("\"", "'");
                    builder.Append("alert( \"" + sMsg + "\" );");
                }
                builder.Append("</script>");
                handlerPages.Remove(HttpContext.Current.Handler);
                HttpContext.Current.Response.Write(builder.ToString());
            }
        }
        public void UodateThanhToan(DataTable dt)
        {
            conn.Open();
            string ngay = DateTime.Today.ToShortDateString().Substring(0, 2);
            string thang = DateTime.Today.ToShortDateString().Substring(3, 2);
            string ngaydk = thang + "/" + ngay + "/" + DateTime.Today.ToShortDateString().Substring(6, 4);
            string insert = "insert into HoaDon(MaTT,NgayLap,TongTien) values ";
            foreach (DataRow dr in dt.Rows)
            {
                insert += "(" + dr["MaTT"].ToString() + ",'" + ngaydk + "'," + dr["TT"].ToString() + "),";

                string sl = "select * from TinhTrangDangKi where MaTinhTrang = " + dr["MaTT"].ToString();
                SqlDataAdapter dta = new SqlDataAdapter(sl, conn);
                DataTable dt1 = new DataTable();
                dta.Fill(dt1);
                string ins = "";
                if(dt1.Rows[0]["NgayBatDau"].ToString()=="")
                {
                   ins = "update TinhTrangDangKi set NgayBatDau='"+ ngaydk + "', NgayKetThuc = DATEADD(month," + dr["SoThang"].ToString() + ",'"+ ngaydk + "') , TinhTrang=1 where MaTinhTrang = '" + dr["MaTT"].ToString()+"'";
                   
                }
                else
                {
                    ngay = dt1.Rows[0]["NgayKetThuc"].ToString().Substring(0, 2);
                    thang = dt1.Rows[0]["NgayKetThuc"].ToString().Substring(3, 2);
                    string nam= dt1.Rows[0]["NgayKetThuc"].ToString().Substring(6, 4);
                    ngaydk = thang + "/" + ngay+ "/" + nam;
                    ins = "update TinhTrangDangKi set NgayKetThuc = DATEADD(month,"+dr["SoThang"].ToString()+",'"+ngaydk+"') , TinhTrang=1 where MaTinhTrang = '" + dr["MaTT"].ToString() + "'";
                }
                SqlCommand cmd1 = new SqlCommand(ins, conn);
                cmd1.ExecuteNonQuery();
            }
            insert = insert.Substring(0, insert.Length - 1);
            SqlCommand cmd = new SqlCommand(insert, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }

    }
}

