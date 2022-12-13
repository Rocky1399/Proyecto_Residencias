<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AsignarAsesorInterno.aspx.cs" Inherits="ProyectoR.Administradores.AsignarAsesorInterno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../CSS/Anteproyecto.css" rel="stylesheet" />
    <link href="../CSS/NavBarM.css" rel="stylesheet" />
    <title>Asignar asesor interno</title>
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

        <h1 class="titulo">Asignar asesor interno</h1>
        <h4 class="subtituloproceso">Seleccione al alumno</h4>
        <asp:DropDownList class="dropdown" ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Cambio"></asp:DropDownList>
        <h4 class="subtituloproceso">Seleccione al asesor interno</h4>
        <asp:DropDownList class="dropdown" ID="DropDownList2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Cambio"></asp:DropDownList>
    <hr />
    <hr />
        <br />
        <asp:Button ID="BtnAsignar" runat="server" Text="Asignar asesor interno" class="Subir" OnClick="Asignar" />
    </form>
</body>
</html>
