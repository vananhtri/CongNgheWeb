<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChinh.Master" AutoEventWireup="true" CodeBehind="ThanhToan.aspx.cs" Inherits="QuanLyKiTucXa.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 406px;
        }

        .auto-style2 {
            height: 23px;
        }

        .auto-style3 {
            height: 108px;
        }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link href="CSS/Styles.css" rel="stylesheet" />
    <form id="form1" runat="server">
        <div id="ThanhToan">
            <h2 style="background-color: #2380be; text-align:center; color: #fff">DANH SÁCH SINH VIÊN CÙNG PHÒNG</h2>
        <table style="width: 80%">
            <tr>
                <td class="auto-style2" style="text-align: left; color: #0000CC; font-weight: normal;">Phòng
                    <asp:Label ID="lb_Phong" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:GridView ID="gv_dssv" runat="server" AutoGenerateColumns="False" OnRowCommand="gv_dssv_RowCommand" Height="190px" Width="690px" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                        <Columns>
                            <asp:BoundField DataField="TenTaiKhoan" HeaderText="Mã sinh viên" />
                            <asp:BoundField HeaderText="Họ tên" DataField="HoTen" />
                            <asp:BoundField HeaderText="Số điện thoại" DataField="SoDienThoai" />
                            <asp:BoundField HeaderText="Địa chỉ" DataField="DiaChi" />
                            <asp:BoundField HeaderText="Ngày bắt đầu" DataField="NgayBatDau" />
                            <asp:BoundField HeaderText="Ngày kết thúc" DataField="NgayKetThuc" />
                            <asp:BoundField HeaderText="Tình trạng thanh toán" DataField="TinhTrang" />
                            <asp:CommandField HeaderText="Thanh toán giùm" ShowSelectButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#003399" BackColor="White" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
        </div>
        <div id="ThanhToan1">
            <h2 style="background-color: #2380be; text-align:center; color: #fff">THANH TOÁN TIỀN PHÒNG</h2>
            <table style="width:80%">
               <tr>
                    <td class="auto-style3">
                    <asp:GridView ID="gv_thanhtoan" runat="server" Height="97px" Width="581px" AutoGenerateColumns="False" OnRowDeleting="gv_thanhtoan_RowDeleting" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                        <Columns>
                            <asp:BoundField DataField="MaSV" HeaderText="Mã sinh viên" />
                            <asp:BoundField HeaderText="Họ tên" DataField="HoTen" />
                            <asp:TemplateField HeaderText="Số tháng">
                                <ItemTemplate>
                                    <table style="width: 100%;">
                                        <tr>
                                            <td>
                                                <asp:Button ID="btn_giam" runat="server" Text="-" CommandArgument='<%# Eval("MaTT") %>' Font-Bold="True" Font-Size="18px"  UseSubmitBehavior="false" OnClientClick="return false;"/>
                                            </td>
                                            <td>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("SoThang") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Button ID="btn_tang" runat="server" OnCommand="btn_tang_Command" Text="+" CommandArgument='<%# Eval("MaTT") %>' Font-Bold="True" Font-Size="18px"  />
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Số tiền" DataField="TT" />
                            <asp:CommandField HeaderText="Hủy" ShowDeleteButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                </td>
               </tr>
                <tr>
                     <td style="text-align: center; color: #0000CC;">Tổng tiền thanh toán:&nbsp;
                    <asp:Label ID="lb_thanhtien" runat="server" Text="0 VNĐ" Font-Bold="True"></asp:Label>
                </td>
                </tr>
                <tr>
                     <td style="text-align: center">
                    <asp:Button ID="Button1" runat="server" Text="Thanh Toán" OnClick="Button1_Click" Font-Bold="True" Font-Size="15px" Height="35px" Width="144px" />
                </td>

                </tr>
            </table>
        </div>
    </form>
</asp:Content>
