<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Proceso.aspx.cs" Inherits="ProyectoR.Estudiantes.Proceso" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Styles -->
    <link href="../CSS/Style.css" rel="stylesheet" />
    <link href="../CSS/NavBarM.css" rel="stylesheet" />
    <link href="../CSS/Anteproyecto.css" rel="stylesheet" />
    <link href="../CSS/TablaProcesos.css" rel="stylesheet" />
    <!-- Google fonts -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,700&display=swap" rel="stylesheet">

    <!-- Ionic icons -->
    <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
    <title>Proceso</title>
</head>
<body>
<form id="form1" runat="server">
        <div class="d-flex" id="content-wrapper">
        <div id="sidebar-container" class="bg-primary">
            <div class="logo">
                <h4 class="text-light font-weight-bold mb-0">Residencias</h4>
            </div>
            <div class="menu">
                <a href="IndexE.aspx" class="d-block text-light p-3 border-0"><i class="icon ion-md-home lead mr-2"></i>
                    Inicio</a>
                <a href="Proceso.aspx" class="d-block text-light p-3 border-0"><i class="icon ion-md-people lead mr-2"></i>
                    Proceso de solicitud</a>
                <a href="Datos proyecto.aspx" class="d-block text-light p-3 border-0"><i class="icon ion-md-stats lead mr-2"></i>
                    Datos del proyecto</a>
                <a href="Anteproyecto.aspx" class="d-block text-light p-3 border-0"><i class="icon ion-md-person lead mr-2"></i>
                    Anteproyecto</a>
                <a href="Revision1.aspx" class="d-block text-light p-3 border-0"> <i class="icon ion-md-settings lead mr-2"></i>
                    Revision 1</a>
                <a href="Revision2.aspx" class="d-block text-light p-3 border-0"> <i class="icon ion-md-settings lead mr-2"></i>
                    Revision 2</a>
                <a href="Revision3.aspx" class="d-block text-light p-3 border-0"> <i class="icon ion-md-settings lead mr-2"></i>
                    Revision 3</a>
                <a href="../Login.aspx" class="d-block text-light p-3 border-0"> <i class="icon ion-md-log-out lead mr-2"></i>
                    Cerrar sesion</a>
            </div>
        </div>
        </div>

    <div class="main">

        <div>
            <img src="../Files/logos.jpg" />
        </div>

        <div>
            <h1 class="titulo">Proceso de solicitud</h1> <br />
            <h5 class="subtituloproceso">Para poder solicitar las residencias deberas descargar el primer formato anexado a la tabla y llenarlo de manera correspondiente a como se pide, seguido de esto deberas entregarlo a las oficinas de vinculación para continuar el proceso</h5>
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

    <h5 class="subtituloproceso">Formato para solicitar residencias: Este documento es el formato necesario para poder solicitar las residencias</h5><br />
    <h5 class="subtituloproceso">Reporte de evaluacion 10%: Este documento se debe de llenar con tus datos personales y entregarlo para su revision a tu asesor interno, es tu revision del informe de residencias completado a un 10%</h5><br />
    <h5 class="subtituloproceso">Seguimiento de proyecto de residencias: Este formato es para que tu lo llenes de tal manera que expliques los tiempos que te tomara realizar tu proyecto </h5> <br />
    <h5 class="subtituloproceso">Portada oficial residencias: este formato es la portada oficial que se debe de utilizar para hacer tu informe final de residencias</h5>

        </div>
    </form>
</body>
</html>
