using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace test
{
    public partial class SiteMaster : MasterPage
    {
        public string uname;
        public string uid;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label2.Text = uname;
            Session.Timeout = 30;
            
        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            /*
            string time = Convert.ToString(DateTime.Now.ToLongTimeString());
            string str = ConfigurationManager.ConnectionStrings["GMS"].ConnectionString;
            SqlConnection myconn = new SqlConnection(str);
            myconn.Open();
                      
            string sqlstr ="select name from admin_user where id="+id+" and password='"+password.Text.Trim()+"'";
            SqlCommand com = new SqlCommand(sqlstr, myconn);
                Session["userName"] =com.ExecuteScalar();*/
            if (Label1.Text == "登录")
            {
                int id = Convert.ToInt32(name.Text.Trim());
                string sql = "select * from admin_user where id=" + id + " and password='" + password.Text.Trim() + "'";
                DbHelper helper = new DbHelper();
                if (helper.selectcmd(sql))
                {
                    DataSet ds = new DataSet();
                    ds = helper.payds(sql);
                    Session["userName"] = ds.Tables[0].Rows[0]["name"].ToString();
                    Session["phone"] = ds.Tables[0].Rows[0]["phone"].ToString();
                    Session["admin"] = ds.Tables[0].Rows[0]["isAdmin"].ToString();
                    Session["saler"] = ds.Tables[0].Rows[0]["isSaler"].ToString();
                    Session["trainer"] = ds.Tables[0].Rows[0]["isTrainer"].ToString();
                    Session["uid"] =id;
                    uname = Session["userName"].ToString ();
                    uid = name.Text;
                    Label1.Text = "退出";
                    Label2.Text=Session["userName"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('用户名或密码错误，请重新输入！')</script>");
                }
            }
            else 
            {
                Session["userName"] = "";
                Session["phone"] = "";
                Session["admin"] = "";
                Session["saler"] = "";
                Session["trainer"] = "";
                uname = "";
                Label1.Text = "登录";
            }           
            

        }
        
    }
}