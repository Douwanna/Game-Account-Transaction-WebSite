using NPOI.HSSF.UserModel;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace test
{
    public class ExcelHelper
    {
        /// <summary>
        /// 商户导入商品模板
        /// </summary>
        public void GoodModel()
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
            HSSFCell[] SheetCell = new HSSFCell[10];
            for (int i = 0; i < 10; i++)
            {
                SheetCell[i] = (HSSFCell)SheetRow.CreateCell(i);  //为第一行创建3个单元格
                                                                  //ICell headcell = SheetRow.CreateCell(i);
            }
            //创建之后就可以赋值了
            SheetCell[0].SetCellValue("game_id");
            SheetCell[1].SetCellValue("service_id");
            SheetCell[2].SetCellValue("platform_id");
            SheetCell[3].SetCellValue("role_id");
            SheetCell[4].SetCellValue("role_name");
            SheetCell[5].SetCellValue("title");
            SheetCell[6].SetCellValue("brief");
            SheetCell[7].SetCellValue("password");
            SheetCell[8].SetCellValue("created_at");
            SheetCell[9].SetCellValue("price");
            //不指定路径
            MemoryStream memoryStream = new MemoryStream(); //创建内存流
            workbook2007.Write(memoryStream); //npoi将创建好的工作簿写入到内存流
            HttpContext.Current.Response.AppendHeader("Content-Disposition", "attachment;filename=" + "123.xls");
            HttpContext.Current.Response.BinaryWrite(memoryStream.ToArray());
            HttpContext.Current.Response.End();
            memoryStream.Dispose();
            workbook2007.Close();
        }
        /// <summary>
        /// 管理员导入游戏模板
        /// </summary>
        public void GameModel()
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
            SheetCell[0].SetCellValue("game_name");
            SheetCell[1].SetCellValue("platform_id");
            SheetCell[2].SetCellValue("service_name");
            SheetCell[3].SetCellValue("icon");
            //不指定路径
            MemoryStream memoryStream = new MemoryStream(); //创建内存流
            workbook2007.Write(memoryStream); //npoi将创建好的工作簿写入到内存流
            HttpContext.Current.Response.AppendHeader("Content-Disposition", "attachment;filename=" + "123.xls");
            HttpContext.Current.Response.BinaryWrite(memoryStream.ToArray());
            HttpContext.Current.Response.End();
            memoryStream.Dispose();
            workbook2007.Close();
        }
    }
}