using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;

namespace QuanLyKiTucXa
{
    public static class Helper
    {

        public const string path = "../../Images/SinhVien";
        public static string GetImage(string nameImage)
        {
            return path + "//" + nameImage;
        }
    }
}