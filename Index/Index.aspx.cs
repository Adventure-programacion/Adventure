using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Adventure_Works
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string nombre = Request.QueryString["nom"];
            lblusuario.Text = nombre;
            ConsultarFotos();
            if (lblusuario.Text == "")
            {
                Button3.Visible = false;
                Hplink.Visible = true;
                Hplink2.Visible = false;
            }
            else
            {
                Hplink.Visible = false;
                Button3.Visible = true;
                Hplink2.Visible = true;
            }
        }
        protected void ConsultarFotos() {
            /*
                string nombreServidor = Dns.GetHostName();
                string cadena = "Data source=" + nombreServidor + "//SQLEXPRESS; Initial Catalog=proyecto;Integrated Security=True";
                SqlConnection cn = new SqlConnection(cadena);
            */
            SqlConnection cn = new Coneccion().ConectarSQL();
        
            
            SqlCommand cm = new SqlCommand();
            cm.CommandText = "SELECT PhotoFile, Title from Photo ORDER BY PhotoID ASC";
            cm.CommandType = CommandType.Text;
            cm.Connection = cn;
            cn.Open();
            DataTable imagenes = new DataTable();
            imagenes.Load(cm.ExecuteReader());
            Repeater1.DataSource = imagenes;
            Repeater1.DataBind();
            cn.Close();
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarImagen.aspx");
        }
    }
}