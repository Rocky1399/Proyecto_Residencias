<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Datos.aspx.cs" Inherits="ProyectoR.Administradores.Datos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../CSS/NavBarM.css" rel="stylesheet" />
    <link href="../CSS/Anteproyecto.css" rel="stylesheet" />

    <title></title>
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
        <div>
            <asp:GridView ID="gvFiles" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="Nombre" HeaderText="Nombre del alumno" />
            <asp:BoundField DataField="Descripcion" HeaderText="Nombre del proyecto" />
            <asp:BoundField DataField="Empresa" HeaderText="Nombre de la empresa" />
            <asp:BoundField DataField="Asesor_Externo" HeaderText="Nombre del asesor externo" />
            <asp:BoundField DataField="Periodo" HeaderText="Periodo" />
            <asp:BoundField DataField="Año" HeaderText="Año" />
            <asp:BoundField DataField="Numero_de_control" HeaderText="Numero de control del alumno" />
            <asp:BoundField DataField="Asesor_Interno_RFC" HeaderText="RFC asesor interno" />
            <asp:BoundField DataField="Calificacion_Final" HeaderText="Calificacion final" />
            <asp:BoundField DataField="Revisor1" HeaderText="Revisor 1" />
            <asp:BoundField DataField="Revisor2" HeaderText="Revisor 2" />
        </Columns>
    </asp:GridView>
        </div>
    </form>
</body>
</html>
