<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Adventure_Works.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="./css/style.css"/>
    <link rel="stylesheet" href="./css/login.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login">
            <div class="login__marco">
                <img class="logo" src="./imagenes/user.png" alt="logo"/>
                <div class="login__input">
                    <img class="icono" src="./imagenes/login.png" alt="logo2"/>
                    <asp:TextBox ID="txtus" runat="server" CssClass="login__txtbox" placeholder="nombre de usuario"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Ingrese un usuario" ForeColor="White" ControlToValidate="txtus" Display="Dynamic"></asp:RequiredFieldValidator>
                <div class="login__input">
                    <img class="candado" src="./imagenes/pas.png" alt="logo3"/>
                    <asp:TextBox ID="txtpas" runat="server" TextMode="Password"  CssClass="login__txtbox" placeholder="contraseña"></asp:TextBox>    
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Ingresa la contraseña" ForeColor="White" ControlToValidate="txtpas" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:Button ID="btnSubmit" runat="server" CssClass="login__boton" Text="Iniciar sesion" OnClick="btnSubmit_Click"/>
                <asp:HyperLink ID="hreg" runat="server" CssClass="login__enlace" Font-Overline="False" Font-Underline="True" ForeColor="White" NavigateUrl="~/Registrar.aspx" ViewStateMode="Enabled">Registrarse</asp:HyperLink>
                <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="White" NavigateUrl="~/index.aspx">Seguir como Visitante</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>