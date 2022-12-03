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
            Session.Remove("Usuario");
            Session.Remove("ID");
        }
        protected void BtnLog(object sender, EventArgs e)

        {   //Conectarse como alumno
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            SqlConnection sqlConectar = new SqlConnection(conectar);
            SqlCommand cmd = new SqlCommand("SELECT ID, Nombre, Numero_de_control, Psw FROM tb_alumnos WHERE Numero_de_control= '" + NControltxt.Text + "'AND Psw = '" + Pswtxt.Text + "'", sqlConectar);
            cmd.Connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                Session["Usuario"] = reader["Nombre"].ToString();
                Session["ID"] = reader["ID"].ToString();
                Response.Redirect("Estudiantes/IndexE.aspx");
            }
            cmd.Connection.Close();

            //Conectarse como maestro(asesor interno)
            SqlCommand cmdma = new SqlCommand("SELECT ID, RFC, Nombre, Apellido_Paterno, Apellido_Materno, Psw, Rol FROM tb_asesores_internos WHERE RFC = '" + NControltxt.Text + "' AND Psw = '" + Pswtxt.Text + "' AND Rol = 'maestro'", sqlConectar);
            cmdma.Connection.Open();
            SqlDataReader readerM = cmdma.ExecuteReader();
            if (readerM.Read())
            {
                Session["Usuario"] = readerM["Nombre"].ToString();
                Session["ID"] = readerM["ID"].ToString();
                Response.Redirect("Maestros/IndexM.aspx");
            }
            cmdma.Connection.Close();

            //Conectarse como administrador
            SqlCommand cmda = new SqlCommand("SELECT ID, RFC, Nombre, Apellido_Paterno, Apellido_Materno, Psw, Rol FROM tb_asesores_internos WHERE RFC = '" + NControltxt.Text + "' AND Psw = '" + Pswtxt.Text + "' AND Rol = 'admin'", sqlConectar);
            cmda.Connection.Open();
            SqlDataReader readerA = cmda.ExecuteReader();
            if (readerA.Read())
            {
                Session["Usuario"] = readerA["Nombre"].ToString();
                Session["ID"] = readerA["ID"].ToString();
                Response.Redirect("Administradores/IndexA.aspx");
            }

            else
            {
                lblError.Text = "Error de usuario o contraseña";
            }
            cmda.Connection.Close();
        }
    }
}