<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChinh.Master" AutoEventWireup="true" CodeBehind="GioiThieu.aspx.cs" Inherits="QuanLyKiTucXa.GioiThieu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            max-width: 678px;
            padding-top: 16px;
            position: relative;
            display: flex;
            margin: auto;
            left: -129px;
            top: -194px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <link href="CSS/Styles.css" rel="stylesheet" />
        <link href="CSS/SlideShow.css" rel="stylesheet" />

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
        <div id="GioiThieu">
            <h2>GIỚI THIỆU VỀ KÍ TÚC XÁ ĐẠI HỌC CÔNG NGHIỆP THỰC PHẨM TP. HỒ CHÍ MINH</h2>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>



        </div>



    </form>


    <script src="JavaScrip/myJS.js"></script>

</asp:Content>
