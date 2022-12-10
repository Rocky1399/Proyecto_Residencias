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
    public partial class Datos : System.Web.UI.Page
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
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }

        protected void BtnCerrar_Click(object sender, EventArgs e)
        {
            Session.Remove("Usuario");
            Session.Remove("ID");
            Response.Redirect("/Login.aspx");
        }

        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT Nombre, Descripcion, Empresa, Asesor_Externo, Periodo, Año, Numero_de_control, Asesor_Interno_RFC, Calificacion_Final, Revisor1, Revisor2 FROM tb_info_proyectos";
                    cmd.Connection = con;
                    con.Open();
                    gvFiles.DataSource = cmd.ExecuteReader();
                    gvFiles.DataBind();
                    con.Close();
                }
            }
        }
    }
}