<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Proceso.aspx.cs" Inherits="Residencias.Proceso" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="../CSS/NavBarE.css" rel="stylesheet" />
<link href="../CSS/TablaProceso.css" rel="stylesheet" />
    <title>Proceso para solicitar residencias</title>
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
            <h1>Proceso de solicitud</h1> 
            <h3>Para poder solicitar las residencias deberas descargar el primer formato anexado a la tabla y llenarlo de manera correspondiente a como se pide, seguido de esto deberas entregarlo a las oficinas de vinculación para continuar el proceso</h3>
        </div>

       <div>
       <table id="tabla">
        <tr>
         <th>Documento</th>
         <th>Descargar</th>
       </tr>
       <tr>
        <td>Formato para solicitar residencias</td>
        <td><a href="Files/FORMATO%20PARA%20LA%20SOLICITUD%20DE%20RESIDENCIAS%20PROFESIONALES.doc">Descargar</a></td>
      </tr>

       <tr>
        <td>Reporte evaluacion Anexo XXIX 10</td>
        <td><a href="Files/Reporte%20evaluacion%20Anexo%20XXIX%2010.docx">Descargar</a></td>
      </tr>

       <tr>
        <td>Reporte evaluacion Anexo XXIX 80</td>
        <td><a href="Files/Reporte%20evaluacion%20Anexo%20XXIX%2080.docx">Descargar</a></td>
      </tr>

       <tr>
           <td>Seguimiento de proyecto de residencias</td>
           <td><a href="Files/SEGUIMIENTO%20DE%20PROYECTO%20DE%20RESIDENCIAS.doc">Descargar</a></td>
       </tr>

    </table>
   </div>
    </form>
</body>
</html>
