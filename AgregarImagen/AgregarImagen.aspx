<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarImagen.aspx.cs" Inherits="Adventure_Works.AgregarImagen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <link rel="stylesheet" href="./css/agregarFoto.css"/>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
    <script>
        function MostraPreview(input) {
            if (input.files && input.files[0]) {
                document.getElementById("fotoFalsa").style.display = "none";
                var imagenDir = new FileReader();
                imagenDir.onload = function (e) {
                    $("#imgCargarFoto").attr('src', e.target.result);
                }
                imagenDir.readAsDataURL(input.files[0]);
            }
        }
    </script>
    <form id="form1" runat="server">
        <div class="contenedor">
            <header>
                <asp:Button ID="btnInicio" CssClass="btnInicio" runat="server" Text="Inicio" BorderStyle="None" OnClick="btnInicio_Click" />
            </header>

            <div class="tarjeta">
                <div class="tarjeta__izquierda">
                    <div id="fotoFalsa" class="simulacioFoto">
                        <img src="./imagenes/iconoImagen.png" alt="Icono de Imagen" class="iconoImg" />
                    </div>
                    <asp:Image ID="imgCargarFoto" runat="server" Width="400px" CssClass="imgPreview"/>
                    <asp:FileUpload ID="FileUpload1" onchange="MostraPreview(this)" runat="server"/>
                </div>

                <div class="tarjeta__derecha">
                     <span class="titulo">Comparte tus fotos</span>
                     <asp:TextBox ID="txtTitulo"  runat ="server" placeholder="Agrega un titulo" CssClass="txt-titulo"></asp:TextBox>
                     <asp:TextBox ID="txtComentario"  runat ="server" placeholder="Agrege una descripcion" CssClass="descripcion"></asp:TextBox>
                     <asp:Button ID="btnGuardar" Onclick="btnGuardad_Click" runat="server" Text="Guardar" CssClass="btn-guardar"/>
                </div>
                
                <asp:Label ID ="lblMensaje" runat="server" Text=""></asp:Label>
                
                
            </div>
            
        </div>
    </form>

    
</body>
</html>
