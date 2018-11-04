<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChinh.Master" AutoEventWireup="true" CodeBehind="DangKiPhong.aspx.cs" Inherits="QuanLyKiTucXa.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 252px;
        }

        .auto-style2 {
            width: 51%;
        }

        .auto-style3 {
            width: 252px;
            height: 48px;
        }

        .auto-style4 {
            height: 48px;
        }

        .auto-style5 {
            width: 100%;
        }

        .auto-style6 {
            width: 78px;
        }
        .auto-style7 {
            width: 130px;
        }
        .auto-style8 {
            height: 23px;
        }
        .auto-style9 {
            width: 130px;
            height: 24px;
        }
        .auto-style10 {
            height: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="CSS/Styles.css" rel="stylesheet" />
    <form id="form1" runat="server">
        <div id="divImageDangKi">
            <img src="Images/Masterpage/DangKi.png" />
        </div>
        <div id="divDangKi">
            <table class="auto-style2">
                <tr>
                    <td colspan="2" style="font-size: 25px; color: #0000FF; font-weight: bold; text-align: center">ĐĂNG KÍ Ở KÍ TÚC XÁ</td>
                </tr>
                <tr>
                    <td class="auto-style3" style="font-size: 20px">Mã số sinh viên</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txt_masv" runat="server" Width="265px" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="font-size: 20px">Ngày đăng kí</td>
                    <td>
                        <asp:TextBox ID="txt_ngaydangky" runat="server" Width="267px" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <asp:ImageButton ID="ImageButton1" runat="server" EnableTheming="False" Height="35px" Width="118px" ImageUrl="~/Images/Icon/chonphong.png" OnCommand="ImageButton1_Command" />
                    </td>
                    <td style="text-align: center">

                        <asp:Button ID="btnDangKi" runat="server" BackColor="#0099FF" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="38px" Text="Đăng kí" Width="119px" OnClick="btnDangKi_Click" OnClientClick="javascript: return edit_confirm();" />
                        <script lang="ja">
                            function edit_confirm() {
                                var result = confirm("Bạn có thực sự muốn đăng ký không?");
                                if (result) {
                                    return true;
                                }
                                return false;
                            }</script>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;</td>
                </tr>
            </table>
        </div>
        <div id="divCTPhong">
            <div id="Image">

                <table class="auto-style5">
                    <tr>
                        <td colspan="2">
                            <asp:Image ID="Image1" runat="server" Height="104px" Width="150px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style6" style="font-size: 18px; color: #000000">Tên phòng</td>
                        <td style="font-size: 18px; color: #000000">
                            <asp:Label ID="lb_tenphong" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                </table>

            </div>
            <div id="Table">
                <table style="width: 100%;">
                    <tr>
                        <td colspan="2" style="font-size: 18px; color: #000000; font-weight: bold; text-align: center;">THÔNG TIN PHÒNG ĐĂNG KÍ</td>
                    </tr>
                    <tr>
                        <td class="auto-style7" style="font-size: 18px; color: #000000">Tên lầu</td>
                        <td style="font-size: 18px; color: #000000">
                            <asp:Label ID="lb_lau" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9" style="font-size: 18px; color: #000000">Gía phòng</td>
                        <td class="auto-style10" style="font-size: 18px; color: #000000">
                            <asp:Label ID="lb_gia" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="auto-style8" style="font-size: 18px; color: #000000">Mô tả</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="font-size: 18px; color: #000000">
                            <asp:Label ID="lb_mota" runat="server" Text="mota"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>

</asp:Content>