using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoR.Maestros
{
    public partial class RevisorR1 : System.Web.UI.Page
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

        protected void LlenarDropDownList()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT ID, CONCAT(Nombre, ' ', Apellidos) AS NombreC FROM tb_alumnos WHERE revisor1 = '" + Session["ID"].ToString() + "' OR Revisor2 = '" + Session["ID"].ToString() + "'";
                cmd.Connection = conn;
                conn.Open();
                DropDownList1.DataSource = cmd.ExecuteReader();
                DropDownList1.DataTextField = "NombreC";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("Seleccionar alumno"));
                conn.Close();
            }
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT DISTINCT CONCAT(Periodo, ' ', Año) AS Periodo FROM tb_alumnos WHERE revisor1 = '" + Session["ID"].ToString() + "' OR Revisor2 = '" + Session["ID"].ToString() + "'";
                cmd.Connection = conn;
                conn.Open();
                DropDownList2.DataSource = cmd.ExecuteReader();
                DropDownList2.DataTextField = "Periodo";
                DropDownList2.DataBind();
                DropDownList2.Items.Insert(0, new ListItem("Seleccionar periodo"));
                conn.Close();
            }
        }

        protected void BindGrid(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue !="Seleccionar alumno" && DropDownList2.SelectedValue!= "Seleccionar periodo")
            {
                string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "SELECT tb_revision1.Id, Name, tb_alumnos.Nombre, tb_alumnos.Apellidos FROM tb_revision1 INNER JOIN tb_alumnos ON tb_revision1.Id_alumno = tb_alumnos.ID WHERE tb_alumnos.Revisor1 = '" + Session["ID"].ToString() + "' OR tb_alumnos.Revisor2 = '" + Session["ID"].ToString() + "'";
                        cmd.Connection = con;
                        con.Open();
                        gvFiles.DataSource = cmd.ExecuteReader();
                        gvFiles.DataBind();
                        con.Close();
                    }
                }
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