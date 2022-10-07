using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoR.Estudiantes
{
    public partial class Revision1 : System.Web.UI.Page
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

            string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT COUNT(Id_alumno) AS Valor FROM tb_revision1 WHERE Id_alumno ='" + Session["ID"].ToString() + "'";
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        int valor = Convert.ToInt32(sdr["Valor"].ToString());
                        if (valor > 0)
                        {
                            FileUpload1.Visible = false;
                            btnUpload.Visible = false;
                            BtnVolver.Visible = true;
                        }
                        else
                        {
                            FileUpload1.Visible = true;
                            btnUpload.Visible = true;
                            BtnVolver.Visible = false;
                        }
                    }
                    con.Close();
                }
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
                    cmd.CommandText = "SELECT Id, Name FROM tb_revision1 WHERE Id_alumno='" + Session["ID"].ToString() + "'";
                    cmd.Connection = con;
                    con.Open();
                    gvFiles.DataSource = cmd.ExecuteReader();
                    gvFiles.DataBind();
                    con.Close();
                }
            }
        }

        protected void Upload(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                if (".pdf" == System.IO.Path.GetExtension(FileUpload1.FileName))
                {
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    string contentType = FileUpload1.PostedFile.ContentType;
                    using (Stream fs = FileUpload1.PostedFile.InputStream)
                    {
                        using (BinaryReader br = new BinaryReader(fs))
                        {
                            byte[] bytes = br.ReadBytes((Int32)fs.Length);
                            string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
                            using (SqlConnection con = new SqlConnection(constr))
                            {
                                string query = "INSERT INTO tb_revision1 (Name,ContentType,Data,Id_alumno) VALUES (@Name, @ContentType, @Data, @Id_alumno)";
                                using (SqlCommand cmd = new SqlCommand(query))
                                {
                                    cmd.Connection = con;
                                    cmd.Parameters.AddWithValue("@Name", filename);
                                    cmd.Parameters.AddWithValue("@ContentType", contentType);
                                    cmd.Parameters.AddWithValue("@Data", bytes);
                                    cmd.Parameters.AddWithValue("@Id_alumno", Session["ID"].ToString());
                                    con.Open();
                                    cmd.ExecuteNonQuery();
                                    con.Close();
                                }
                            }
                        }
                    }
                    Response.Redirect(Request.Url.AbsoluteUri);
                }
                else
                {
                    Response.Write("<script>alert('Debe ingresar un archivo PDF');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Debe ingresar un archivo PDF');</script>");
            }
        }

        protected void Reupload(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "DELETE FROM tb_revision1 WHERE id_alumno = '" + Session["ID"].ToString() + "'";
                    cmd.Connection = con;
                    con.Open();
                    gvFiles.DataSource = cmd.ExecuteReader();
                    gvFiles.DataBind();
                    con.Close();
                }
            }
            Response.Redirect(Request.Url.AbsoluteUri);
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