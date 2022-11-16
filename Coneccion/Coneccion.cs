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
    public class Coneccion
    {
        SqlConnection conexion = new SqlConnection();//Permite establcer una conexion con la BD
        SqlCommand cmd = new SqlCommand(); //Permite ejecutar una instruccion SQL
        SqlDataReader leer; //Permite almacenar el resultado de una instruccion se

        public SqlConnection ConectarSQL()
        {
            try
            {
                //string nombreServidor = "EVELYN\\GONZALEZ";
                // conexion.ConnectionString = "Data Source = " + nombreServidor + "\\; Initial Catalog = proyecto; Integrated Security = True";
                string cadena = "Data source=EVELYN\\GONZALEZ;Initial Catalog=proyecto;Integrated Security=True";
                conexion.ConnectionString = cadena;
                return conexion;

            }
            catch (SqlException ex)
            {
                return null;
            }

        }
        public void Ingresar(string usuario, string nom, string pas)
        {
            SqlConnection cn = new SqlConnection();
            SqlCommand cm = new SqlCommand();
            string cadena = "Data source=EVELYN\\GONZALEZ;Initial Catalog=proyecto;Integrated Security=True";
            cn.ConnectionString = cadena;
            cm.Connection = cn;
            String sql = "ingreso";
            cm.CommandText = sql;
            //cm.CommandType = CommandType.Text;
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.Add("@usu", SqlDbType.VarChar, 20);
            cm.Parameters["@usu"].Value = usuario;
            cm.Parameters.Add("@nombre", SqlDbType.VarChar, 35);
            cm.Parameters["@nombre"].Value = nom;
            cm.Parameters.Add("@pas", SqlDbType.NVarChar, 100);
            cm.Parameters["@pas"].Value = pas;
            cn.Open();
            cm.ExecuteNonQuery();
            cn.Close();
        }




        public bool Validar(string user, string pas)
        {
            /*
            string nombreServidor = Dns.GetHostName();
            string cadena = "Data source=" + nombreServidor + "//SQLEXPRESS; Initial Catalog=proyecto;Integrated Security=True";
            conexion.ConnectionString = cadena;
            cmd.Connection = conexion;
            */
            cmd.Connection = ConectarSQL();
            String sql = "buscar";
            cmd.CommandText = sql;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@user", SqlDbType.VarChar, 20);
            cmd.Parameters["@user"].Value = user;
            cmd.Parameters.Add("@pas", SqlDbType.VarChar, 20);
            cmd.Parameters["@pas"].Value = pas;
            //conexion.Open(); El metodo ConectarSQL retorna una conexion abierta
            ConectarSQL().Open();
            leer = cmd.ExecuteReader();
            if (leer.HasRows == true)
            {
                return true;
            }
            else
            {
                return false;
            }
            ConectarSQL().Close();

        }
    }
}