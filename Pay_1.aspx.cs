using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class Pay_1 : System.Web.UI.Page
    {
        public string saler_id;
        public string goods_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["needkefu"] = "";
            TextBox1.Text = Session["phone"].ToString();
            Data_Bind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckBox1.Checked)
            {
                Session["needkefu"] = "1599839537";
            }
            //插入数据库
            /*
            string title=Request.QueryString["title"].ToString();
            string gname=Request.QueryString["gname"].ToString(); 
            string pname=Request.QueryString["pname"].ToString(); 
            string sname=Request.QueryString["sname"].ToString(); 
            decimal price = Convert.ToInt32(Request.QueryString["price"].ToString());
            int saler_id = Convert.ToInt32(Request.QueryString["saler"].ToString());
            int buyer_id = Convert.ToInt32(Session["userId"].ToString());
            */
            int good_id = Convert.ToInt32(goods_id);
            int saler = Convert.ToInt32(saler_id);
            int buyer = Convert.ToInt32(Session["uid"].ToString());
            decimal p = Convert.ToDecimal(Label1.Text.Trim());
            //string sql = "insert into [Order](good_id,buyer_id,saler_id,price) values ("+good_id+","+buyer+ "," + saler + "," + p +")";
            DbHelper db = new DbHelper();
            //int cnt = db.insert_update(sql);
            int id = db.buy_goods(good_id,buyer,saler,p);
            if (TextBox1.Text != null)
            {
                string url = "Pay_2.aspx?oid=" + id + "&pname="+pname.Text+"&sname="+sname.Text+"&title="+title.Text;
                Response.Redirect(url);
            }
        }
        public void Data_Bind()
        {
            string sql = "SELECT goods_id, game_name, service_name, pname, title, price, kc,saler_id FROM goods_to_show WHERE (goods_id = "
                +Convert.ToInt32(Request.QueryString["goodid"].Trim()) +")";
            DataSet ds = new DataSet();
            DbHelper helper = new DbHelper();
            ds = helper.payds(sql);
            title.Text = ds.Tables[0].Rows[0]["title"].ToString();
            gname.Text = ds.Tables[0].Rows[0]["game_name"].ToString();
            sname.Text = ds.Tables[0].Rows[0]["service_name"].ToString();
            pname.Text = ds.Tables[0].Rows[0]["pname"].ToString();
            Label1.Text = ds.Tables[0].Rows[0]["price"].ToString();
            Label2.Text= ds.Tables[0].Rows[0]["kc"].ToString();
            Label3.Text = Label1.Text;
            saler_id = ds.Tables[0].Rows[0]["saler_id"].ToString();
            goods_id= ds.Tables[0].Rows[0]["goods_id"].ToString();
            price.Text = "￥" + Label1.Text.Trim();
        }      
    }
}