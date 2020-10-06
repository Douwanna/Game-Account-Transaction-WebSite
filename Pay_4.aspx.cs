using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class Pay_4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DbHelper dbHelper = new DbHelper();
            Label1.Text= dbHelper.GetPwd(Convert.ToInt32(Request.QueryString["oid"].ToString()));
            oid.Text = Request.QueryString["oid"].ToString();
            pname.Text = Request.QueryString["pname"].ToString();
            sname.Text = Request.QueryString["sname"].ToString();
            title.Text = Request.QueryString["title"].ToString();
        }
    }
}