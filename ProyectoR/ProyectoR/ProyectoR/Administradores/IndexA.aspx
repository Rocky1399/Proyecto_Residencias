<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IndexA.aspx.cs" Inherits="ProyectoR.Administradires.IndexA" %>

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
    <title>Index A</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="d-flex" id="content-wrapper">
        <div id="sidebar-container" class="bg-primary">
            <div class="logo">
                <h4 class="text-light font-weight-bold mb-0">Residencias</h4>
            </div>
            <div class="menu">
                <a href="IndexA.aspx" class="d-block text-light p-3 border-0"><i class="icon ion-md-home lead mr-2"></i>
                    Inicio</a>
                <a href="AsignarAsesorInterno.aspx" class="d-block text-light p-3 border-0"><i class="icon ion-md-person lead mr-2"></i>
                    Asignar asesor interno</a>
                <a href="AsignarRevisores.aspx" class="d-block text-light p-3 border-0"><i class="icon ion-md-people lead mr-2"></i>
                    Asignar revisores</a>
                <a href="AnteproyectoA.aspx" class="d-block text-light p-3 border-0"><i class="icon ion-md-filing lead mr-2"></i>
                    Anteproyecto</a>
                <a href="Revision1A.aspx" class="d-block text-light p-3 border-0"> <i class="icon ion-md-book lead mr-2"></i>
                    Revision 1</a>
                <a href="Revision2A.aspx" class="d-block text-light p-3 border-0"> <i class="icon ion-md-book lead mr-2"></i>
                    Revision 2</a>
                <a href="Revision3A.aspx" class="d-block text-light p-3 border-0"> <i class="icon ion-md-book lead mr-2"></i>
                    Revision 3</a>
                <a href="Datos.aspx" class="d-block text-light p-3 border-0"><i class="icon ion-md-paper lead mr-2"></i>
                    Datos de los alumnos</a>
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


            <div class="instrucciones">
                <h2 class="instrucciones">Asignar asesor interno: Aqui se le asigna un asesor a los estudiantes</h2>
                <h2 class="instrucciones">Asignar revisores: Aqui asignarle revisores a los estudiantes</h2>
                <h2 class="instrucciones">Anteproyecto: Aqui podra ver los anteproyectos de todos los alumnos</h2>
                <h2 class="instrucciones">Revision 1: Aqui podra ver la primera revisión de los residentes</h2>
                <h2 class="instrucciones">Revision 2: Aqui podra ver la segunda revisión de los residentes</h2>
                <h2 class="instrucciones">Revision 3: Aqui podra ver la tercera revisión de los residentes</h2>
                <h2 class="instrucciones">Datos : Aqui podra ver los datos de los residentes, asi como su calificacion final</h2>
            </div>

                        </div>
    </form>
</body>
</html>
