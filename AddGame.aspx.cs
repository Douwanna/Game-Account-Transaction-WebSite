using System;
using System.Data;
using System.IO;
using System.Data.OleDb;

namespace test.Views.GoodsModel
{
    public partial class AddGame : System.Web.UI.Page
    {
        public string name = "";
        public string fileName = "";
        public string webFilePath = "";
        public string time = "";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (icon_file.FileName.Length != 0)
            {
                name = icon_file.PostedFile.FileName;
                FileInfo file = new FileInfo(name);
                fileName = "imgs/icon/" + DateTime.Now.Second.ToString() + name;
                Session["filename"] ="~/"+fileName;                
                //webFilePath = Server.MapPath("../imgs/icon/" + fileName);
            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            //string sqlstr = "insert into Game(game_name,platform_id,service_name,brief,icon) values (N'" +  + "'," + Convert.ToInt32(platform.SelectedValue.Trim())
            //    + ",N'" + service_name.Text.Trim() + "',N'" + brief.Text.Trim()
            //    + "','" + Session["filename"].ToString() + "')";

            DbHelper db = new DbHelper();
            db.add_game(game_name.Text.Trim(), Convert.ToInt32(platform.SelectedValue.Trim()), Session["filename"].ToString(), service_name.Text.Trim());
            Label1.Text = fileName+","+Session["filename"].ToString();
            if (File.Exists(Session["filename"].ToString()) == false) { icon_file.PostedFile.SaveAs(Server.MapPath(Session["filename"].ToString())); } 
            
            Response.Write("<script>alert('插入成功!');</script>");
            bind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            icon_file.PostedFile.SaveAs(Server.MapPath(Session["filename"].ToString()));
            Image1.ImageUrl = "~/"+fileName;
            Label1.Text = fileName;

            bind();
            
        }
        public void bind()
        {
            GridView1.DataSourceID = SqlDataSource5.ID;
            GridView1.DataBind();
        }
      

        protected void Button2_Click(object sender, EventArgs e)
        {
            //1:将excel上传到服务器；
            string fileUrl = this.GetExcel();
            //2:将excel数据导入数据库
            this.InsetData(this.GetExcelDatatable(fileUrl));

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
            Response.Write(sheetName);
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
            string game_name = "";
            int platform_id;
            string icon = "";
            string sname = "";
            foreach (DataRow dr in dt.Rows)
            {
                //此处遍历获取excel的数据
                game_name = dr[0].ToString().Trim();
                platform_id = Convert.ToInt32(dr[1].ToString().Trim());
                icon = dr[3].ToString().Trim();
                sname = dr[2].ToString().Trim();
                Response.Write(game_name + "," + platform_id+","+icon+","+sname);
                //此处执行你的数据库插入语句即可
                int flag = dbHelper.add_game(game_name,platform_id,icon,sname);
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
            bind();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            ExcelHelper helper = new ExcelHelper();
            helper.GameModel();
        }
    }
}