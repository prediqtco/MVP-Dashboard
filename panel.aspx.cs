using ApiBridge;
using Newtonsoft.Json;
using prediqtWeb.cint;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prediqtWeb
{
    public partial class panel : System.Web.UI.Page
    {


        SqlConnection oConn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);



       


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {



                string PanelistId="";// = "108195917";


                if (Request["id"] != null)
                {
                    PanelistId = Request["id"];
                    Session["PanelistId"] = PanelistId;
                }
                else
                    logindiv.Visible = false;


                if (PanelistId == "108186073")
                {
                    linkMiguel.Visible = false;
                    txtEmail.Text = "Miguel@prediqt.co";
                }                   
                else if (PanelistId == "108195917")
                {
                    linkJohn.Visible = false;
                    txtEmail.Text = "John@prediqt.co";
                }
                    
                else if (PanelistId == "108195918")
                {
                    linkJennifer.Visible = false;
                    txtEmail.Text = "Jennifer@prediqt.co";
                }
                   



            }

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            Response.Redirect("panelist_cint.aspx?id=" + Session["PanelistId"].ToString());
        }


    }
}