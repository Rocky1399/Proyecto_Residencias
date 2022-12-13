﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Proceso.aspx.cs" Inherits="ProyectoR.Estudiantes.Proceso" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="../CSS/NavBarM.css" rel="stylesheet" />
<link href="../CSS/Anteproyecto.css" rel="stylesheet" />
<link href="../CSS/TablaProcesos.css" rel="stylesheet" />
    <title>Proceso para solicitar residencias</title>
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
            <img src="../Files/logos.jpg" />
        </div>

        <div>
            <h1 class="titulo">Proceso de solicitud</h1> <br />
            <h2 class="titulo">Para poder solicitar las residencias deberas descargar el primer formato anexado a la tabla y llenarlo de manera correspondiente a como se pide, seguido de esto deberas entregarlo a las oficinas de vinculación para continuar el proceso</h2>
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

    <h2 class="subtituloproceso">Formato para solicitar residencias: Este documento es el formato necesario para poder solicitar las residencias</h2><br />
    <h2 class="subtituloproceso">Reporte de evaluacion 10%: Este documento se debe de llenar con tus datos personales y entregarlo para su revision a tu asesor interno, es tu revision del informe de residencias completado a un 10%</h2><br />
    <h2 class="subtituloproceso">Seguimiento de proyecto de residencias: Este formato es para que tu lo llenes de tal manera que expliques los tiempos que te tomara realizar tu proyecto </h2> <br />
    <h2 class="subtituloproceso">Portada oficial residencias: este formato es la portada oficial que se debe de utilizar para hacer tu informe final de residencias</h2>

    </form>
</body>
</html>
