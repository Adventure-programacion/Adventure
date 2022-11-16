<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registrar.aspx.cs" Inherits="Adventure_Works.registrar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="./css/registrar.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="contenedor">
            <header class="cabecera">
                <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="White" NavigateUrl="~/login.aspx">Inicio de Sesion</asp:HyperLink>
            </header>
            <h1 class="titulo">Adventure Works</h1>
            <p class="slogan">¡SUBE TUS FOTOS!, COMPARTE TUS MEJORES MOMENTOS</p>
            <div class="tarjeta"> 
                <asp:Label ID="Label1" runat="server" CssClass="label" Text="Label">Nombre:</asp:Label>
                <asp:TextBox ID="txtnom" CssClass="registrar__txtbox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Ingrese su nombre" CssClass="span" ControlToValidate="txtnom"></asp:RequiredFieldValidator>
                <asp:Label ID="Label2" runat="server" CssClass="label" Text="Label">Usuario:</asp:Label>
                <asp:TextBox ID="txtuser" CssClass="registrar__txtbox" runat="server"></asp:TextBox>
                <asp:Label ID="lblerror" runat="server" ForeColor="White"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Ingrese su usuario" CssClass="span" ControlToValidate="txtuser"></asp:RequiredFieldValidator>
                <asp:Label ID="Label3" runat="server" CssClass="label" Text="Label">Contraseña:</asp:Label>
                <asp:TextBox ID="txtpas" CssClass="registrar__txtbox" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Ingrese una contraseña" CssClass="span" ControlToValidate="txtpas"></asp:RequiredFieldValidator>
                <asp:Label ID="Label4" runat="server" CssClass="label" Text="Label">Confirmar contraseña:</asp:Label>
                <asp:TextBox ID="txtConfirmarContra" CssClass="registrar__txtbox" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Confirme su contraseña" CssClass="span" ControlToValidate="txtConfirmarContra"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpas" ControlToValidate="txtConfirmarContra" ErrorMessage="*Contraseñas no son iguales" ForeColor="White"></asp:CompareValidator>
                <asp:Button ID="Button1" runat="server" CssClass="boton" Text="Registrar" OnClick="Button1_Click" />
            </div>
        </div>
    </form>
</body>
</html>