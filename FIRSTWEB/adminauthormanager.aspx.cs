using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FIRSTWEB
{
    public partial class adminauthormanager : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //add button click
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkIfRealtorExist())
            {
                Response.Write("<script>alert('Realtor with this ID already exist. You cannot add another Realtor with the same ID.')</script>");
            }
            else
            {
                AddNewRealtor();
            }
        }

        //update button click
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkIfRealtorExist())
            {
                updateRealtor();
            }
            else
            {
                Response.Write("<script>alert('Realtor with this ID doesn`t exist. You can add Realtor with the same ID.')</script>");
            }
        }

        //delete button click
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkIfRealtorExist())
            {
                deleteRealtor();
            }
            else
            {
                Response.Write("<script>alert('Realtor with this ID doesn`t exist. You can add Realtor with the same ID.')</script>");
            }
        }

        //go button click
        protected void Button1_Click(object sender, EventArgs e)
        {
            getRealtorByID();
        }

        //user define func

        void getRealtorByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from realtor_master_tbl where realtor_id= '" + TextBox1.Text.Trim() + "' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                { 
                    TextBox2.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Ivalid Author ID.');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");

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

                SqlCommand cmd = new SqlCommand("DELETE from realtor_master_tbl WHERE realtor_id= '" + TextBox1.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Realtor deleted succsessfuly.');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updateRealtor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE realtor_master_tbl SET realtor_name=@realtor_name WHERE realtor_id= '" + TextBox1.Text.Trim() + "'", con);

                cmd.Parameters.AddWithValue("@realtor_name", TextBox2.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Realtor updated succsessfuly.');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void AddNewRealtor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO realtor_master_tbl(realtor_id,realtor_name) values(@realtor_id,@realtor_name)", con);

                cmd.Parameters.AddWithValue("@realtor_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@realtor_name", TextBox2.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('New Realtor added succsessful.');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        bool checkIfRealtorExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from realtor_master_tbl where realtor_id= '" + TextBox1.Text.Trim() + "' ", con);
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

        void clearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}