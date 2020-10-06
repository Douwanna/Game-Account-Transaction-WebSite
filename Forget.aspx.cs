using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class Forget : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_btn_Click(object sender, EventArgs e)
        {
            DbHelper db = new DbHelper();
            string phone = InputPhone.Text.Trim();
            string sqlstr = "select * from admin_user where phone='" + phone + "'";
            int count=0;// =db.select(sqlstr);
            if (count > 0)
            {
                sqlstr = "update admin_user set password='"+exampleInputPassword1.Text.Trim() 
                    +"' where phone = '"+phone+"'";
                Response.Write("<script>alert('修改成功！');</script>");
                Response.Redirect("~/Views/DisplayModel/Home.aspx");
            }
            else
            {
                Response.Write("<script>alert('当前手机号未注册,请重新输入！');</script>");
            }
        }
    }
}