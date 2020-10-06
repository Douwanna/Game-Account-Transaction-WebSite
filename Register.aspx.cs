using System;
using System.Buffers;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Common;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            wws.WeatherWebService ws = new wws.WeatherWebService();
            string[] reg = ws.getSupportProvince();
            for (int i = 0; i < reg.Length; i++)
            {
                ddl1.Items.Add(reg[i].Substring(0, reg[i].IndexOf(',')));
            }
            string c = ddl1.SelectedItem.Text;
            string[] city = ws.getSupportCity(c);
            ddl2.Items.Clear();
            for (int i = 0; i < city.Length; i++)
            {
                ddl2.Items.Add(city[i].Substring(0, city[i].IndexOf(',')));
            }
            Session["addr"] = c + ddl2.SelectedItem.Text;

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string time = Convert.ToString(DateTime.Now.ToLongTimeString());
            string sqlstr = "insert into admin_user(name,password,sex,phone,createDate) values (N'" + name.Text.Trim() + "','" + password.Text.Trim() + "',N'" + rb1.SelectedValue.Trim() + "','" + phone.Text.Trim() + "','"+ DateTime.Now.ToLongTimeString() + "')";
            DbHelper db = new DbHelper();
            
            int count= db.insert_update(sqlstr); 
            if (count > 0)
            {
                Session["userName"] = name.Text;
                Response.Redirect("../DisplayModel/Home.aspx");
            }
            else
            {
                Response.Write("<script>alert('用户名已存在！');</script>");
            }
        }
    }
}
