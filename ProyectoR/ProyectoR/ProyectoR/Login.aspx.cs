using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoR
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnLog(object sender, EventArgs e)
        {
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            SqlConnection sqlConectar = new SqlConnection(conectar);
            SqlCommand cmd = new SqlCommand("Select ID, Nombre, Numero_de_control, Psw from tb_alumnos WHERE Numero_de_control= '" + NControltxt.Text + "'AND Psw= '" + Pswtxt.Text + "'", sqlConectar);
            cmd.Connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                Session["Usuario"] = reader["Nombre"].ToString();
                Session["ID"] = reader["ID"].ToString();
                Response.Redirect("Estudiantes/IndexE.aspx");
            }
            else
            {
                lblError.Text = "Error de usuario o contraseña";
            }
            cmd.Connection.Close();
        }
    }
}