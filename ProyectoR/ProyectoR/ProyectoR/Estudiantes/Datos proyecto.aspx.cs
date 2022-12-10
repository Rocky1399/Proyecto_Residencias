using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoR.Estudiantes
{
    public partial class Datos_proyecto : System.Web.UI.Page
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
                VerificarSiExiste();
            }
        }

        protected void BtnCerrar_Click(object sender, EventArgs e)
        {
            Session.Remove("Usuario");
            Session.Remove("ID");
            Session.Remove("Numero_de_control");
            Response.Redirect("/Login.aspx");
        }

        protected void CrearDatos(object sender, EventArgs e)
        {
            int mes = 0;
            string periodo = "";
            string año = "";
            DateTime mess = DateTime.Now;
            DateTime añoo = DateTime.Now;
            mes = mess.Month;
            año = añoo.Year.ToString();
            if (mes > 7)
            {
                periodo = "Agosto/Diciembre";
            }
            else if (mes <= 6)
            {
                periodo = "Enero/Junio";
            }
            string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "INSERT INTO tb_info_proyectos(Nombre,Descripcion,Empresa,Periodo,Año,Numero_de_control,Asesor_Externo,ID_Alumno) VALUES ('"+txtNombre.Text+"', '"+txtDescripcion.Text+"', '"+txtEmpresa.Text+"', '"+periodo+"', '"+año+"', '" + Session["Numero_de_control"].ToString()+"', '"+txtAsesor.Text+"', '" + Session["ID"]+ "')";
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void VerificarSiExiste()
        {
            int mes = 0;
            string periodo = "";
            string año = "";
            DateTime mess = DateTime.Now;
            DateTime añoo = DateTime.Now;
            mes = mess.Month;
            año = añoo.Year.ToString();
            if (mes > 7)
            {
                periodo = "Agosto/Diciembre";
            }
            else if (mes <= 6)
            {
                periodo = "Enero/Junio";
            }
            string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT * FROM tb_info_proyectos WHERE Numero_de_control = '" + Session["Numero_de_control"] + "' AND Periodo = '" + periodo + "' AND Año = '" + año +"'";
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        Response.Write("<script>alert('Ya has ingresado tus datos, vuelve al inicio');</script>");
                        Button1.Visible = false;
                    }
                    else
                    {

                    }
                    con.Close();
                }
            }
        }
    }
}
