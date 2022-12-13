<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IndexM.aspx.cs" Inherits="ProyectoR.Maestros.IndexM" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../CSS/NavBarM.css" rel="stylesheet" />
    <link href="../CSS/IndexM.css" rel="stylesheet" />
    <title>Index M</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

        <div>
 <ul class="topnav">
  <li><a href="IndexM.aspx">Inicio</a></li>
  <li><a href="AnteproyectoM.aspx">Anteproyecto</a></li>
  <li><a href="Revision1M.aspx">Revisión 1</a></li>
  <li><a href="Revision2M.aspx">Revisión 2</a></li>
  <li><a href="Revision3M.aspx">Revisión 3</a></li>
  <li><a href="RevisorR1.aspx">Revisor r1</a></li>
  <li><a href="RevisorR2.aspx">Revisor r2</a></li>
  <li><a href="RevisorR3.aspx">Revisor r3</a></li>
  <li class="right"><asp:LinkButton ID="Cerrar" OnClick="BtnCerrar_Click" runat="server">Cerrar sesión</asp:LinkButton></li>
</ul>
        </div>

        <div>
            <img src="../Files/logos.jpg" />
        </div>

            <h1 class="titulo">
                <asp:Label ID="lblBienvenida" runat="server" Text="Label"></asp:Label>
            </h1>

            <div class="instrucciones">
                <h2>Anteproyecto: Aqui podra ver los anteproyectos de los alumnos asignados</h2>
                <h2>Revision 1: Aqui podra ver la primera revisión de sus residentes, ademas de poder calificar y comentar cada uno de los documentos</h2>
                <h2>Revision 2: Aqui podra ver la segunda revisión de sus residentes, ademas de poder calificar y comentar cada uno de los documentos</h2>
                <h2>Revision 3: Aqui podra ver la tercera revisión de sus residentes, ademas de poder calificar y comentar cada uno de los documentos</h2>
                <h2>Revisor r1: Aqui podra ver la primera revisión de sus residentes asignados como revisor</h2>
                <h2>Revisor r2: Aqui podra ver la segunda revisión de sus residentes asignados como revisor</h2>
                <h2>Revisor r3: Aqui podra ver la tercera revisión de sus residentes asignados como revisor</h2>
            </div>

        </div>
    </form>
</body>
</html>
