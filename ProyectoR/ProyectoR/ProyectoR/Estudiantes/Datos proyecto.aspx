<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Datos proyecto.aspx.cs" Inherits="ProyectoR.Estudiantes.Datos_proyecto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../CSS/NavBarM.css" rel="stylesheet" />
    <link href="../CSS/Anteproyecto.css" rel="stylesheet" />
    <title>Datos proyecto</title>
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
            <h1 class="titulo">Introduce los datos solicitados</h1>
            <h2 class="titulo">Asegurate de introducir bien los datos ya que no podras cambiarlos despues</h2>
            <asp:Label ID="lblNombre" runat="server" Text="Nombre del proyecto:" class="texto"></asp:Label><br />
            <asp:TextBox ID="txtNombre" runat="server" required class="texto"></asp:TextBox><br />

            <asp:Label ID="lblDescripcion" runat="server" Text="Descripcion del proyecto:" class="texto"></asp:Label><br />
            <asp:TextBox ID="txtDescripcion" runat="server" required class="texto"></asp:TextBox> <br />

            <asp:Label ID="lblEmpresa" runat="server" Text="Empresa donde se realizara el proyecto:" class="texto"></asp:Label><br />
            <asp:TextBox ID="txtEmpresa" runat="server" required class="texto"></asp:TextBox><br />

            <asp:Label ID="lblAsesor" runat="server" Text="Nombre de asesor externo:" class="texto"></asp:Label><br />
            <asp:TextBox ID="txtAsesor" runat="server" required class="texto"></asp:TextBox><br /><br />

            <asp:Button ID="Button1" runat="server" Text="Guardar datos" class="Subir" OnClick="CrearDatos"/>
        </div>
    </form>
</body>
</html>
