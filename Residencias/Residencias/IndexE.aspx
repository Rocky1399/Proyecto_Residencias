﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IndexE.aspx.cs" Inherits="Residencias.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="CSS/NavBarE.css" rel="stylesheet" />
    <title>Index</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
 <ul class="topnav">
  <li><a href="IndexE.aspx">Inicio</a></li>
  <li><a href="Proceso.aspx">Proceso de solicitud de residencias</a></li>
  <li><a href="Anteproyecto.aspx">Anteproyecto</a></li>
  <li class="right"><asp:LinkButton ID="Cerrar" OnClick="BtnCerrar_Click" runat="server">Cerrar sesión</asp:LinkButton></li>
</ul>
        </div>
<div>
    <h1>
            <asp:Label ID="lblBienvenida" runat="server" Text="Label"></asp:Label>
    </h1>
</div>
    </form>
</body>
</html>
