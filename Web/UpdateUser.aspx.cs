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
    public partial class UpdateUser : System.Web.UI.Page
    {

        String connectionString;
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {

            connectionString = ConfigurationManager.ConnectionStrings["conStr"].ToString();
            con = new SqlConnection(connectionString);
            string sqlstr;
            sqlstr = "select ONLINECUSTOMER.Name, ONLINECUSTOMER.Surname from ONLINECUSTOMER where ONLINECUSTOMER.CustomerID = " + WebForm1.id;
            SqlCommand command = new SqlCommand(sqlstr, con);

            try
            {
                con.Open();
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    UName.Text = reader["Name"].ToString() + " " + reader["Surname"].ToString();
                }
            }
            catch (SqlException ex)
            {
                throw;
            }
            finally
            {
                con.Close();
            }

        }

        protected void update_Click(object sender, EventArgs e)
        {

            if (!CustomerPasswordIn.Text.Equals(CustomerPasswordVerIn.Text)){
                Response.Write("<script LANGUAGE='JavaScript'> alert('Both passwords must be the same!')  </script>");
                return;
            }

            connectionString = ConfigurationManager.ConnectionStrings["conStr"].ToString();
            con = new SqlConnection(connectionString);
            string sqlstr;
            sqlstr = "UPDATE ONLINECUSTOMER SET Password = '"+ CustomerPasswordIn.Text + "' WHERE ONLINECUSTOMER.CustomerID = "+WebForm1.id;
            SqlCommand command = new SqlCommand(sqlstr, con);
            SqlDataAdapter adapter = new SqlDataAdapter();

            try
            {
                con.Open();
                adapter.UpdateCommand = new SqlCommand(sqlstr, con);
                adapter.UpdateCommand.ExecuteNonQuery();
                command.Dispose();
            }
            catch (SqlException ex)
            {
                Response.Write("<script LANGUAGE='JavaScript'> alert('Can not change the password!')  </script>");
            }
            finally
            {
                con.Close();
            }

            Response.Redirect("UserPage.aspx");
        }
    }
}