using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class Pay_3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Pay_4.aspx");
        }
        //cancel
        protected void Button2_Click(object sender, EventArgs e)
        {
            /*string sql = "delete from Order where id=" + Request.QueryString["Id"];
            DbHelper db = new DbHelper();
            int i=db.cancel_order();
            if (i > 0)
            {
                Response.Write("<script>alert('取消成功')</script>");
            }
            else
            {
                Response.Write("<script>alert('请再试一次')</script>");
            }*/
        }
    }
}