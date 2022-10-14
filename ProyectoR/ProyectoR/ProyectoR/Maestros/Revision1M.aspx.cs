using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoR.Maestros
{
    public partial class Revision1M : System.Web.UI.Page
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
                LlenarDropDownList();
            }
        }

        protected void BtnCerrar_Click(object sender, EventArgs e)
        {
            Session.Remove("Usuario");
            Session.Remove("ID");
            Response.Redirect("/Login.aspx");
        }

        protected void BindGrid(object sender, EventArgs e)
        {
            if (DropDownList1.Text != "Seleccionar alumno")
            {
                lblCalificacion.Visible = true;
                lblComentario.Visible = true;
                txtCalificacion.Visible = true;
                txtComentario.Visible = true;
                BtnCalificacion.Visible = true;
                BtnComentario.Visible = true;

                string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "SELECT tb_revision1.Id, Name FROM tb_revision1 INNER JOIN tb_alumnos ON tb_revision1.Id_alumno = tb_alumnos.ID WHERE ID_AsesorInterno = " + Session["ID"].ToString() + " AND  CONCAT(Nombre, ' ', Apellidos)  = '" + DropDownList1.SelectedValue + "'";
                        cmd.Connection = con;
                        con.Open();
                        gvFiles.DataSource = cmd.ExecuteReader();
                        gvFiles.DataBind();
                        con.Close();
                    }
                }
            }

            else
            {
                lblCalificacion.Visible = false;
                lblComentario.Visible = false;
                txtCalificacion.Visible = false;
                txtComentario.Visible = false;
                BtnCalificacion.Visible = false;
                BtnComentario.Visible = false;
            }
        }

        protected void LlenarDropDownList()
        {
            using (SqlConnection conn =  new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT CONCAT(Nombre, ' ', Apellidos) AS NombreC FROM tb_alumnos WHERE ID_AsesorInterno = " + Session["ID"].ToString();
                cmd.Connection = conn;
                conn.Open();
                DropDownList1.DataSource = cmd.ExecuteReader();
                DropDownList1.DataTextField = "NombreC" ;
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("Seleccionar alumno"));
                conn.Close();
            }
        }

        protected void SubirComentario(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "UPDATE tb_revision1 SET Comentarios = '" + txtComentario.Text + "' FROM tb_revision1 r INNER JOIN tb_alumnos ON r.Id_alumno = tb_alumnos.ID WHERE ID_AsesorInterno= " + Session["ID"].ToString();
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteReader();
                conn.Close();
            }
        }

        [System.Web.Services.WebMethod]
        public static object GetPDF(int fileId)
        {
            byte[] bytes;
            string fileName, contentType;
            string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT Name, Data, ContentType FROM tb_revision1 WHERE Id = @Id";
                    cmd.Parameters.AddWithValue("@Id", fileId);
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        bytes = (byte[])sdr["Data"];
                        contentType = sdr["ContentType"].ToString();
                        fileName = sdr["Name"].ToString();
                    }
                    con.Close();
                }
            }

            return new { FileName = fileName, ContentType = contentType, Data = bytes };
        }

    }
}
