using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace FIRSTWEB
{
    public partial class adminpublishermanager : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getOwnerByID();
        }

        //add click button
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkIfOwnerExist())
            {
                Response.Write("<script>alert('Owner with this id already exist.')</script>");
            }
            else
            {
                AddNewOwner();
            }
        }
        //update click button
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkIfOwnerExist())
            {
                updateOwner();
            }
            else
            {
                Response.Write("<script>alert('Owner with this id doesn`t exist with this ID. You can add one with the same ID.')</script>");
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkIfOwnerExist())
            {
                deleteRealtor();
            }
            else
            {
                Response.Write("<script>alert('Owner with this ID doesn`t exist. You can`t delete him.')</script>");
            }
        }


        //user define function

        void getOwnerByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from owner_master_tbl where owner_id= '" + TextBox1.Text.Trim() + "' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Ivalid Owner ID.');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");

            }
        }
        bool checkIfOwnerExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from owner_master_tbl where owner_id= '" + TextBox1.Text.Trim() + "' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
                return false;
            }
        }

        void updateOwner()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE owner_master_tbl SET owner_name=@owner_name WHERE owner_id= '" + TextBox1.Text.Trim() + "'", con);

                cmd.Parameters.AddWithValue("@owner_name", TextBox2.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Owner updated succsessfuly.');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void AddNewOwner()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO owner_master_tbl(owner_id,owner_name) values(@owner_id,@owner_name)", con);

                cmd.Parameters.AddWithValue("@owner_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@owner_name", TextBox2.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('New Owner added succsessful.');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void deleteRealtor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from owner_master_tbl WHERE owner_id= '" + TextBox1.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Owner deleted succsessfuly.');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void clearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
        }
    }
}