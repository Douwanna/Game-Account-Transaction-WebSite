using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test.Views.SYSModel
{
    public partial class Main_SYS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                panel1.Visible = false;
                panel2.Visible = false;
                panel3.Visible = false;

            }
        }

        protected void lb1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddGame");
            panel1.Visible = true;
            panel2.Visible = false;
            panel3.Visible = false;
        }
        protected void lb2_Click(object sender, EventArgs e)
        {
            Response.Redirect("DelAdmin.aspx");
            panel1.Visible = false;
            panel2.Visible = true;
            panel3.Visible = false;
        }
        protected void lb3_Click(object sender, EventArgs e)
        {
            Response.Redirect("SHCL.aspx");
            panel1.Visible = false;
            panel2.Visible = false;
            panel3.Visible = true;
        }
    }
}