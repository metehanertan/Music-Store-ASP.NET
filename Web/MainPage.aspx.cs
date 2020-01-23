using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace MusicStore
{
      
    public partial class WebForm2 : System.Web.UI.Page
    {
        public static string id = "";

        String connectionString;
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (id.Equals(""))
            {
                LOButton.Visible = false;
                UName.Visible = false;
            }
            else
            {
                LoginButton.Visible = false;
                SigninButton.Visible = false;
               
            }

            items.Text = "<br />";
            connectionString = ConfigurationManager.ConnectionStrings["conStr"].ToString();
            con = new SqlConnection(connectionString);
            string sqlstr;
            sqlstr = "SELECT ITEM.ID,ITEM.Brand,ITEM.ItemName,ITEM.Condition,ITEM.Price,ITEM.OrderID FROM ITEM WHERE ITEM.OrderID IS NULL;";
            SqlCommand command = new SqlCommand(sqlstr, con);

            try
            {
                con.Open();
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    items.Text += reader["ID"].ToString() + " " + reader["Brand"].ToString() + "   " + reader["ItemName"].ToString() + "  " + reader["Condition"].ToString() +" "+ reader["Price"].ToString()+ "<br />";
                }
            }
            catch (SqlException ex)
            {
                Response.Write("<script LANGUAGE='JavaScript'> alert('SQL ERROR!')  </script>");
            }
            finally
            {
                con.Close();
            }
        }

        protected void LB_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm1.aspx");
        }

        protected void SB_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void LO_Click(object sender, EventArgs e)
        {
            setID("");
            Response.Redirect("MainPage.aspx");
        }

        public void setID(String str) { id = str; }
        public String getID() { return id; }

        protected void UM_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserPage.aspx");
        }
    }
}