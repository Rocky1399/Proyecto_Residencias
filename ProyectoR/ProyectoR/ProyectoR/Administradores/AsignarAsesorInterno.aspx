<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AsignarAsesorInterno.aspx.cs" Inherits="ProyectoR.Administradores.AsignarAsesorInterno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../CSS/Anteproyecto.css" rel="stylesheet" />
    <link href="../CSS/NavBarM.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
 <ul class="topnav">
  <li><a href="IndexA.aspx">Inicio</a></li>
  <li><a href="AsignarAsesorInterno.aspx">Asignar asesor interno</a></li>
  <li><a href="AnteproyectoA.aspx">Anteproyecto</a></li>
  <li><a href="Revision1A.aspx">Revisión 1</a></li>
  <li><a href="Revision2A.aspx">Revisión 2</a></li>
  <li><a href="Revision3A.aspx">Revisión 3</a></li>
  <li class="right"><asp:LinkButton ID="Cerrar" OnClick="BtnCerrar_Click" runat="server">Cerrar sesión</asp:LinkButton></li>
</ul>
        </div>

        <h1>Asignar asesor interno</h1>
        <h4>Seleccione al alumno</h4>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true"></asp:DropDownList>
        <h4>Seleccione al asesor interno</h4>
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true"></asp:DropDownList>
    <hr />
    <asp:GridView ID="gvFiles" runat="server" AutoGenerateColumns="false">
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
        <asp:Button ID="BtnAsignar" runat="server" Text="Asignar asesor interno" class="Subir" />
    </form>
</body>
</html>
