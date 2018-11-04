<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChinh.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="QuanLyKiTucXa.DangNhap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 24px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <link href="CSS/Styles.css" rel="stylesheet" />
<div id="divp">
    <img src="Images/Masterpage/DangNhap.png" />
</div>
<div id="divtable" >
   
    <table style="width: 60%; text-align: center;">
        <tr>
            <td style="text-align:center;color:#0b15d7">ĐĂNG NHẬP TÀI KHOẢN</td>
        </tr>
        <tr>
            <td></td>
        </tr>
        <tr>
            <td>Tài khoản</td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtTaiKhoan" runat="server" Width="335px" Height="32px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Mật khẩu</td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtMatKhau" runat="server" TextMode="Password" Width="333px" Height="29px"></asp:TextBox>
            </td>
        </tr>
          <tr>
            <td></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnDangNhap" runat="server" BackColor="#3333FF" EnableTheming="True" Font-Bold="True" Font-Size="15px" ForeColor="White" Text="Đăng nhập" Width="145px" Height="39px" />
            </td>
        </tr>
    </table>
   
</div>
    </form>
</asp:Content>
