<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnteproyectoA.aspx.cs" Inherits="ProyectoR.Administradores.AnteproyectoA" %>

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
        <title>Anteproyectos</title>
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

    <h1 class="titulo">Seleccione el anteproyecto que desee ver</h1>
    <asp:GridView class="gv" ID="gvFiles" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="Nombre" HeaderText="Nombre del alumno" />
            <asp:BoundField DataField="Apellidos" HeaderText="Apellidos del alumno" />
            <asp:BoundField DataField="Name" HeaderText="Nombre del archivo" />
            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <a class="view" href="javascript:;" rel='<%# Eval("Id") %>'>Ver PDF</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <hr />
    <div id="pdf_container">
    </div>

                        </div>
    </form>

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.6.347/pdf.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.6.347/pdf_viewer.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function () {
            $("[id*=gvFiles] .view").click(function () {
                var fileId = $(this).attr("rel");
                $.ajax({
                    type: "POST",
                    url: "AnteproyectoA.aspx/GetPDF",
                    data: "{fileId: " + fileId + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        LoadPdfFromBlob(r.d.Data);
                    }
                });
            });
        });

        var pdfjsLib = window['pdfjs-dist/build/pdf'];
        pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.6.347/pdf.worker.min.js';
        var pdfDoc = null;
        var scale = 1; //Set Scale for zooming PDF.
        var resolution = 1; //Set Resolution to Adjust PDF clarity.

        function LoadPdfFromBlob(blob) {
            //Read PDF from BLOB.
            pdfjsLib.getDocument({ data: blob }).promise.then(function (pdfDoc_) {
                pdfDoc = pdfDoc_;

                //Reference the Container DIV.
                var pdf_container = document.getElementById("pdf_container");
                pdf_container.innerHTML = "";
                pdf_container.style.display = "block";

                //Loop and render all pages.
                for (var i = 1; i <= pdfDoc.numPages; i++) {
                    RenderPage(pdf_container, i);
                }
            });
        };
        function RenderPage(pdf_container, num) {
            pdfDoc.getPage(num).then(function (page) {
                //Create Canvas element and append to the Container DIV.
                var canvas = document.createElement('canvas');
                canvas.id = 'pdf-' + num;
                ctx = canvas.getContext('2d');
                pdf_container.appendChild(canvas);

                //Create and add empty DIV to add SPACE between pages.
                var spacer = document.createElement("div");
                spacer.style.height = "20px";
                pdf_container.appendChild(spacer);

                //Set the Canvas dimensions using ViewPort and Scale.
                var viewport = page.getViewport({ scale: scale });
                canvas.height = resolution * viewport.height;
                canvas.width = resolution * viewport.width;

                //Render the PDF page.
                var renderContext = {
                    canvasContext: ctx,
                    viewport: viewport,
                    transform: [resolution, 0, 0, resolution, 0, 0]
                };

                page.render(renderContext);
            });
        };
    </script>
</body>
</html>
