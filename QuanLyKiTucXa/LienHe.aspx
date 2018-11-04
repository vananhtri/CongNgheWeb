<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChinh.Master" AutoEventWireup="true" CodeBehind="LienHe.aspx.cs" Inherits="QuanLyKiTucXa.LienHe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <link href="CSS/Styles.css" rel="stylesheet" />
        <div id="divp">
            <img src="Images/Masterpage/LienHe.png" />
        </div>
        <div id="divLienHe">

            <table style="width:100%;">
                <tr>
                    <td>
                       <a href="http://dkmh.cntp.edu.vn">
                           <asp:ImageButton ID="imgbtnThVien" runat="server" ImageUrl="~/Images/LienHe/ThuVien.png" OnClick="imgbtnThVien_Click" PostBackUrl="http://thuvien.hufi.edu.vn" />
                       </a> 
                    </td>
                    <td>
                        <asp:ImageButton ID="imgbtnCTCT" runat="server" ImageUrl="~/Images/LienHe/CTCT-HSSV.png" PostBackUrl="http://ctsvhufi.edu.vn" />
                    </td>
                    <td>
                        <asp:ImageButton ID="imgbtnDaoTao" runat="server" ImageUrl="~/Images/LienHe/daotao.png" PostBackUrl="//dkmh.cntp.edu.vn" />
                    </td>
                </tr>
            </table>

        </div>
        <div id="divLienHe">

            <table style="width:100%;">
                <tr>
                    <td>
                        <asp:ImageButton ID="imgbtnTruong" runat="server" ImageUrl="~/Images/LienHe/webtruong.png" PostBackUrl="http://sinhvien.hufi.edu.vn" />
                    </td>
                    <td>
                        <asp:ImageButton ID="imgbtnTT" runat="server" ImageUrl="~/Images/LienHe/thongtinhuffi.png" />
                    </td>
                    <td>
                        <asp:ImageButton ID="imgbtnTuyenSinh" runat="server" ImageUrl="~/Images/LienHe/tuyensinh.png" PostBackUrl="http://tuyensinh.hufi.edu.vn" />
                    </td>
                </tr>
            </table>

        </div>
        <div id="divLienHeBottom">

            <table style="width:100%; margin-top:50px;">
                <tr>
                    <td style="text-align: center">
                        <asp:ImageButton ID="imgbtnConfession" runat="server" ImageUrl="~/Images/LienHe/confession.png" PostBackUrl="//www.facebook.com/pages/HUFI-Confessions" />
                    </td>
                </tr>
            </table>

        </div>
    </form>
</asp:Content>
