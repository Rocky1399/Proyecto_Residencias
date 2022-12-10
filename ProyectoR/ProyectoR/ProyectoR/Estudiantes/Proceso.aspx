<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Proceso.aspx.cs" Inherits="ProyectoR.Estudiantes.Proceso" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="../CSS/NavBarE.css" rel="stylesheet" />
<link href="../CSS/TablaProcesos.css" rel="stylesheet" />
    <title>Proceso para solicitar residencias</title>
</head>
<body>
<form id="form1" runat="server">
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
        <td><a href="../Files/Formato%20solicitud%20residencias.doc">Descargar</a></td>
      </tr>

       <tr>
        <td>Reporte evaluacion 10%</td>
        <td><a href="../Files/Reporte%20evaluacion%2010%20por%20ciento.docx">Descargar</a></td>
      </tr>

       <tr>
        <td>Reporte evaluacion 80%</td>
        <td><a href="../Files/Reporte%20evaluacion%20Anexo%2080%20por%20ciento.docx">Descargar</a></td>
      </tr>

       <tr>
           <td>Seguimiento de proyecto de residencias</td>
           <td><a href="../Files/Seguimiento%20proyecto%20residencias.doc">Descargar</a></td>
       </tr>

       <tr>
           <td>Portada oficial residencias</td>
           <td><a href="../Files/Portada%20Oficial%20de%20Residencias.docx">Descargar</a></td>
       </tr>

    </table>
   </div>
    </form>
</body>
</html>
