using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class Pay_2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["needkefu"] = "";
            oid.Text = Request.QueryString["oid"].ToString();
            pname.Text = Request.QueryString["pname"].ToString();
            sname.Text = Request.QueryString["sname"].ToString();
            title.Text =Request.QueryString["title"].ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["needkefu"].ToString() !="")
            {
                Response.Redirect("Pay_3.aspx?kefu=" + Session["needkefu"].ToString()) ;
            }
            else
            {
                Response.Redirect("Pay_4.aspx?oid="+Request.QueryString["oid"].ToString()+"&pname="+Request.QueryString["pname"].ToString()
                 +"&sname="+Request.QueryString["sname"].ToString()+"&title="+Request.QueryString["title"].ToString());
                //Response.Redirect("Pay_4.aspx");
            }
        }
    }
}