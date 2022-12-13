<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IndexE.aspx.cs" Inherits="ProyectoR.Estudiantes.IndexE" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="../CSS/NavBarM.css" rel="stylesheet" />
    <link href="../CSS/IndexE.css" rel="stylesheet" />

    <title>Index</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
 <ul class="topnav">
  <li><a href="IndexE.aspx">Inicio</a></li>
  <li><a href="Proceso.aspx">Proceso de solicitud de residencias</a></li>
  <li><a href="Datos proyecto.aspx">Datos proyecto</a></li>
  <li><a href="Anteproyecto.aspx">Anteproyecto</a></li>
  <li><a href="Revision1.aspx">Revisión 1</a></li>
  <li><a href="Revision2.aspx">Revisión 2</a></li>
  <li><a href="Revision3.aspx">Revisión 3</a></li>
  <li class="right"><asp:LinkButton ID="Cerrar" OnClick="BtnCerrar_Click" runat="server">Cerrar sesión</asp:LinkButton></li>
</ul>
        </div>
<div>
    <h1 class="titulo">
            <asp:Label ID="lblBienvenida" runat="server" Text="Label"></asp:Label>
    </h1>
</div><br />
        <h2 class="instrucciones">Proceso de solicitud de residencias: Aqui podras descargar los formatos requeridos para tu proceso de solicitud de residencias</h2>
        <h2 class="instrucciones">Datos proyecto: En este apartado deberas de introducir los datos requeridos una unica vez antes de que comiences todo tu proceso de residencias</h2>
        <h2 class="instrucciones">Revision 1: Aqui subiras tu primera revision de tu informe de residencias y podras ver los comentarios de tus asesores asi como su calificacion</h2>
        <h2 class="instrucciones">Revision 2: Aqui subiras tu segunda revision de tu informe de residencias y podras ver los comentarios de tus asesores asi como su calificacion</h2>
        <h2 class="instrucciones">Revision 3: Aqui subiras tu primera revision de tu informe de residencias y podras ver los comentarios de tus asesores asi como su calificacion</h2>
    </form>
</body>
</html>
