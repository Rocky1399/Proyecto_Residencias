﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoR.Estudiantes
{
    public partial class Proceso : System.Web.UI.Page
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
        }

        protected void BtnCerrar_Click(object sender, EventArgs e)
        {
            Session.Remove("Usuario");
            Session.Remove("ID");
            Session.Remove("Numero_de_control");
            Response.Redirect("/Login.aspx");
        }
    }
}