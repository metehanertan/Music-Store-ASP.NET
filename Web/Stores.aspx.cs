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
    public partial class WebForm4 : System.Web.UI.Page
    {
        String connectionString;
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            connectionString = ConfigurationManager.ConnectionStrings["conStr"].ToString();
            con = new SqlConnection(connectionString);
            string sqlstr;
            sqlstr = "SELECT STORE.StoreID,STORE.AddressID,ADDRESS.AddressID,ADDRESS.Country,ADDRESS.City,ADDRESS.StreetName,ADDRESS.BuildingName,ADDRESS.FlatNumber,ADDRESS.PostCode FROM STORE, ADDRESS WHERE STORE.AddressID = ADDRESS.AddressID; ";
            SqlCommand command = new SqlCommand(sqlstr, con);

            try
            {
                con.Open();
                SqlDataReader reader = command.ExecuteReader();
                int i = 1;
                while (reader.Read())
                {

                    Stores.Text += "    ---STORE "+ i + "---<br />" + reader["Country"].ToString() + "<br />" + reader["City"].ToString() + "<br />" + reader["StreetName"].ToString() + " Sokak<br />" + reader["BuildingName"].ToString() + " Apartmanı<br />NO: " + reader["FlatNumber"].ToString() + "<br />POSTCODE: " + reader["PostCode"].ToString() + "<br /><br />";
                    i++;
                }
            }

            catch (SqlException)
            {
                Response.Write("<script LANGUAGE='JavaScript'> alert('Listing store error!')  </script>");
            }

            finally
            {
                con.Close();
            }
        }
    }
}