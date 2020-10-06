using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class FH : System.Web.UI.Page
    {
        public int order_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            //DataSet ds = new DataSet();
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs a)
        {
            uid.Text=GridView1.Rows[a.NewSelectedIndex].Cells[5].Text.ToString();
            uname.Text= GridView1.Rows[a.NewSelectedIndex].Cells[6].Text.ToString();
            title.Text= GridView1.Rows[a.NewSelectedIndex].Cells[4].Text.ToString(); 
            dp_FH.SelectedValue= GridView1.Rows[a.NewSelectedIndex].Cells[7].Text.ToString();
            order_id = Convert.ToInt32(GridView1.Rows[a.NewSelectedIndex].Cells[2].Text.ToString());
        }

        protected void fahuo_Click(object sender, EventArgs e)
        {
            string sql = "update [Order] set state=N'" + dp_FH.SelectedValue.ToString() + "' where id=" + order_id;
            DbHelper helper = new DbHelper();
            int i = helper.insert_update(sql);
            if (i > 0)
            {
                GridView1.DataSourceID = Order_State.ID;
                GridView1.DataBind();
                Response.Write("<script>alert('商品已经成功发货！')</script>");
            }
            else
            {
                Response.Write("<script>alert('请选择订单号！')</script>");
            }
        }
    }
}