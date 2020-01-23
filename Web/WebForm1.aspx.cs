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
    public partial class WebForm1 : System.Web.UI.Page
    {
        String connectionString;
        SqlConnection con;
        public static string id = WebForm2.id;
        protected void Page_Load(object sender, EventArgs e)
        {
            connectionString = ConfigurationManager.ConnectionStrings["conStr"].ToString();
            con = new SqlConnection(connectionString);
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
         
            string sqlstr;
            sqlstr = "select ONLINECUSTOMER.Password from ONLINECUSTOMER where ONLINECUSTOMER.CustomerID = " + CustomerIdIn.Text;
            SqlCommand command = new SqlCommand(sqlstr, con);

            try
            {
                con.Open();
                SqlDataReader reader = command.ExecuteReader();
                while(reader.Read())
                {

                    if (reader["Password"].ToString().Equals(CustomerPasswordIn.Text))
                    {
                        id = CustomerIdIn.Text;
                        WebForm2.id = CustomerIdIn.Text;
                        Response.Redirect("UserPage.aspx");
                    }

                    else
                        con.Close();
                        Response.Write("<script LANGUAGE='JavaScript'> alert('Username or Password is wrong! -- Hop hemşerim nereye')  </script>");
                }
                reader.Close();
            }
            catch(SqlException ex)
            {
                Response.Write("<script LANGUAGE='JavaScript'> alert('Username or Password is wrong!')  </script>");
            }
            finally {
                con.Close();
            }
            
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}