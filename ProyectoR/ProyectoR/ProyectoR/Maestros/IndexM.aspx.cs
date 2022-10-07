using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoR.Maestros
{
    public partial class IndexM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                string usuariologueado = Session["Usuario"].ToString();
                lblBienvenida.Text = "Bienvenido/a maestro" + usuariologueado;
            }
            else
            {
                Response.Redirect("/Login.aspx");
            }
        }
    }
}