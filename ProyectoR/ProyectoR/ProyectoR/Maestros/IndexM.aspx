<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IndexM.aspx.cs" Inherits="ProyectoR.Maestros.IndexM" %>

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
    <title>Inicio</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

        <div class="d-flex" id="content-wrapper">
        <div id="sidebar-container" class="bg-primary">
            <div class="logo">
                <h4 class="text-light font-weight-bold mb-0">Residencias</h4>
            </div>
            <div class="menu">
                <a href="IndexM.aspx" class="d-block text-light p-3 border-0"><i class="icon ion-md-home lead mr-2"></i>
                    Inicio</a>
                <a href="AnteproyectoM.aspx" class="d-block text-light p-3 border-0"><i class="icon ion-md-filing lead mr-2"></i>
                    Anteproyecto</a>
                <a href="Revision1M.aspx" class="d-block text-light p-3 border-0"> <i class="icon ion-md-book lead mr-2"></i>
                    Revision 1</a>
                <a href="Revision2M.aspx" class="d-block text-light p-3 border-0"> <i class="icon ion-md-book lead mr-2"></i>
                    Revision 2</a>
                <a href="Revision3M.aspx" class="d-block text-light p-3 border-0"> <i class="icon ion-md-book lead mr-2"></i>
                    Revision 3</a>
                <a href="RevisorR1.aspx" class="d-block text-light p-3 border-0"> <i class="icon ion-md-book lead mr-2"></i>
                    Revisor 1</a>
                <a href="RevisorR2.aspx" class="d-block text-light p-3 border-0"> <i class="icon ion-md-book lead mr-2"></i>
                    Revisor 2</a>
                <a href="RevisorR3.aspx" class="d-block text-light p-3 border-0"> <i class="icon ion-md-book lead mr-2"></i>
                    Revisor 3</a>
                <a href="../Login.aspx" class="d-block text-light p-3 border-0"> <i class="icon ion-md-log-out lead mr-2"></i>
                    Cerrar sesion</a>
            </div>
        </div>
        </div>

                    <div class="main">

        <div>
            <img src="../Files/logos.jpg" />
        </div>

            <h1 class="titulo">
                <asp:Label ID="lblBienvenida" runat="server" Text="Label"></asp:Label>
            </h1>

            <div>
                <label class="cont-instrucciones"><h5 class="bol"><i class="icon ion-md-filing lead mr-2"></i>Anteproyecto:</h5> Aqui podra ver los anteproyectos de los alumnos asignados</label>
                <label class="cont-instrucciones"><h5 class="bol"><i class="icon ion-md-book lead mr-2"></i>Revision 1:</h5> Aqui podra ver la primera revisión de sus residentes, ademas de poder calificar y comentar cada uno de los documentos</label>
                <label class="cont-instrucciones"><h5 class="bol"><i class="icon ion-md-book lead mr-2"></i>Revision 2:</h5> Aqui podra ver la segunda revisión de sus residentes, ademas de poder calificar y comentar cada uno de los documentos</label>
                <label class="cont-instrucciones"><h5 class="bol"><i class="icon ion-md-book lead mr-2"></i>Revision 3:</h5> Aqui podra ver la tercera revisión de sus residentes, ademas de poder calificar y comentar cada uno de los documentos</label>
                <label class="cont-instrucciones"><h5 class="bol"><i class="icon ion-md-book lead mr-2"></i>Revisor r1:</h5> Aqui podra ver la primera revisión de sus residentes asignados como revisor</label>
                <label class="cont-instrucciones"><h5 class="bol"><i class="icon ion-md-book lead mr-2"></i>Revisor r2:</h5> Aqui podra ver la segunda revisión de sus residentes asignados como revisor</label>
                <label class="cont-instrucciones"><h5 class="bol"><i class="icon ion-md-book lead mr-2"></i>Revisor r3:</h5> Aqui podra ver la tercera revisión de sus residentes asignados como revisor</label>
            </div>

        </div>

            </div>
    </form>
</body>
</html>
