using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Net;

namespace Adventure_Works
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        Coneccion con = new Coneccion();
      
        public string nombre;


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (con.Validar(this.txtus.Text, this.txtpas.Text) == true)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "alert", "alert('Ingresado con exito');", true);
                nombre = txtus.Text;
                Response.Redirect("Home.aspx?nom=" + nombre);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                 "alert", "alert('Usuario no existe');", true);
            }
        }
    }
}