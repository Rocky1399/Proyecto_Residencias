<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Revision3.aspx.cs" Inherits="ProyectoR.Estudiantes.Revision3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../CSS/NavBarE.css" rel="stylesheet" />
    <title>Revision 3</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                    <div>
 <ul class="topnav">
  <li><a href="IndexE.aspx">Inicio</a></li>
  <li><a href="Proceso.aspx">Proceso de solicitud de residencias</a></li>
  <li><a href="Anteproyecto.aspx">Anteproyecto</a></li>
  <li><a href="Revision1.aspx">Revisión 1</a></li>
  <li><a href="Revision2.aspx">Revisión 2</a></li>
  <li><a href="Revision3.aspx">Revisión 3</a></li>
  <li class="right"><asp:LinkButton ID="Cerrar" OnClick="BtnCerrar_Click" runat="server">Cerrar sesión</asp:LinkButton></li>
</ul>
        </div>
            <div>
                <h1>Sube tu documento PDF para tu tercera revisión</h1>
            </div>
        </div>
    </form>
</body>
</html>
