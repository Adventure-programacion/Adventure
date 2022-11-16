<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Adventure_Works.index" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Adventure Works</title>
    <link rel="stylesheet" href="./css/cabecera/cabecera.css"/>
    <link rel="stylesheet" href="./css/nav/nav.css"/>
    <link rel="stylesheet" href="./css/style.css" />
    <link rel="stylesheet" href="./css/tarjeta/tarjeta.css"/>
    
    
</head>
<body>
    <form id="form1" runat="server">
        <div class="contenedor">
            <header class="cabecera">
                <h1 class="cabecera__titulo">Compartir Fotos Adventure Works</h1>
                <asp:HyperLink ID="Hplink2" runat="server" Font-Underline="True" ForeColor="Blue" NavigateUrl="~/login.aspx">Cerrar Sesion</asp:HyperLink>
                <asp:HyperLink ID="Hplink" runat="server" Font-Underline="True" ForeColor="Blue" NavigateUrl="~/login.aspx">Inicio de Sesion</asp:HyperLink>
                <br />
                <asp:Label ID="lblusuario" runat="server"></asp:Label>
            </header>
            <nav class="nav">
                <asp:Button class="nav__boton" ID="Button1" runat="server" Text="Inicio" />
                <asp:Button class="nav__boton" ID="Button2" runat="server" Text="Galeria" />
                <asp:Button class="nav__boton" ID="Button3" runat="server" Text="Agregar Foto" OnClick="Button3_Click" />
                <asp:Button class="nav__boton" ID="Button4" runat="server" Text="Presentacion" />
            </nav>
            <main class="">
                 <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <section class="tarjeta">
                                <h2 class="tarjeta__titulo">
                                    <%#DataBinder.Eval(Container.DataItem, "Title")  %>
                                </h2>
                                <h3 class="tarjeta__creador">Por:Creador</h3>
                                <img width="100" class="tarjeta__imagen" src="data:image/jpg;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem, "PhotoFile")) %>"/>
                                <span class="tarjeta__fecha">Creado en: fecha</span>
                            </section>
                        </ItemTemplate>
                </asp:Repeater>
            </main>
        </div>
    </form>
</body>
    <!--
        col-lg-6 col-md-4
        col-md-4 col-md-4
                <section class="tarjeta">
                    <h2 class="tarjeta__titulo">"Titulo"</h2>
                    <h3 class="tarjeta__creador">Por:Creador</h3>
                    <div class="tarjeta__imagen"></div>
                    <span class="tarjeta__fecha">Creado en: fecha</span>
                </section>
        <link rel="stylesheet" href="./Content/bootstrap.css"/>

        
                    
                -->
</html>
