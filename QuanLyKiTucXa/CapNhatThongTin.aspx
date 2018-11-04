<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChinh.Master" AutoEventWireup="true" CodeBehind="CapNhatThongTin.aspx.cs" Inherits="QuanLyKiTucXa.CapNhatThongTin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 185px;
        }

        .auto-style2 {
            width: 369px;
        }

        .auto-style3 {
            width: 368px;
        }

        .auto-style5 {
            margin-left: 97px;
            width: 86%;
        }

        .auto-style6 {
            width: 226px;
            height: 64px;
        }

        .auto-style7 {
            width: 369px;
            height: 64px;
        }

        .auto-style8 {
            width: 142px;
            height: 64px;
        }

        .auto-style9 {
            width: 142px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="CSS/Styles.css" rel="stylesheet" />
    <form id="form1" runat="server">
        <div id="divThongTin" class="auto-style6">
            <h2 style="background-color: #2380be; color: #fff">THÔNG TIN SINH VIÊN</h2>
            <div id="TTImage">
                <table style="width: 100%;">
                    <tr>
                        <td class="auto-style3" style="text-align: center">
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

                <table style="width: 100%;">
                    <tr>
                        <td class="auto-style1">Mã số sinh viên:</td>
                        <td>
                            <asp:Label ID="lbMSSV" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Khoa:</td>
                        <td>
                            <asp:Label ID="lbKhoa" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Giới tính:</td>
                        <td class="auto-style2">
                            <asp:Label ID="lbGioiTinh" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Ngày sinh:</td>
                        <td>
                            <asp:Label ID="lbNgaySinh" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>

            </div>

        </div>
        <div id="divTTCapNhat">
            <h2 style="background-color: #2380be; color: #fff">THÔNG TIN CÁ NHÂN</h2>
            <table class="auto-style5">
                <tr>
                    <td class="auto-style9">Địa chỉ thường trú:</td>
                    <td>
                        <asp:TextBox ID="txtDiaChi" runat="server" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                            runat="server"
                            ControlToValidate="txtDiaChi"
                            ForeColor="Red"
                            ErrorMessage="Địa chỉ không được trống" EnableViewState="False"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Số CMND:</td>
                    <td>
                        <asp:TextBox ID="txtCMND" runat="server" Width="300px"  onkeypress="return isNumberKey(event)"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                            runat="server"
                            ControlToValidate="txtCMND"
                            ForeColor="Red"
                            ErrorMessage="Số CMND không được trống">
                        </asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Số điện thoại:</td>
                    <td>
                        <asp:TextBox ID="txtSDT" runat="server" Width="300px"
                            onkeypress="return isNumberKey(event)">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                            runat="server"
                            ControlToValidate="txtSDT"
                            ForeColor="Red"
                            ErrorMessage="Số điện thoại không được trống">
                        </asp:RequiredFieldValidator>
                    </td>

                </tr>
                <tr>
                    <td class="auto-style9">Email:</td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                            runat="server"
                            ControlToValidate="txtEmail"
                            ForeColor="Red"
                            ErrorMessage="Email không được trống">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right" class="auto-style9">
                        <asp:Button ID="btnLuu" runat="server" Text="Lưu" Width="76px" OnClick="btnLuu_Click" />

                    </td>

                </tr>
            </table>
        </div>
    </form>
    <script src="JavaScrip/myJS.js"></script>
</asp:Content>
