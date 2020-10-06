using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bind();
        }
        public void bind()
        {
            GridView1.DataSourceID = SqlDataSource1.ID;
            GridView1.DataBind();
        }
        protected string GetExcel()
        {
            string fileUrl = "";
            #region 文件上传
            try
            {
                //全名  
                string excelFile = this.FileUpload1.PostedFile.FileName;
                //获取文件名（不包括扩展名）  
                string fileName = Path.GetFileNameWithoutExtension(FileUpload1.PostedFile.FileName);
                //扩展名  
                string extentionName = excelFile.Substring(excelFile.LastIndexOf(".") + 1);
                if (fileName == "" || fileName == null)
                {
                    Response.Write("<script>alert('请先选择Excel文件！')</script>");
                    return null;
                }
                if (extentionName != "xls" && extentionName != "xlsx")
                {
                    Response.Write("<script>alert('您上传的不是Excel文件！')</script>");
                    return null;
                }
                //浏览器安全性限制 无法直接获取客户端文件的真实路径，将文件上传到服务器端 然后获取文件源路径  
                #region 设置上传路径将文件保存到服务器
                string dateTime = DateTime.Now.Date.ToString("yyyyMMdd");
                string time = DateTime.Now.ToShortTimeString().Replace(":", "");
                string newFileName = dateTime + time + DateTime.Now.Millisecond.ToString() + ".xls"; ;
                //自己创建的文件夹 位置随意 合理即可  
                fileUrl = "F:\\web程序设计\\test\\excel\\" + newFileName;
                this.FileUpload1.PostedFile.SaveAs(fileUrl);
                //Response.Write("<script>alert('已经上传到服务器文件夹')</script>");
                return fileUrl;
                #endregion

            }
            catch
            {
                Response.Write("<script>alert('数据上传失败，请重新导入')</script>");
                return null;
            }
            finally
            {
                bind();
            }
            #endregion

        }
        protected System.Data.DataTable GetExcelDatatable(string fileUrl)
        {
            //office2007之前 仅支持.xls
            //const string cmdText = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source={0};Extended Properties='Excel 8.0;IMEX=1';";
            //支持.xls和.xlsx，即包括office2010等版本的   HDR=Yes代表第一行是标题，不是数据；
            const string cmdText = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties='Excel 12.0; HDR=Yes; IMEX=1'";

            System.Data.DataTable dt = null;
            //建立连接
            OleDbConnection conn = new OleDbConnection(string.Format(cmdText, fileUrl));

            //打开连接
            if (conn.State == ConnectionState.Broken || conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }


            System.Data.DataTable schemaTable = conn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);

            //获取Excel的第一个Sheet名称
            string sheetName = schemaTable.Rows[0]["TABLE_NAME"].ToString().Trim();
            //查询sheet中的数据
            string strSql = "select * from [" + sheetName + "]";
            OleDbDataAdapter da = new OleDbDataAdapter(strSql, conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dt = ds.Tables[0];

            return dt;


        }
        //3：从System.Data.DataTable导入数据到数据库
        //@param System.Data.DataTable dt
        protected void InsetData(System.Data.DataTable dt)
        {
            DbHelper dbHelper = new DbHelper();
            int i = 0;
            int game_id;
            int platform_id;
            int service_id;
            string role_id = "";
            string role_name = "";
            string _title = "";
            string _brief = "";
            string _pwd = "";
            string created_at="";
            decimal _price;
            int saler_id = Convert.ToInt32(Session["uid"].ToString());
            foreach (DataRow dr in dt.Rows)
            {
                //此处遍历获取excel的数据
                game_id = Convert.ToInt32(dr[0].ToString().Trim());
                service_id  = Convert.ToInt32(dr[1].ToString().Trim());
                platform_id = Convert.ToInt32(dr[2].ToString().Trim());
                role_id = dr[3].ToString().Trim();
                role_name = dr[4].ToString().Trim();
                _title = dr[5].ToString().Trim();
                _brief = dr[6].ToString().Trim();
                _pwd = dr[7].ToString().Trim();
                created_at=dr[8].ToString().Trim();
                _price = Convert.ToDecimal(dr[9].ToString().Trim());
                //此处执行数据库插入语句
                string sql = "insert into Goods(game_id,platform_id,service_id,role_id,role_name,title,brief,password,created_at,price,saler_id) values ("
                    +game_id+","+ platform_id+","+ service_id+",'"+ role_id+"',N'"+ role_name + "',N'"+ _title + "',N'"
                    + _brief+"','"+ _pwd +"','"+ created_at + "',"+ _price +","+saler_id+")";
                int flag = dbHelper.insert_update(sql);
                i++;
            }
            if (i == dt.Rows.Count)
            {
                Response.Write("<script>alert('导入成功：共导入" + i + "组数据！！')</script>");
            }
            else
            {
                Response.Write("<script>alert('未完全导入：共导入" + i + "组数据！！')</script>");
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //1:将excel上传到服务器；
            string fileUrl = this.GetExcel();
            //2:将excel数据导入数据库
            this.InsetData(this.GetExcelDatatable(fileUrl));
            bind();
        }


        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            platform_id.SelectedValue = GridView1.Rows[e.NewSelectedIndex].Cells[4].Text;
            game_id.SelectedValue= GridView1.Rows[e.NewSelectedIndex].Cells[2].Text;
            service_id.SelectedValue= GridView1.Rows[e.NewSelectedIndex].Cells[3].Text;
            role_id.Text= GridView1.Rows[e.NewSelectedIndex].Cells[5].Text;
            role_name.Text= GridView1.Rows[e.NewSelectedIndex].Cells[6].Text;
            title.Text = GridView1.Rows[e.NewSelectedIndex].Cells[7].Text;
            brief.Text = GridView1.Rows[e.NewSelectedIndex].Cells[8].Text;
            price.Text = GridView1.Rows[e.NewSelectedIndex].Cells[11].Text;
            password.Text = GridView1.Rows[e.NewSelectedIndex].Cells[9].Text;

        }

        protected void select_Click(object sender, EventArgs e)
        {
            string sql = "";
            foreach (Control c in control.Controls)
            {
                if(c is DropDownList)
                {
                    DropDownList dp = (DropDownList)c;
                    if (dp.SelectedValue != null)
                    {
                        sql += dp.ID + "=" +Convert.ToInt32(dp.SelectedValue)+" and ";
                    }
                }else if(c is TextBox)
                {
                    TextBox tb = (TextBox)c;
                    if (tb.Text != null)
                    {
                        if (tb.ID == "price")
                        {
                            sql += tb.ID + "=" + Convert.ToInt32(tb.Text.Trim()) + " and ";
                        }
                        else
                        {
                            sql += tb.ID + "=" + tb.Text.Trim() + " and ";
                        }                        
                    }
                }
            }
            sql=GetRemoveSuffixString(sql, " and ");
            string selectstr = "select  where" + sql;
            
        }
        ///<summary>

        /// 移除后缀字符串

        ///</summary>

        ///<param name="val">原字符串</param>

        ///<param name="str">后缀字符串</param>

        ///<returns></returns>

        private string GetRemoveSuffixString(string val, string str)

        {
            string strRegex = @"(" + str + ")" + "$";

            return Regex.Replace(val, strRegex, "");
        }

        protected void update_Click(object sender, EventArgs e)
        {

        }

        protected void insert_Click(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            ExcelHelper helper = new ExcelHelper();
            helper.GoodModel();
        }
    }
}