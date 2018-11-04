<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChinh.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="QuanLyKiTucXa.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 126px;
        }
        .auto-style2 {
            width: 338px;
        }
        .auto-style3 {
        }
        .auto-style7 {
            width: 198px;
        }
        .auto-style9 {
            width: 87px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      
    <form id="form1" runat="server">
      
    <div>
    <h2 style="color:#085ebd">Thông tin đăng ký ở ký túc xá</h2>
        <div>

            <table style="width:100%;font-size:20px">
                <tr>
                    <td class="auto-style3" colspan="5" style="text-align:center;background-color:#bfedeb;color:#085ebd">Dành cho sinh viên mới</td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style1">Mã số sinh viên</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txt_mssv" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style7">SĐT</td>
                    <td>
                        <asp:TextBox ID="txt_sdt0" runat="server" Width="169px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style1">Họ và tên</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txt_hoten" runat="server" Width="172px" OnTextChanged="txt_hoten_TextChanged"></asp:TextBox>
                    </td>
                    <td class="auto-style7">Email</td>
                    <td>
                        <asp:TextBox ID="txt_email" runat="server" Width="167px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style1">Ngày Sinh</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox3" runat="server" Width="172px"></asp:TextBox>
                    </td>
                    <td class="auto-style7">Địa chỉ</td>
                    <td>
                        <asp:TextBox ID="txt_diachi" runat="server" Width="167px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style1">Giới Tính</td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="dropd_gioitinh" runat="server" Width="120px">
                            <asp:ListItem Value="Nam"></asp:ListItem>
                            <asp:ListItem Value="Nữ"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style7">Khoa</td>
                    <td>
                        <asp:TextBox ID="txt_khoa" runat="server" Width="167px"></asp:TextBox>
                    </td>
                </tr>
                </table>

        </div>
        <div>

            <table style="width:100%;font-size:20px">
                <tr>
                    <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:center;background-color:#bfedeb;color:#085ebd">Thông tin cho đăng ký ở KTX</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>

        </div>
    </div>
</form>
</asp:Content>
