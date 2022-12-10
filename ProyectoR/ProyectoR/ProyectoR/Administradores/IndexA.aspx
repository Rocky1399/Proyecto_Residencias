<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IndexA.aspx.cs" Inherits="ProyectoR.Administradires.IndexA" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../CSS/NavBarM.css" rel="stylesheet" />
    <link href="../CSS/IndexM.css" rel="stylesheet" />
    <title>Index A</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
 <ul class="topnav">
  <li><a href="IndexA.aspx">Inicio</a></li>
  <li><a href="AsignarAsesorInterno.aspx">Asignar asesor interno</a></li>
  <li><a href="AsignarRevisores.aspx">Asignar revisores</a></li>
  <li><a href="AnteproyectoA.aspx">Anteproyecto</a></li>
  <li><a href="Revision1A.aspx">Revisión 1</a></li>
  <li><a href="Revision2A.aspx">Revisión 2</a></li>
  <li><a href="Revision3A.aspx">Revisión 3</a></li>
  <li><a href="Datos.aspx">Datos de los alumnos</a></li>
  <li class="right"><asp:LinkButton ID="Cerrar" OnClick="BtnCerrar_Click" runat="server">Cerrar sesión</asp:LinkButton></li>
</ul>
        </div>
            <h1>
                <asp:Label ID="lblBienvenida" runat="server" Text="Label"></asp:Label>
            </h1>
    </form>
</body>
</html>
