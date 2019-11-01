using ApiBridge;
using Newtonsoft.Json;
using prediqtWeb.cint;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;
using System.Data;
using System.Threading.Tasks;

namespace prediqtWeb
{
    public partial class survey_cint : System.Web.UI.Page
    {


        SqlConnection oConn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);


        
        public class JsonCintGeneral
        {
            public int id { get; set; }
            public string name { get; set; }

        }


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                txtStartDate.Text = System.DateTime.Now.ToString("MM/dd/yyyy");


                // Categories
                List<JsonCintGeneral> categories;

                if (Session["ListCategories"] == null)
                {
                    categories = JsonConvert.DeserializeObject<List<JsonCintGeneral>>(jsonGET("https://api.cintworks.net/ordering/reference/survey/categories"));
                    Session["ListCategories"] = categories;
                }
                else
                    categories = (List<JsonCintGeneral>)Session["ListCategories"];

                List<JsonCintGeneral> categoriesSortedList = categories.OrderBy(o => o.name).ToList();
                
                DropDownListCategory.DataSource = categoriesSortedList;
                DropDownListCategory.DataTextField = "name";
                DropDownListCategory.DataValueField = "id";
                DropDownListCategory.DataBind();

                List<JsonCintGeneral> countries;

                
                if (Session["ListCountries"] == null)
                {
                    countries = JsonConvert.DeserializeObject<List<JsonCintGeneral>>(jsonGET("https://api.cintworks.net/ordering/reference/countries"));
                    Session["ListCountries"] = countries;
                }
                else
                    countries = (List<JsonCintGeneral>)Session["ListCountries"];

                List<JsonCintGeneral> countriesSortedList = countries.OrderBy(o => o.name).ToList();
                DropDownListCountry.DataSource = countriesSortedList;
                DropDownListCountry.DataTextField = "name";
                DropDownListCountry.DataValueField = "id";
                DropDownListCountry.DataBind();

                DropDownListCountry.SelectedValue ="22";
            }

        }

        



        public static string jsonGET(string url)
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);

            request.Headers.Add("X-Api-Key", "493619f1749f497794778f67522dbfeb");

            try
            {
                WebResponse response = request.GetResponse();
                using (Stream responseStream = response.GetResponseStream())
                {
                    StreamReader reader = new StreamReader(responseStream, System.Text.Encoding.UTF8);
                    return reader.ReadToEnd();
                }
            }
            catch (WebException ex)
            {
                WebResponse errorResponse = ex.Response;
                using (Stream responseStream = errorResponse.GetResponseStream())
                {
                    StreamReader reader = new StreamReader(responseStream, System.Text.Encoding.GetEncoding("utf-8"));
                    String errorText = reader.ReadToEnd();
                    // log errorText
                }
                return "";
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
          CreateProject();
        }



        void CreateProject()
        {

            DataSet oDs = new DataSet();


            JsonCintSurvey cSurvey = new JsonCintSurvey();
            cSurvey.name = txtTitle.Text;
            cSurvey.referenceNumber = DateTime.Now.ToString("yyyyMMdd") + "-" + DateTime.Now.ToString("hhmmss");
            cSurvey.contact = new JsonCintContact();
            cSurvey.contact.emailAddress = "migueln@prediqt.co";
            cSurvey.contact.name = "Miguel ";
            cSurvey.contact.company = "Prediqt";
            cSurvey.categories = new List<int>();
            cSurvey.categories.Add(Convert.ToInt16(DropDownListCategory.SelectedValue));
            cSurvey.countryId = Convert.ToInt16(DropDownListCountry.SelectedValue);

            cSurvey.limit = Convert.ToInt32(txtParticipants.Text); // Amount of participants
            cSurvey.limitType = 0;
            cSurvey.incidenceRate = 85;
            cSurvey.lengthOfInterview = 15;
            cSurvey.linkTemplate = txtlinkTemplate.Text + "&title=" + txtTitle.Text.Replace(" ","%20")  + "&amount=" + Math.Round(((Convert.ToDouble(txtTotalRewardAmount.Text) /2) / Convert.ToDouble(txtParticipants.Text)), 2).ToString() + "&ReferenceNumber=" + cSurvey.referenceNumber + "&Validation=" + checkboxValidation.Checked.ToString().ToLower();
            cSurvey.testLinkTemplate = txttestLinkTemplate.Text;
            cSurvey.deviceTypes = new List<int> { 1, 2, 3 };
            

            cSurvey.quotaGroups = new List<JsonCintQuotaGroup>();
            JsonCintQuotaGroup cQuotaGroup = new JsonCintQuotaGroup();
            cQuotaGroup.name = "Age";
            JsonCintQuota cQuota = new JsonCintQuota();
            cQuota.name = "TargetAge";
            cQuota.limit = Convert.ToInt32(txtParticipants.Text);
            JsonCintTargetGroup cTargetGroup = new JsonCintTargetGroup();
            cTargetGroup.minAge = Convert.ToInt32(txtAgeMinimum.Text);
            cTargetGroup.maxAge = Convert.ToInt32(txtAgeMaximum.Text);
            

            // Prediqt PANEL Id 8041
            cSurvey.targetedPanelIds = new List<int>();
            cSurvey.targetedPanelIds.Add(8041);

            cQuota.targetGroup = new JsonCintTargetGroup();
            cQuota.targetGroup = cTargetGroup;
            cQuotaGroup.quotas = new List<JsonCintQuota>();
            cQuotaGroup.quotas.Add(cQuota);
            cSurvey.quotaGroups.Add(cQuotaGroup);

        
            string json = JsonConvert.SerializeObject(cSurvey);

            JsonCintSurvey result = JsonConvert.DeserializeObject<JsonCintSurvey>(jsonPOST("https://api.cintworks.net/ordering/surveys/", json));


           


            JsonCintSurveyLinks resultLinks =null;


            DateTime endTime = DateTime.Now.AddSeconds(10);

            while (resultLinks == null && DateTime.Now < endTime)
            {
                resultLinks = JsonConvert.DeserializeObject<JsonCintSurveyLinks>(jsonGET("https://api.cintworks.net/ordering/surveys/" + result.id + "/Test"));
            }

            JsonCintLinks reponse = resultLinks.links.Find(r => r.rel == "entryUrl");
                        
            json = "{ \"starts\": 1 }";
            object responseRespondetn = jsonPOST("https://api.cintworks.net/ordering/surveys/" + result.id + "/respondents", json);



            //System.IO.File.AppendAllText(HttpContext.Current.Request.PhysicalApplicationPath + @"\cint\surveys.txt", "Survey Id: " + result.id + Environment.NewLine);



            blockchainPqt cBlochchain = new blockchainPqt();            
            Task taskGetCoins = cBlochchain.SendPQTPayment("", "", (Convert.ToDouble(txtTotalRewardAmount.Text)/2));
            taskGetCoins.Wait();



            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "swal('Thank you for your order!','Your Project *" + result.name + "* has been received. Reference Number: " + result.referenceNumber.ToString() + " ','success')", true);



            if (File.Exists(HttpContext.Current.Request.PhysicalApplicationPath + @"\cint\surveys.xml"))
            {
                try
                {
                    oDs.ReadXml(HttpContext.Current.Request.PhysicalApplicationPath + @"\cint\surveys.xml");
                    oDs.Tables[0].Rows.Add(result.id, result.name, result.referenceNumber, checkboxValidation.Checked.ToString().ToLower());
                }
                catch (Exception ex)
                {
                    File.Delete(HttpContext.Current.Request.PhysicalApplicationPath + @"\cint\surveys.xml");
                    oDs.Clear();
                    oDs.Tables.Add();
                    oDs.Tables[0].Columns.Add("id");
                    oDs.Tables[0].Columns.Add("name");
                    oDs.Tables[0].Columns.Add("referenceNumber");
                    oDs.Tables[0].Columns.Add("validation");
                    oDs.Tables[0].Rows.Add(result.id, result.name, result.referenceNumber, checkboxValidation.Checked.ToString().ToLower());
                    //throw;
                }     
            }
            else
            {
                oDs.Tables.Add();
                oDs.Tables[0].Columns.Add("id");
                oDs.Tables[0].Columns.Add("name");
                oDs.Tables[0].Columns.Add("referenceNumber");
                oDs.Tables[0].Columns.Add("validation");
                oDs.Tables[0].Rows.Add(result.id, result.name, result.referenceNumber, checkboxValidation.Checked.ToString().ToLower());

            }





            oDs.WriteXml(HttpContext.Current.Request.PhysicalApplicationPath + @"\cint\surveys.xml");




        }




        public static string jsonPOST(string url, string json)
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);

            request.Headers.Add("X-Api-Key", "");
          
            request.ContentType = "application/json";
            request.Method = "POST";

            using (var streamWriter = new StreamWriter(request.GetRequestStream()))
            {
                streamWriter.Write(json);
                streamWriter.Flush();
                streamWriter.Close();
            }

            var httpResponse = (HttpWebResponse)request.GetResponse();
            using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
            {
                return streamReader.ReadToEnd();
            }

        }


        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("survey_cint.aspx");
        }
    }
}