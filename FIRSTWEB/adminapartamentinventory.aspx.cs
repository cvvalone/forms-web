using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;
using System.Drawing;
using System.Net;
using System.Threading;

namespace FIRSTWEB
{
    public partial class adminapartamentinventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filePath;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT * from apartament_master_tbl WHERE apartament_issuing=1", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            TextBox13.Text = dt.Rows.Count.ToString();
            if (!IsPostBack)
            {
                fillApartamentPublisherValues();
            }
            GridView1.DataBind();
        }

        //GO button
        protected void Button1_Click(object sender, EventArgs e)
        {
            getApartamentByID();
        }

        //add button click
        protected void Button2_Click(object sender, EventArgs e)
        {
            addNewApartament();
        }

        //update button click
        protected void Button3_Click(object sender, EventArgs e)
        {
            updateApartamentInfo();
        }

        //delete button click
        protected void Button4_Click(object sender, EventArgs e)
        {
            deleteApartamentByID();
        }

        //USER define function

        void fillApartamentPublisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT realtor_name from realtor_master_tbl", con);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                ad.Fill(dt);

                DropDownList2.DataSource = dt;
                DropDownList2.DataValueField = "realtor_name";
                DropDownList2.DataBind();

                cmd = new SqlCommand("SELECT owner_name from owner_master_tbl", con);
                ad = new SqlDataAdapter(cmd);
                dt = new DataTable();
                ad.Fill(dt);

                DropDownList3.DataSource = dt;
                DropDownList3.DataValueField = "owner_name";
                DropDownList3.DataBind();
            }
            catch(Exception ex) {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }



        void addNewApartament()
        {
            try
            {
                string advantages = "";


                foreach (int i in ListBox1.GetSelectedIndices())
                {
                    advantages = advantages + ListBox1.Items[i] + ",";
                }
                if(advantages.Length >= 1)
                {
                    advantages = advantages.Remove(advantages.Length - 1);
                }
                

                string filePath = "~/apartamentsInventory/apartaments.png";
                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("apartamentsInventory/" + fileName));
                filePath = "~/apartamentsInventory/" + fileName;

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO apartament_master_tbl(apartament_id,apartament_name,apartament_adress,count_of_rooms,owner_name,realtor_name,contact_number,email,publish_date,apartament_floor,apartament_cost,apartament_description,apartament_imgs_link,apartament_issuing,furniture,equipment,advantages,language) " +
                    "values (@apartament_id,@apartament_name,@apartament_adress,@count_of_rooms,@owner_name,@realtor_name,@contact_number,@email,@publish_date,@apartament_floor,@apartament_cost,@apartament_description,@apartament_imgs_link,@apartament_issuing,@furniture,@equipment,@advantages,@language)", con);

                cmd.Parameters.AddWithValue("@apartament_id", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@apartament_name", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@apartament_adress", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@owner_name", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@realtor_name", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@count_of_rooms", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_number", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@publish_date", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@apartament_floor", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@apartament_cost", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@apartament_description", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@furniture", TextBox11.Text.Trim());
                cmd.Parameters.AddWithValue("@equipment", TextBox12.Text.Trim());
                cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@advantages", advantages);
                cmd.Parameters.AddWithValue("@apartament_imgs_link", filePath);
                cmd.Parameters.AddWithValue("@apartament_issuing", false);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Apartament added successfuly!')</script>");
                GridView1.DataBind();
                clearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        bool checkIfApartamentExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from apartament_master_tbl where apartament_id= '" + TextBox2.Text.Trim() + "' OR apartament_name = '" + TextBox1.Text.Trim() + "';", con);
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

        void getApartamentByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from apartament_master_tbl WHERE apartament_id= '" + TextBox2.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count >= 1)
                {
                    TextBox1.Text = dt.Rows[0]["apartament_name"].ToString();
                    TextBox3.Text = dt.Rows[0]["count_of_rooms"].ToString();
                    TextBox4.Text = dt.Rows[0]["contact_number"].ToString();
                    TextBox8.Text = dt.Rows[0]["email"].ToString();
                    DropDownList1.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
                    DropDownList2.SelectedValue = dt.Rows[0]["realtor_name"].ToString().Trim();
                    DropDownList3.SelectedValue = dt.Rows[0]["owner_name"].ToString().Trim();
                    TextBox5.Text = dt.Rows[0]["publish_date"].ToString().Trim();

                    ListBox1.ClearSelection();
                    string[] advantages = dt.Rows[0]["advantages"].ToString().Trim().Split(',');

                    for(int i = 0; i < advantages.Length; i++)
                    {
                        for(int j = 0; j < ListBox1.Items.Count; j++)
                        {
                            if (ListBox1.Items[j].ToString() == advantages[i])
                            {
                                ListBox1.Items[j].Selected = true;
                            }
                        }
                    }

                    TextBox6.Text = dt.Rows[0]["apartament_floor"].ToString().Trim();
                    TextBox7.Text = dt.Rows[0]["apartament_cost"].ToString().Trim();
                    TextBox9.Text = dt.Rows[0]["apartament_adress"].ToString();
                    TextBox11.Text = dt.Rows[0]["furniture"].ToString();
                    TextBox12.Text = dt.Rows[0]["equipment"].ToString();
                    TextBox10.Text = dt.Rows[0]["apartament_description"].ToString();
                    global_filePath = dt.Rows[0]["apartament_imgs_link"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Apartament ID. You can add book with this ID.')</script>");
                }
            }
            catch(Exception ex) 
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void updateApartamentInfo()
        {
            if (checkIfApartamentExist())
            {
                try
                {
                    string advantages = "";
                    foreach (int i in ListBox1.GetSelectedIndices())
                    {
                        advantages = advantages + ListBox1.Items[i] + ",";
                    }
                    if (advantages.Length > 0)
                    {
                        advantages = advantages.Remove(advantages.Length - 1);
                    }

                    string filePath = "~/apartamentsInventory/apartaments";
                    string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (fileName == "" || fileName == null)
                    {
                        filePath = global_filePath;
                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("apartamentsIventory/" + fileName));
                        filePath = "~/apartamentsInventory/" + fileName;
                    }


                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE apartament_master_tbl SET apartament_name=@apartament_name,advantages=@advantages,realtor_name=@realtor_name,owner_name=@owner_name,email=@email,publish_date=@publish_date,language=@language,apartament_adress=@apartament_adress,count_of_rooms=@count_of_rooms,contact_number=@contact_number,apartament_floor=@apartament_floor,apartament_cost=@apartament_cost,apartament_imgs_link=@apartament_imgs_link,apartament_description=@apartament_description,furniture=@furniture,equipment=@equipment WHERE apartament_id = '" + TextBox2.Text.Trim() + "';", con);

                    cmd.Parameters.AddWithValue("@apartament_name", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@count_of_rooms", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@contact_number", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", TextBox8.Text.Trim());
                    cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@realtor_name", DropDownList2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@owner_name", DropDownList3.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@advantages", advantages);
                    cmd.Parameters.AddWithValue("@publish_date", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@apartament_floor", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@apartament_cost", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@apartament_adress", TextBox9.Text.Trim());
                    cmd.Parameters.AddWithValue("@furniture", TextBox11.Text.Trim());
                    cmd.Parameters.AddWithValue("@equipment", TextBox12.Text.Trim());
                    cmd.Parameters.AddWithValue("@apartament_description", TextBox10.Text.Trim());
                    cmd.Parameters.AddWithValue("@apartament_imgs_link", filePath);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    clearForm();
                    Response.Write("<script>alert('Apartament info updated successfuly!')</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid apartament ID.')</script>");
            }
        }

        void clearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "";
            TextBox11.Text = "";
            TextBox12.Text = "";
            DropDownList1.ClearSelection();
            DropDownList2.ClearSelection();
            DropDownList3.ClearSelection();
            ListBox1.ClearSelection();
        }

        void deleteApartamentByID()
        {
            if (checkIfApartamentExist())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from apartament_master_tbl WHERE apartament_id= '" + TextBox2.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Apartament deleted succsessfuly.');</script>");
                    clearForm();
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}