<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Revision1M.aspx.cs" Inherits="ProyectoR.Maestros.Revision1M" %>

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
    <title>Revision 1</title>
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

        <h1 class="titulo">Revision 1</h1>
        <h4 class="subtituloproceso">Seleccione el periodo que desea revisar</h4>
        <asp:DropDownList class="dropdown" ID="DropDownList2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="BindGrid"></asp:DropDownList>
        <h4 class="subtituloproceso">Seleccione al alumno</h4>
        <asp:DropDownList class="dropdown" ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="BindGrid"></asp:DropDownList>
    <hr />
    <asp:GridView class="gv" ID="gvFiles" runat="server" AutoGenerateColumns="false">
        <Columns>
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
                <br />
        <div class="cont">
    <asp:Label class="lblCalifCom" ID="lblComentario" runat="server" Text="Comentario"></asp:Label>
    <asp:TextBox ID="txtComentario" runat="server"></asp:TextBox>
    <asp:Button ID="BtnComentario" runat="server" Text="Subir Comentario" class="Subir" OnClick="SubirComentario"/>
        </div>
    <br />
        <div class="cont">
    <asp:Label class="lblCalifCom" ID="lblCalificacion" runat="server" Text="Calificacion"></asp:Label>
    <asp:TextBox ID="txtCalificacion" type="number" runat="server"></asp:TextBox>
    <asp:Button ID="BtnCalificacion" runat="server" Text="Subir Calificacion" class="Subir" OnClick="SubirCalificacion"/>
        </div>
        <br />
        <asp:Button ID="BtnLiberar" runat="server" Text="Liberar documento" OnClick="LiberarDocumento" class="Subir" />
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
                    url: "Revision1M.aspx/GetPDF",
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