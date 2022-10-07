<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProyectoR.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="CSS/Login.css" rel="stylesheet" />
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="center">
        <h1>Iniciar sesión</h1>
            <div class="txt_field">
                <asp:TextBox ID="NControltxt" runat="server" required></asp:TextBox>
                <span></span>
                <label>Número de control</label>
            </div>
            <div class="txt_field">
                <asp:TextBox ID="Pswtxt" runat="server" TextMode="Password" required></asp:TextBox>
                <span></span>
                <label>Contraseña</label>
            </div>
            <asp:Button ID="Log" runat="server" Text="Iniciar sesión" OnClick="BtnLog" />
        <div class="alert">
           <asp:Label runat="server" ID="lblError"></asp:Label>
        </div>
    </div>
    </form>
</body>
</html>