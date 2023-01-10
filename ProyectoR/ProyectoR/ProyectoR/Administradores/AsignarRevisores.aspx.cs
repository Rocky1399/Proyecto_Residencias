using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoR.Administradores
{
    public partial class AsignarRevisores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BtnAsignar.Visible = false;

            if (Session["Usuario"] != null)
            {
                string usuariologueado = Session["Usuario"].ToString();
            }
            else
            {
                Response.Redirect("/Login.aspx");
            }
            if (!IsPostBack)
            {
                LlenarDropDownListAlumnos();
                LlenarDropDownListAsesor();
                LlenarDropDownListPeriodo();
            }
        }

        protected void BtnCerrar_Click(object sender, EventArgs e)
        {
            Session.Remove("Usuario");
            Session.Remove("ID");
            Response.Redirect("/Login.aspx");
        }
        protected void LlenarDropDownListPeriodo()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString))
            {
                string a;
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT DISTINCT A.ID, CONCAT(tb_info_proyectos.Periodo, ' ', tb_info_proyectos.Año) AS Per  FROM tb_alumnos A INNER JOIN tb_info_proyectos ON A.Numero_de_control = tb_info_proyectos.Numero_de_control";
                cmd.Connection = conn;
                conn.Open();
                DropDownList4.DataSource = cmd.ExecuteReader();
                DropDownList4.DataTextField = "Per";
                DropDownList4.DataBind();
                DropDownList4.Items.Insert(0, new ListItem("Seleccionar periodo"));
                conn.Close();
            }
        }
        protected void LlenarDropDownListAlumnos()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT DISTINCT A.ID, CONCAT(A.Nombre, ' ', Apellidos) AS NombreC  FROM tb_alumnos A INNER JOIN tb_info_proyectos ON A.Numero_de_control = tb_info_proyectos.Numero_de_control";
                cmd.Connection = conn;
                conn.Open();
                DropDownList1.DataSource = cmd.ExecuteReader();
                DropDownList1.DataTextField = "NombreC";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("Seleccionar alumno"));
                conn.Close();
            }
        }
        protected void LlenarDropDownListAsesor()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString))
            {
                string a;
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT ID, CONCAT(Nombre, ' ', Apellido_Paterno, ' ', Apellido_Materno) AS NombreAs FROM tb_asesores_internos";
                cmd.Connection = conn;
                conn.Open();
                DropDownList2.DataSource = cmd.ExecuteReader();
                DropDownList2.DataTextField = "NombreAs";
                DropDownList2.DataBind();
                DropDownList2.Items.Insert(0, new ListItem("Seleccionar revisor"));
                conn.Close();
            }

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString))
            {
                string a;
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT ID, CONCAT(Nombre, ' ', Apellido_Paterno, ' ', Apellido_Materno) AS NombreAs FROM tb_asesores_internos";
                cmd.Connection = conn;
                conn.Open();
                DropDownList3.DataSource = cmd.ExecuteReader();
                DropDownList3.DataTextField = "NombreAs";
                DropDownList3.DataBind();
                DropDownList3.Items.Insert(0, new ListItem("Seleccionar revisor"));
                conn.Close();
            }
        }

        protected void Asignar(object sender, EventArgs e)
        {
            string a = "",b="";
            string c = "";
            //Sacar ID de revisor1
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT ID FROM tb_asesores_internos WHERE CONCAT(Nombre, ' ', Apellido_Paterno, ' ', Apellido_Materno) = '" + DropDownList2.SelectedValue + "'";
                cmd.Connection = conn;
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    a = reader["ID"].ToString();
                }
                else
                {

                }
                conn.Close();
            }
            //Sacar ID de revisor2
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT ID FROM tb_asesores_internos WHERE CONCAT(Nombre, ' ', Apellido_Paterno, ' ', Apellido_Materno) = '" + DropDownList3.SelectedValue + "'";
                cmd.Connection = conn;
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    b = reader["ID"].ToString();
                }
                else
                {

                }
                conn.Close();
            }
            //Sacar ID de alumno
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT ID FROM tb_alumnos WHERE CONCAT(Nombre, ' ', Apellidos) = '" + DropDownList1.SelectedValue + "'";
                cmd.Connection = conn;
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    c = reader["ID"].ToString();
                }
                else
                {

                }
                conn.Close();
            }
            //Asignacion de revisores en tb_alumnos
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "UPDATE tb_alumnos SET Revisor1 ='" + a + "',Revisor2 ='" + b + "' WHERE CONCAT(Nombre, ' ', Apellidos) = '" + DropDownList1.SelectedValue + "'";
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteReader();
                conn.Close();
            }
            //Asignacion de revisores en info_proyectos
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "UPDATE tb_info_proyectos SET Revisor1 ='" + DropDownList2.SelectedValue + "',Revisor2 ='" + DropDownList3.SelectedValue + "' WHERE ID_Alumno = '" + c + "' AND CONCAT(Periodo, ' ', Año)= '"+DropDownList4.SelectedValue+"'";
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteReader();
                conn.Close();
            }
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void Cambio(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue != "Seleccionar alumno" && DropDownList2.SelectedValue != "Seleccionar asesor" && DropDownList3.SelectedValue != "Seleccionar revisor" && DropDownList4.SelectedValue != "Seleccionar periodo")
            {
                BtnAsignar.Visible = true;
            }
            else
            {

            }
        }
    }
}