<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChinh.Master" AutoEventWireup="true" CodeBehind="ThongTinSinhVien.aspx.cs" Inherits="QuanLyKiTucXa.ThongTinSinhVien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            height: 23px;
        }
        .auto-style3 {
            height: 20px;
            width: 46px;
        }
        .auto-style6 {
            height: 144px;
        }
        .auto-style7 {
            width: 166px;
        }
        .auto-style8 {
            height: 23px;
            width: 166px;
        }
        .auto-style9 {
            width: 241px;
        }
        .auto-style10 {
            height: 23px;
            width: 241px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="CSS/Styles.css" rel="stylesheet" />
    <form id="form1" runat="server">
        <div id="divThongTin" class="auto-style6">
                 <h2 style="background-color:#2380be;color:#fff">THÔNG TIN SINH VIÊN</h2>
            <div id="TTImage">
                <table style="width:100%;">
                    <tr>
                        <td class="auto-style3"  style="text-align: center">
                            <asp:Image ID="imgHinhSV" runat="server" ImageUrl="~/Images/Masterpage/thu01.jpg" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center">
                            <asp:Label ID="lbHoTen" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="TTCaNhan">
                
                <table style="width:100%;">
                    <tr>
                        <td class="auto-style7">Mã số sinh viên:</td>
                        <td>
                            <asp:Label ID="lbMSSV" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7">Khoa:</td>
                        <td>
                            <asp:Label ID="lbKhoa" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style8">Giới tính:</td>
                        <td class="auto-style2">
                            <asp:Label ID="lbGioiTinh" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7">Ngày sinh:</td>
                        <td>
                            <asp:Label ID="lbNgaySinh" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                
            </div>
            
        </div>
        <div id="divTTCapNhat">
                 <h2 style="background-color:#2380be;color:#fff">THÔNG TIN CÁ NHÂN</h2>
                 <table>
                    <tr>
                        <td class="auto-style9">Địa chỉ thường trú:</td>
                        <td>
                            <asp:Label ID="lbDiaChi" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">Số CMND:</td>
                        <td>
                            <asp:Label ID="lbCMND" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style10">Số điện thoại:</td>
                        <td class="auto-style2">
                            <asp:Label ID="lbSoDT" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">Email:</td>
                        <td>
                            <asp:Label ID="lbEmail" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right" class="auto-style9">
                            <asp:Button ID="btnCapNhat" runat="server" Text="Cập nhật" OnClick="btnCapNhat_Click" Font-Size="20px" />
                        </td>
                    </tr>
                </table>
            </div>
    </form>
</asp:Content>








