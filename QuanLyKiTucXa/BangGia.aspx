<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChinh.Master" AutoEventWireup="true" CodeBehind="BangGia.aspx.cs" Inherits="QuanLyKiTucXa.BangGia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 341px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="CSS/Styles.css" rel="stylesheet" />
    <link href="CSS/SlideShow.css" rel="stylesheet" />
     <form id="form1" runat="server">

        <div class="col-md-12">
            <div class="slideshow-container">

                <div class="mySlides fade">
                    <img src="Images/SlideShow1/Hinh01.png" style="width: 100%">
                </div>

                <div class="mySlides fade">
                    <img src="Images/SlideShow1/Hinh02.png" style="width: 100%">
                </div>

                <div class="mySlides fade">
                    <img src="Images/SlideShow1/Hinh03.png" style="width: 100%">
                </div>
                <div class="mySlides fade">
                    <img src="Images/SlideShow1/Hinh04.png" style="width: 100%">
                </div>
                <div class="mySlides fade">
                    <img src="Images/SlideShow1/Hinh05.png" style="width: 100%">
                </div>

                <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                <a class="next" onclick="plusSlides(1)">&#10095;</a>

            </div>
            <br>

            <div style="text-align: center">
                <span class="dot" onclick="currentSlide(1)"></span>
                <span class="dot" onclick="currentSlide(2)"></span>
                <span class="dot" onclick="currentSlide(3)"></span>
                <span class="dot" onclick="currentSlide(4)"></span>
                <span class="dot" onclick="currentSlide(5)"></span>
            </div>

        </div>
        <div id="BangGia">

            <table style="width: 100%;">
                <tr>
                    <td colspan="2" style="color: #0000CC; font-size: 28px; font-weight: bold; text-align: left">BẢNG GIÁ THUÊ PHÒNG KÍ TÚC XÁ</td>
                </tr>
                <tr>
                    <td class="auto-style1" style="font-size: 18px">&nbsp;</td>
                    <td style="font-size: 18px">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1" style="font-size: 18px">Giá phòng VIP:</td>
                    <td style="font-size: 18px">
                        <asp:Label ID="lbPhongVIP" runat="server" ForeColor="#000099" Text="Label"></asp:Label>
                        &nbsp;vnđ / tháng</td>
                </tr>
                <tr>
                    <td class="auto-style1" style="font-size: 18px">Giá phòng NORMAL:</td>
                    <td style="font-size: 18px">
                        <asp:Label ID="lbPhongNormal" runat="server" ForeColor="#000099" Text="Label"></asp:Label>
                        &nbsp;vnđ / tháng</td>
                </tr>
                <tr>
                    <td class="auto-style1" style="font-size: 18px">Giá điện:</td>
                    <td style="font-size: 18px">&nbsp;<asp:Label ID="Label3" runat="server" ForeColor="#000099" Text="3000"></asp:Label>
                        &nbsp;vnđ/ kw</td>
                </tr>
                <tr>
                    <td class="auto-style1" style="font-size: 18px">Giá nước:</td>
                    <td style="font-size: 18px">&nbsp;<asp:Label ID="Label4" runat="server" ForeColor="#000099" Text="50000"></asp:Label>
                        &nbsp;vnđ/ người</td>
                </tr>
                <tr>
                    <td class="auto-style1" style="font-size: 18px">Giá Internet:</td>
                    <td style="font-size: 18px">&nbsp;<asp:Label ID="Label5" runat="server" ForeColor="#000099" Text="30000"></asp:Label>
                        &nbsp;vnđ/ tháng</td>
                </tr>
                <tr>
                    <td class="auto-style1" style="font-size: 18px">Giá tiền giữ xe máy:</td>
                    <td style="font-size: 18px">&nbsp;<asp:Label ID="Label6" runat="server" ForeColor="#000099" Text="100000"></asp:Label>
                        &nbsp;vnđ/ tháng</td>
                </tr>
                <tr>
                    <td class="auto-style1" style="font-size: 18px">Giá tiền giữ xe đạp:</td>
                    <td style="font-size: 18px">&nbsp;<asp:Label ID="Label7" runat="server" ForeColor="#000099" Text="50000"></asp:Label>
                        &nbsp;vnđ/ tháng</td>
                </tr>
                <tr>
                    <td class="auto-style1" style="text-align: right">
                        <asp:Button ID="btnCN" runat="server" Font-Bold="True" ForeColor="#0000CC" Height="35px" Text="CẬP NHẬT" Width="108px" Font-Size="15px" OnClick="btnCN_Click" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>

        </div>
    </form>
    <script src="JavaScrip/myJS.js"></script>   

</asp:Content>
