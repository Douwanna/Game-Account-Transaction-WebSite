using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class Games : System.Web.UI.Page
    {
        public string cnt
        {
            get { return cnt; }
            set
            {
                cnt = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                //Response.Redirect("Games.aspx?gid=12&pname='安卓'&gname='食物语'");
                //Request.QueryString["gname"] = "王者荣哟啊";
                //Request.QueryString["gid"] ="12";
                gname.Text = Request.QueryString["gname"].ToString();
                DbHelper db = new DbHelper();
                //tongji
                Label1.Text = db.totalamount(Request.QueryString["gid"].ToString());
                //game_name
                gname2.Text = Request.QueryString["gname"].ToString();
                //platform
                lb_platform.Text = Request.QueryString["pname"].ToString();
                dp_platfrom.SelectedValue = Request.QueryString["pname"].ToString();
            }
            switch (RadioButtonList1.SelectedValue)
            {
                case "1":
                    Session["gte"] = 0;
                    Session["lte"] = 50;
                    break;
                case "2":
                    Session["gte"] = 50;
                    Session["lte"] = 100;
                    break;
                case "3":
                    Session["gte"] = 100;
                    Session["lte"] = 99999999;
                    break;
            } 

        }
        public void btn_click()
        {
            //Session["btnid"] = (Button)sender.ID;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedValue == null)
            {
                Response.Write("<script>alert('选择一个价位是必须的！');</script>");
            }
            else
            {
                /*
                string sql = "SELECT goods_id, game_id, game_name, service_id, service_name, platform_id, " +
                    "pname, role_id, role_name, saler_id, name, brief, title, kc, credit, price " +
                    "FROM goods_to_show WHERE (game_id = "+ Request.QueryString["gid"].ToString() 
                    + ") AND (pname = N'"+ lb_platform.Text.Trim()+"')";
                    */
                GoodsListAft.DataBind();
                Repeater1.DataSourceID = "GoodsListAft";
            }
        }

        protected void dp_platfrom_SelectedIndexChanged(object sender, EventArgs e)
        {
            lb_platform.Text = this.dp_platfrom.SelectedValue;
            //SqlDataSource1.DataBind();
            DropDownList1.DataSourceID = SqlDataSource1.ID;
            DropDownList1.DataBind();
        }
    }
}