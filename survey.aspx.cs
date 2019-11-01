using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prediqtWeb.cint
{
    public partial class survey : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                Session["ParticipantAmount"] = Request["amount"];
                Session["Validation"] = Request["Validation"];
            }
            


        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            DataSet oDs = new DataSet();

       

            if (File.Exists(HttpContext.Current.Request.PhysicalApplicationPath + @"\cint\responses.xml"))
            {
                oDs.ReadXml(HttpContext.Current.Request.PhysicalApplicationPath + @"\cint\responses.xml");
            }          
            
            if (oDs.Tables.Count ==0)
            {
                oDs.Tables.Add();
                oDs.Tables[0].Columns.Add("ReferenceNumber");
                oDs.Tables[0].Columns.Add("memberId");
                oDs.Tables[0].Columns.Add("Pending");
                oDs.Tables[0].Columns.Add("Approved");
                oDs.Tables[0].Columns.Add("Amount");
                oDs.Tables[0].Columns.Add("Question1");
                oDs.Tables[0].Columns.Add("Response1");
                oDs.Tables[0].Columns.Add("Question2");
                oDs.Tables[0].Columns.Add("Response2");

            }

            string ReferenceNumber = "1";

            if (Request["ReferenceNumber"] != null)
                ReferenceNumber = Request["ReferenceNumber"];

            oDs.Tables[0].Rows.Add(ReferenceNumber, Request["memberId"], Session["Validation"], "false", Request["amount"], "1. Overall, how satisfied or dissatisfied are you with our company?", Question1.SelectedValue, "2. How satisfied or dissatisfied are you with our Service Representatives?", Question2.SelectedValue);
            
            oDs.WriteXml(HttpContext.Current.Request.PhysicalApplicationPath + @"\cint\responses.xml");






            Response.Redirect("https://sim.cintworks.net/" + Request["id"] + "/Complete");

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://sim.cintworks.net/" + Request["id"] + "/EarlyScreenOut");
        }

    }
}