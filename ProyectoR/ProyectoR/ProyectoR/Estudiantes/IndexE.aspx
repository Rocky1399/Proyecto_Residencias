<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IndexE.aspx.cs" Inherits="ProyectoR.Estudiantes.IndexE" %>

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

    <!-- Google fonts -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,700&display=swap" rel="stylesheet">

    <!-- Ionic icons -->
    <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
    <title>Index</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="d-flex" id="content-wrapper">
        <div id="sidebar-container" class="bg-primary">
            <div class="logo">
                <h4 class="text-light font-weight-bold mb-0">Residencias</h4>
            </div>
            <div class="menu">
                <a href="IndexM.aspx" class="d-block text-light p-3 border-0"><i class="icon ion-md-home lead mr-2"></i>
                    Inicio</a>
                <a href="Proceso.aspx" class="d-block text-light p-3 border-0"><i class="icon ion-md-document lead mr-2"></i>
                    Proceso de solicitud</a>
                <a href="Datos proyecto.aspx" class="d-block text-light p-3 border-0"><i class="icon ion-md-clipboard lead mr-2"></i>
                    Datos del proyecto</a>
                <a href="Anteproyecto.aspx" class="d-block text-light p-3 border-0"><i class="icon ion-md-filing lead mr-2"></i>
                    Anteproyecto</a>
                <a href="Revision1.aspx" class="d-block text-light p-3 border-0"> <i class="icon ion-md-book lead mr-2"></i>
                    Revision 1</a>
                <a href="Revision2.aspx" class="d-block text-light p-3 border-0"> <i class="icon ion-md-book lead mr-2"></i>
                    Revision 2</a>
                <a href="Revision3.aspx" class="d-block text-light p-3 border-0"> <i class="icon ion-md-book lead mr-2"></i>
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
    <h1 class="titulo">
            <asp:Label ID="lblBienvenida" runat="server" Text="Label"></asp:Label>
    </h1>
</div><br />

        <h2 class="instrucciones">Proceso de solicitud de residencias: Aqui podras descargar los formatos requeridos para tu proceso de solicitud de residencias</h2>
        <h2 class="instrucciones">Datos proyecto: En este apartado deberas de introducir los datos requeridos una unica vez antes de que comiences todo tu proceso de residencias</h2>
        <h2 class="instrucciones">Revision 1: Aqui subiras tu primera revision de tu informe de residencias y podras ver los comentarios de tus asesores asi como su calificacion</h2>
        <h2 class="instrucciones">Revision 2: Aqui subiras tu segunda revision de tu informe de residencias y podras ver los comentarios de tus asesores asi como su calificacion</h2>
        <h2 class="instrucciones">Revision 3: Aqui subiras tu primera revision de tu informe de residencias y podras ver los comentarios de tus asesores asi como su calificacion</h2>
    </div>
            </form>
</body>
</html>
