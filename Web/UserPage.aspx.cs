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
    public partial class UserPage : System.Web.UI.Page
    {
        
        String connectionString;
        SqlConnection con;
    
        protected void Page_Load(object sender, EventArgs e)
        {

            welcomeUpdater();
            choosen.Text = "";

            con = new SqlConnection(connectionString);
            string sqlstr;
            sqlstr = "select ORDER_T.OrderID, ITEM.ID, ITEM.ItemName, ITEM.Brand, ITEM.Price, ITEM.Condition from ITEM, ORDER_T where ORDER_T.CustomerID = " + WebForm1.id + " and ORDER_T.OrderID = ITEM.OrderID";
            SqlCommand command = new SqlCommand(sqlstr, con);

            try
            {
                con.Open();
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    choosen.Text += reader["OrderID"].ToString() + " " + reader["ID"].ToString() + " " + reader["ItemName"].ToString() + " " + reader["Brand"].ToString() + "   " + reader["Price"].ToString() + "  " + reader["Condition"].ToString() + "<br />";

                }
            }
            catch (SqlException ex)
            {
                Response.Write("<script LANGUAGE='JavaScript'> alert('Item listing error!')  </script>");
            }
            finally
            {
                con.Close();
            }

        }

        protected void NewOrderButton_Click(object sender, EventArgs e)
        {//Order page geçilmesi lazım

        }

        protected void Orders_SelectedIndexChanged(object sender, EventArgs e)
        {//sql den seçili idye sahip orderın bilgisi ekrana gelicek !connectionString = ConfigurationManager.ConnectionStrings["conStr"].ToString();
         
           

        }

        protected void welcomeUpdater()
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
                    welcome.Text = reader["Name"].ToString() + " " + reader["Surname"].ToString();
                }
            }
            catch(SqlException ex)
            {
                Response.Write("<script LANGUAGE='JavaScript'> alert('User info error!')  </script>");
            }
            finally
            {
                con.Close();
            }
        }

        protected void UpdateUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateUser.aspx");
        }
    }
}