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
    public partial class Register : System.Web.UI.Page
    {
        String connectionString;
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm1.aspx");
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            connectionString = ConfigurationManager.ConnectionStrings["conStr"].ToString();
            con = new SqlConnection(connectionString);
            string sqlstr;
            sqlstr = "INSERT INTO ONLINECUSTOMER VALUES('" + Name.Text + "','" + 
                Surname.Text + "','" + CustomerEmailIn.Text + "','" + Phone.Text +
                "', 1, '" + CustomerIdIn.Text + "','" + CustomerPasswordIn.Text + "')";
            SqlCommand command = new SqlCommand(sqlstr, con);
            SqlDataAdapter adapter = new SqlDataAdapter();

            try
            {
                con.Open();
                adapter.InsertCommand = new SqlCommand(sqlstr, con);
                adapter.InsertCommand.ExecuteNonQuery();

                command.Dispose();

                //////////////////////////////////////////
                //////////////// Add User ////////////////
                ///////////////////////////////////////////

            }

            catch (SqlException)
            {
                Response.Write("<script LANGUAGE='JavaScript'> alert('Insertion Error!')  </script>");
            }

            finally
            {
                con.Close();
            }

            Response.Redirect("WebForm1.aspx");
        }

    }
}