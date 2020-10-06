using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NPOI.HSSF.UserModel;
using NPOI.SS.Formula.Functions;
using NPOI.SS.UserModel;

namespace test
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /*

        public void ListToExcelByNPOI(List<T> data)
        {
            string pasthname = "结果-" + DateTime.Now.ToString("yyyy-MM-dd") + "导出" + ".xls";
            HSSFWorkbook workbook = new HSSFWorkbook();
            ISheet sheet = workbook.CreateSheet("Sheet1");
            //获取公共属性由于做表头                   
            var propertys = typeof(UploadTestResultInfos).GetProperties();
            List<string> title = new List<string>();
            foreach (PropertyInfo item in typeof(UploadTestResultInfos).GetProperties())
            {
                //if (!Ignore.IgnoreField(item.Name))
                //    continue;

                title.Add(item.Name);
            }

            var rowtitle = sheet.CreateRow(0);

            for (var i = 0; i < title.Count; i++)
            {
                rowtitle.CreateCell(i).SetCellValue(title[i]);
            }


            for (var i = 0; i < data.Count; i++)
            {
                var row = sheet.CreateRow(i + 1);                     //因为表头名称占了一行，所以加1
                for (var j = 0; j < propertys.Length; j++)
                {
                    //if (!Ignore.IgnoreField(propertys[j].Name))
                    //    continue;

                    var obj = propertys[j].GetValue(data[i], null);
                    row.CreateCell(j).SetCellValue(obj.ToString().Trim());
                }
            }

            using (MemoryStream ms = new MemoryStream())
            {
                workbook.Write(ms);
                //Web导出
                HttpContext curContext = HttpContext.Current;
                curContext.Response.ContentType = "application/vnd.ms-excel";
                curContext.Response.ContentEncoding = Encoding.UTF8;
                curContext.Response.Charset = "";
                curContext.Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(pasthname, Encoding.UTF8));
                curContext.Response.BinaryWrite(ms.GetBuffer());
                curContext.Response.End();
            }
        }*/

        protected void Button1_Click(object sender, EventArgs e)
        {
            HSSFWorkbook workbook2007 = new HSSFWorkbook(); //创建xlsx工作簿
            workbook2007.CreateSheet("Sheet1");  //新建1个Sheet工作表
                                                 //ISheet sheet = workbook2007.CreateSheet("Sheet1");
            HSSFSheet SheetOne = (HSSFSheet)workbook2007.GetSheet("Sheet1"); //获取名称为Sheet1的工作表
                                                                             //对工作表先添加行，下标从0开始
            for (int i = 0; i < 2; i++)
            {
                SheetOne.CreateRow(i); //为SheetOne添加2行
                                       //IRow row = SheetOne.CreateRow(i);
            }
            //对每一行创建3个单元格
            HSSFRow SheetRow = (HSSFRow)SheetOne.GetRow(0);  //获取Sheet1工作表的首行
            HSSFCell[] SheetCell = new HSSFCell[4];
            for (int i = 0; i < 4; i++)
            {
                SheetCell[i] = (HSSFCell)SheetRow.CreateCell(i);  //为第一行创建3个单元格
                                                                  //ICell headcell = SheetRow.CreateCell(i);
            }
            //创建之后就可以赋值了
            SheetCell[0].SetCellValue("CellValue");
            SheetCell[1].SetCellValue("CellValue2");
            SheetCell[2].SetCellValue("CellValue3");
            SheetCell[3].SetCellValue("CellValue4");
            //不指定路径
            MemoryStream memoryStream = new MemoryStream(); //创建内存流
            workbook2007.Write(memoryStream); //npoi将创建好的工作簿写入到内存流
            HttpContext.Current.Response.AppendHeader("Content-Disposition", "attachment;filename=" + "123.xls");
            HttpContext.Current.Response.BinaryWrite(memoryStream.ToArray());
            HttpContext.Current.Response.End();
            memoryStream.Dispose();
            workbook2007.Close();
            //指定路径保存
            //FileStream file2007 = new FileStream(@"E:\Excel2007.xls", FileMode.Create);
            //workbook2007.Write(file2007);
            //file2007.Close();
            //workbook2007.Close();
            
        }
    }
}