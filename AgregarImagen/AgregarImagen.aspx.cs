using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;




namespace Adventure_Works
{
    public partial class AgregarImagen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
   
        }
        Coneccion con = new Coneccion();
        protected void btnGuardad_Click(object sender, EventArgs e)
        {
            //Datos de la imagen
            /*
            int tamanoImg = FileUpload1.PostedFile.ContentLength; //Tamaño de la imagen
            byte[] imagenOriginal = new byte[tamanoImg];
            FileUpload1.PostedFile.InputStream.Read(imagenOriginal, 0,tamanoImg);
            Bitmap imagenOriginalBinaria = new Bitmap(FileUpload1.PostedFile.InputStream);
            string imagenDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(imagenOriginal);

            System.Drawing.Image imtThumbnail;
            int tamanioThumbail = 200;
            imtThumbnail = RedimencionarImagen(imagenOriginalBinaria, tamanioThumbail);
            byte[] bImagenThumbnail = new byte[tamanioThumbail];
            ImageConverter Convertidor = new ImageConverter();
            bImagenThumbnail = (byte[])Convertidor.ConvertTo(imtThumbnail, typeof(byte[]));

            */

            try
            {
                SqlConnection cn = new Coneccion().ConectarSQL();
                String comandoInsertar = "INSERT INTO Photo (Title,PhotoFile,Description) VALUES (@Title,@PhotoFile,@Comentario)";
                SqlCommand cmd = new SqlCommand(comandoInsertar, cn);
                cmd.Parameters.Add("@Title", SqlDbType.VarChar, 40).Value = txtTitulo.Text;
                cmd.Parameters.Add("@PhotoFile", SqlDbType.VarBinary).Value = FileUpload1.FileBytes; //bImagenThumbnail;
                cmd.Parameters.Add("@Comentario", SqlDbType.VarChar, 100).Value = txtComentario.Text;
                cmd.ExecuteNonQuery();
                lblMensaje.Text = "Se Agrego Imagen";
            }
            catch (Exception ex){
                lblMensaje.Text = ex.Message;
            
            }
        }
        //Crear miniatura
        /*
        public System.Drawing.Image RedimencionarImagen(System.Drawing.Image imagenOriginal, int Altura) {
            var radio = (double)Altura / imagenOriginal.Height;
            var nuevoAncho = (int)(imagenOriginal.Width * radio);
            var nuevoAlto = (int)(imagenOriginal.Height * radio);
            var nuevaImagenRedimencionada = new Bitmap(nuevoAncho, nuevoAlto);
            var g = Graphics.FromImage(nuevaImagenRedimencionada);
            g.DrawImage(imagenOriginal, 0, 0, nuevoAncho, nuevoAlto);
            return nuevaImagenRedimencionada;
        }
        */
        protected void btnInicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}

