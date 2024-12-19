using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FIRSTWEB
{
    public partial class homepage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        private static int currentIndex = 0;
        private static DataTable apartamentsTable;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }
    }
}