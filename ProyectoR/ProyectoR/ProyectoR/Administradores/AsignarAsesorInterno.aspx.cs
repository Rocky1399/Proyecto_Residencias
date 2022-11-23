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
    public partial class AsignarAsesorInterno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
            }
        }

        protected void BtnCerrar_Click(object sender, EventArgs e)
        {
            Session.Remove("Usuario");
            Session.Remove("ID");
            Response.Redirect("/Login.aspx");
        }

        protected void LlenarDropDownListAlumnos()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT ID, CONCAT(Nombre, ' ', Apellidos) AS NombreC FROM tb_alumnos";
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
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT ID, CONCAT(Nombre, ' ', Apellido_Paterno, ' ', Apellido_Materno) AS NombreAs FROM tb_asesores_internos";
                cmd.Connection = conn;
                conn.Open();
                DropDownList2.DataSource = cmd.ExecuteReader();
                DropDownList2.DataTextField = "NombreAs";
                DropDownList2.DataBind();
                DropDownList2.Items.Insert(0, new ListItem("Seleccionar asesor"));
                conn.Close();
            }
        }
    }
}