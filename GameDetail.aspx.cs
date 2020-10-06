using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class GameDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Title = Request.QueryString["gname"].ToString();
            this.Label1.Text = Request.QueryString["gname"].ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Pay_1.aspx?goodid="+Request.QueryString["goods"].ToString());
        }
    }
}