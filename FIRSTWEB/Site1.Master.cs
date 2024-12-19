using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FIRSTWEB
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(Session["role"] == null){
                    Session["role"] = "";
                }
                if (Session["role"].Equals(""))
                {
                    Button1.Visible = true; // user login link button
                    Button2.Visible = true; // user sign up link button
                    LinkButton6.Visible = true; // admin login link button

                    Button3.Visible = false; // user logout link button
                    LinkButton7.Visible = false; // hello user link button

                    LinkButton11.Visible = false; // admin owner managment link button
                    LinkButton12.Visible = false; // admin apartament managment link button
                    LinkButton8.Visible = false; // admin apartaments in avalible link button
                    LinkButton9.Visible = false; // admin apartaments issuing link button
                    LinkButton10.Visible = false; // admin member managment link button
                }
                else if (Session["role"].Equals("user"))
                {
                    Button1.Visible = false; // user login link button
                    Button2.Visible = false; // user sign up link button
                    LinkButton6.Visible = true; // admin login link button

                    Button3.Visible = true; // user logout link button
                    LinkButton7.Visible = true; // hello user link button
                    LinkButton7.Text = "Hello " + Session["username"].ToString() + "!";

                    LinkButton11.Visible = false; // admin owner managment link button
                    LinkButton12.Visible = false; // admin apartament managment link button
                    LinkButton8.Visible = false; // admin apartaments in avalible link button
                    LinkButton9.Visible = false; // admin apartaments issuing link button
                    LinkButton10.Visible = false; // admin member managment link button
                }
                else if (Session["role"].Equals("admin"))
                {
                    Button1.Visible = false; // user login link button
                    Button2.Visible = false; // user sign up link button
                    LinkButton6.Visible = false; // admin login link button

                    Button3.Visible = true; // user logout link button
                    LinkButton7.Visible = true; // hello user link button
                    LinkButton7.Text = "Hello Admin!";

                    LinkButton11.Visible = true; // admin owner managment link button
                    LinkButton12.Visible = true; // admin apartament managment link button
                    LinkButton8.Visible = true; // admin apartaments in avalible link button
                    LinkButton9.Visible = true; // admin apartaments issuing link button
                    LinkButton10.Visible = true; // admin member managment link button
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminauthormanager.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminpublishermanager.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminapartamentinventory.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminapartamentissuing.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminmembermanager.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewapartament.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";

            Button1.Visible = true; // user login link button
            Button2.Visible = true; // user sign up link button
            LinkButton6.Visible = true; // admin login link button

            Button3.Visible = false; // user logout link button
            LinkButton7.Visible = false; // hello user link button

            LinkButton11.Visible = false; // admin owner managment link button
            LinkButton12.Visible = false; // admin apartament managment link button
            LinkButton8.Visible = false; // admin apartaments in avalible link button
            LinkButton9.Visible = false; // admin apartaments issuing link button
            LinkButton10.Visible = false; // admin member managment link button
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("userviewprofile.aspx");
        }
    }
}