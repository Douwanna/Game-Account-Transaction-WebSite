using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test.Views.SYSModel
{
    public partial class SHCL : System.Web.UI.Page
    {
        public string order;
        public string th;
        public string saler;
        public string buyer;
        List<TextBox> tb = new List<TextBox>();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList1.SelectedValue = GridView1.SelectedRow.Cells[2].Text;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            int i;
            for (i = 0; i <= GridView1.Rows.Count; i++)
            {
                //首先判断是否是数据行
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    //当鼠标停留时更改背景色
                    e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#00A9FF'");
                    //当鼠标移开时还原背景色
                    e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
                    //单击行的任意列会自动选中此行
                    e.Row.Attributes.Add("onclick", "__doPostBack('GridView1','Select$" + e.Row.RowIndex + "')");
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
    }
}