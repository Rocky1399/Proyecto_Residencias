﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoR.Administradores
{
    public partial class Revision2A : System.Web.UI.Page
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
            if (DropDownList1.SelectedValue != "Seleccionar alumno")
            {
                BtnLiberar.Visible = true;
            }
            else
            {
                BtnLiberar.Visible = false;
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
                string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "SELECT tb_revision2.Id, Name, Id_alumno FROM tb_revision2 INNER JOIN tb_alumnos ON tb_revision2.Id_alumno = tb_alumnos.ID WHERE CONCAT(Nombre, ' ', Apellidos)  = '" + DropDownList1.SelectedValue + "'";
                        cmd.Connection = con;
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        gvFiles.DataSource = reader;
                        gvFiles.DataBind();
                        con.Close();
                        BtnLiberar.Visible = true;

                        if (gvFiles == null || gvFiles.Rows.Count == 0)
                        {
                            BtnLiberar.Visible = false;
                        }
                    }
                }

                using (SqlConnection con = new SqlConnection(constr))
                {
                    string dato;
                    using (SqlCommand cmdB = new SqlCommand())
                    {
                        cmdB.CommandText = "SELECT Liberado FROM tb_revision2 INNER JOIN tb_alumnos ON tb_revision2.Id_alumno = tb_alumnos.ID WHERE CONCAT(Nombre, ' ', Apellidos)  = '" + DropDownList1.SelectedValue + "'";
                        cmdB.Connection = con;
                        con.Open();
                        SqlDataReader readerB = cmdB.ExecuteReader();

                        if (readerB.Read())
                        {
                            dato = readerB["Liberado"].ToString();
                            if (dato == "Liberado")
                            {
                                BtnLiberar.Visible = false;
                            }
                            else
                            {
                                BtnLiberar.Visible = true;
                            }
                        }
                        con.Close();
                    }
                }
            }

            else
            {
                gvFiles.DataSource = null;
                gvFiles.DataBind();
                BtnLiberar.Visible = false;
            }
        }

        protected void LlenarDropDownList()
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

        protected void LiberarDocumento(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "UPDATE tb_revision2 SET Liberado = 'Liberado' FROM tb_revision2 r INNER JOIN tb_alumnos ON r.Id_alumno = tb_alumnos.ID WHERE CONCAT(Nombre, ' ', Apellidos) = '" + DropDownList1.SelectedValue + "'";
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
                    cmd.CommandText = "SELECT Name, Data, ContentType FROM tb_revision2 WHERE Id = @Id";
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