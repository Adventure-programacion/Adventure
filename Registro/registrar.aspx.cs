using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Adventure_Works
{
    public partial class registrar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        Coneccion con = new Coneccion();

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                con.Ingresar(txtuser.Text, txtnom.Text, txtpas.Text);
                ScriptManager.RegisterStartupScript(this, this.GetType(),
           "alert", "alert('Usuario Ingresado con exito');", true);
            }
            catch (SqlException ex)
            {
                lblerror.Text = "Usuario ya existe";
            }
                
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}