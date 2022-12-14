<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Datos proyecto.aspx.cs" Inherits="ProyectoR.Estudiantes.Datos_proyecto" %>

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
    <title>Datos del proyecto</title>
</head>
<body>
    <form id="form1" runat="server">

        <div class="d-flex" id="content-wrapper">
        <div id="sidebar-container" class="bg-primary">
            <div class="logo">
                <h4 class="text-light font-weight-bold mb-0">Residencias</h4>
            </div>
            <div class="menu">
                <a href="IndexE.aspx" class="d-block text-light p-3 border-0"><i class="icon ion-md-apps lead mr-2"></i>
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
            </div>
    </form>
</body>
</html>
