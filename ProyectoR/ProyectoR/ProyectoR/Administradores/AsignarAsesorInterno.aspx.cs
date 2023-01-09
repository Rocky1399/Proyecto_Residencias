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
                cmd.CommandText = "SELECT A.ID, CONCAT(A.Nombre, ' ', Apellidos) AS NombreC FROM tb_alumnos A INNER JOIN tb_info_proyectos ON A.Numero_de_control = tb_info_proyectos.Numero_de_control";
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
                DropDownList2.Items.Insert(0, new ListItem("Seleccionar asesor"));
                conn.Close();
            }
        }

        protected void Asignar(object sender, EventArgs e)
        {
            string a = "", rfc="";
            string b = "";
            int mes = 0;
            string periodo = "";
            string año = "";
            DateTime mess = DateTime.Now;
            DateTime añoo = DateTime.Now;
            mes = mess.Month;
            año = añoo.Year.ToString();
            if (mes>7)
            {
                periodo = "Agosto/Diciembre";
            }
            else if (mes <= 6)
            {
                periodo = "Enero/Junio";
            }
            //Agarrar ID y RFC del maestro seleccionado
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT ID,RFC FROM tb_asesores_internos WHERE CONCAT(Nombre, ' ', Apellido_Paterno, ' ', Apellido_Materno) = '" + DropDownList2.SelectedValue + "'";
                cmd.Connection = conn;
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    a = reader["ID"].ToString();
                    rfc = reader["RFC"].ToString();
                }
                else
                {

                }
                conn.Close();
            }
            //Agarrar ID del alumno seleccionado
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT ID FROM tb_alumnos WHERE CONCAT(Nombre, ' ', Apellidos) = '" + DropDownList1.SelectedValue + "'";
                cmd.Connection = conn;
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    b=reader["ID"].ToString();
                }
                else
                {

                }
                conn.Close();
            }
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "UPDATE tb_alumnos SET ID_AsesorInterno ='" + a + "', Periodo = '" + periodo + "',Año ='" + año +"'WHERE CONCAT(Nombre, ' ', Apellidos)= '" +DropDownList1.SelectedValue+"'";
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteReader();
                conn.Close();
            }

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "UPDATE tb_info_proyectos SET Asesor_Interno_RFC ='" +rfc+ "'WHERE ID_Alumno = '"+b+"'";
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteReader();
                conn.Close();
            }
            Response.Redirect(Request.Url.AbsoluteUri);
         }
            
            

        protected void Cambio(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue != "Seleccionar alumno" && DropDownList2.SelectedValue != "Seleccionar asesor")
            {
                BtnAsignar.Visible = true;
            }
            else
            {
                
            }
        }
    }
}