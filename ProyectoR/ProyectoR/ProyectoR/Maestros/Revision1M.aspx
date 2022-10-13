<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Revision1M.aspx.cs" Inherits="ProyectoR.Maestros.Revision1M" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../CSS/Anteproyecto.css" rel="stylesheet" />
    <link href="../CSS/NavBarM.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
 <ul class="topnav">
  <li><a href="IndexM.aspx">Inicio</a></li>
  <li><a href="AnteproyectoM.aspx">Anteproyecto</a></li>
  <li><a href="Revision1M.aspx">Revisión 1</a></li>
  <li><a href="Revision2M.aspx">Revisión 2</a></li>
  <li><a href="Revision3M.aspx">Revisión 3</a></li>
  <li class="right"><asp:LinkButton ID="Cerrar" OnClick="BtnCerrar_Click" runat="server">Cerrar sesión</asp:LinkButton></li>
</ul>
        </div>


        <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>

    </form>
</body>
</html>
