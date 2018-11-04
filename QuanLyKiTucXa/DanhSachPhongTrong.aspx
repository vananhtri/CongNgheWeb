<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChinh.Master" AutoEventWireup="true" CodeBehind="DanhSachPhongTrong.aspx.cs" Inherits="QuanLyKiTucXa.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 220px;
            height: 26px;
        }

        .auto-style2 {
            width: 160px;
        }
    .auto-style3 {
        height: 23px;
    }
        .auto-style4 {
            width: 120px;
            height: 26px;
        }
        .auto-style5 {
            width: 220px;
            height: 23px;
        }
        .auto-style6 {
            width: 120px;
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="CSS/Styles.css" rel="stylesheet" />
    <form id="form1" runat="server">
        <div id="divPhong">
            <div id="divTimKiem">

                <table style="width: 100%;">
                    <tr>
                        <td class="auto-style5" style="color: #FFFFFF">Đối tượng</td>
                        <td class="auto-style5" style="color: #FFFFFF">Loại phòng</td>
                        <td class="auto-style6" style="color: #FFFFFF">Số người</td>
                        <td class="auto-style2" style="color: #FFFFFF; text-align: center;" rowspan="2">
                            <asp:Button ID="btnTim" runat="server" BackColor="White" Font-Bold="True" Font-Size="13px" ForeColor="Black" Height="27px" Text="TÌM" Width="70px" OnClick="btnTim_Click" Font-Strikeout="True" />
                        </td>
                        <td rowspan="2">
                            <asp:Button ID="btn_reload" runat="server" BackColor="White" Font-Bold="True" Font-Size="13px" ForeColor="Black" Height="27px" Text="RELOAD" Width="70px" OnClick="btn_reload_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:DropDownList ID="ddlDoiTuong" runat="server" Height="24px" Width="190px">
                                <asp:ListItem>Nữ</asp:ListItem>
                                <asp:ListItem>Nam</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style1">
                            <asp:DropDownList ID="ddlLoaiPhong" runat="server" Height="24px" Width="190px" AutoPostBack="True" OnSelectedIndexChanged="ddlLoaiPhong_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style4">
                            <asp:DropDownList ID="ddlSoNguoi" runat="server" Height="24px" Width="100px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>

            &nbsp;&nbsp;&nbsp;

            </div>
            <div id="divDSPhong">
               
                <asp:DataList ID="DSPhong" runat="server" RepeatColumns="4">
                    <ItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("MaPhong") %>' ImageUrl='<%# "Images/phong.jpg" %>' Width="100px" Height="100px" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style3"></td>
                                <td class="auto-style3">
                                    Tên phòng:
                                    <asp:Label ID="TenPhong" runat="server" Text='<%# Eval("TenPhong") %>' ForeColor="#0000CC"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                <td class="auto-style3"></td>
                            </tr>
                            <tr>
                                <td class="auto-style3">&nbsp;</td>
                                <td class="auto-style3">Đối tượng:
                                    <asp:Label ID="lb_doituong" runat="server" ForeColor="#0000CC" Text='<%# Eval("DoiTuong") %>'></asp:Label>
                                </td>
                                <td class="auto-style3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style3"></td>
                                <td class="auto-style3">
                                    Số lượng hiện tại:
                                    <asp:Label ID="lb_sotrong" runat="server" Text='<%# Eval("SDK") %>' ForeColor="#0000CC"></asp:Label>
                                    &nbsp;/&nbsp;
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("SoNguoi") %>' ForeColor="#0000CC"></asp:Label>
                                    &nbsp;đã đặt</td>
                                <td class="auto-style3"></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<%# Eval("MaPhong") %>' ImageUrl='<%# "Images/Icon/chonphong.png" %>' OnCommand="ImageButton2_Command" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
               
            </div>
        </div>
    </form>

</asp:Content>

