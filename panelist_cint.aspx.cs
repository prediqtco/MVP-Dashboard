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
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prediqtWeb
{
    public partial class panelist_cint : System.Web.UI.Page
    {


        SqlConnection oConn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);



       



        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                // Panelists
                // 108186073 - Memberid 1 - Miguel 
                // Public Key	GAVFAFSFV47TN7RLXBD3QBGYJM2PZCJUFOSYP3X6XG76BWR6H7IXVA3J
          

                // 108195917,   "member_id":"2", john
                // Public Key  GCUFKDT2NOEOFCKJGYYJZ5W2IVNUQXS3KLMVQX24JJC4KU5RF33H3L4W
          

                // 108195918    ,"member_id":"3","first_name":"Jennifer","last_name":"Lopez",
                // Public Key  GAPJJGKUAKHHFNRICNNINMJMW7TY25WMJC6CHLEXC7TWEBQPZUIOF4W7
                




                string PanelistId = "108195917";


                if (Request["id"] != null)
                    PanelistId = Request["id"];


                if (PanelistId == "108186073")
                    HyperLinkWallet.NavigateUrl = "https://horizon.stellar.org/accounts/GAVFAFSFV47TN7RLXBD3QBGYJM2PZCJUFOSYP3X6XG76BWR6H7IXVA3J";
                else if (PanelistId == "108195917")
                    HyperLinkWallet.NavigateUrl = "https://horizon.stellar.org/accounts/GCUFKDT2NOEOFCKJGYYJZ5W2IVNUQXS3KLMVQX24JJC4KU5RF33H3L4W";
                else if (PanelistId == "108195918")
                    HyperLinkWallet.NavigateUrl = "https://horizon.stellar.org/accounts/GAPJJGKUAKHHFNRICNNINMJMW7TY25WMJC6CHLEXC7TWEBQPZUIOF4W7";






                DataSet oDsScore = new DataSet();

                if (File.Exists(HttpContext.Current.Request.PhysicalApplicationPath + @"\cint\score.xml"))
                {
                    oDsScore.ReadXml(HttpContext.Current.Request.PhysicalApplicationPath + @"\cint\score.xml");
                }
                else
                {
                    oDsScore.Tables.Add();
                    oDsScore.Tables[0].Columns.Add("panelist");
                    oDsScore.Tables[0].Columns.Add("score");
                    oDsScore.Tables[0].Columns.Add("point");
                    oDsScore.Tables[0].Rows.Add("108186073", 500, 1);
                    oDsScore.Tables[0].Rows.Add("108195917", 500, 1);
                    oDsScore.Tables[0].Rows.Add("108195918", 500, 1);
                    oDsScore.WriteXml(HttpContext.Current.Request.PhysicalApplicationPath + @"\cint\score.xml");
                }

                foreach (DataRow item in oDsScore.Tables[0].Rows)
                {
                    if (item["panelist"].ToString() == PanelistId.ToString())
                    {
                        lblQualityScore.Text = item["score"].ToString();
                        lblQualityScorePoints.Text = item["point"].ToString();



                        try
                        {

                            if (Convert.ToInt16(item["point"].ToString()) > 0)
                            {
                                lblQualityScorePoints.Text = "+" + item["point"].ToString();
                                lblQualityScorePoints.ForeColor = System.Drawing.Color.Green;
                            }
                            else
                            {
                                lblQualityScorePoints.Text = "-" + item["point"].ToString();
                                lblQualityScorePoints.ForeColor = System.Drawing.Color.Red;
                            }
                        }
                        catch (Exception)
                        {

                           // throw;
                        }


                    }
                        
                }

                JsonCintPanelPanelists tmpPanelist = JsonConvert.DeserializeObject<JsonCintPanelPanelists>(jsonGETPanel("https://cdp.cintworks.net/panels/CINT PANEL/panelists/" + PanelistId));
                lblPanelistName.Text = tmpPanelist.panelist.first_name.ToString();
                lblPanelistAge.Text = (DateTime.Now.Year - Convert.ToInt16(tmpPanelist.panelist.year_of_birth.ToString())).ToString();
                lblPanelistGender.Text = tmpPanelist.panelist.gender.ToString();
                lblPanelistCintId.Text = tmpPanelist.panelist.key.ToString();
                lblPanelistPrediqtId.Text = tmpPanelist.panelist.member_id.ToString();



                List<JsonCintPanelSurveyOpportunities> resultRespondentQuotas = JsonConvert.DeserializeObject<List<JsonCintPanelSurveyOpportunities>>(jsonGETPanel("https://cdp.cintworks.net/panels/CINT PANEL/panelists/" + PanelistId  + "/survey_opportunities"));


                DataSet ods = new DataSet();
                ods.Tables.Add();

                ods.Tables[0].Columns.Add("panelist");
                ods.Tables[0].Columns.Add("projectid");
                ods.Tables[0].Columns.Add("referencenumber");
                ods.Tables[0].Columns.Add("url");              
                ods.Tables[0].Columns.Add("price");
                ods.Tables[0].Columns.Add("length");
                ods.Tables[0].Columns.Add("enddate");




                List<JsonCintPanelSurveyOpportunities> resultRespondentQuotasOrder = resultRespondentQuotas.OrderByDescending(foo => foo.project_id).ToList();


                foreach (JsonCintPanelSurveyOpportunities item in resultRespondentQuotasOrder)
                {
                    if (item.field_period_end_date > DateTime.Now)
                        ods.Tables[0].Rows.Add(PanelistId, item.project_id,item.reference_number, item.links[0].href,item.incentive.amount,item.length_of_interview,item.field_period_end_date.ToString("MM/dd/yyyy"));


                }


               



                rptOportunities.DataSource = ods.Tables[0];
                rptOportunities.DataBind();




                Console.Write("Done");




            }

        }

        

        public static string Base64Encode(string plainText)
        {
            var plainTextBytes = System.Text.Encoding.UTF8.GetBytes(plainText);
            return System.Convert.ToBase64String(plainTextBytes);
        }






        public static string jsonPATCHPanel(string url, string json)
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);

            request.Headers.Add("Authorization", "Basic " + Base64Encode(""));

            request.ContentType = "application/json";
            request.Accept = "application/json";
            request.Method = "PATCH";

            using (var streamWriter = new StreamWriter(request.GetRequestStream()))
            {
                streamWriter.Write(json);
                streamWriter.Flush();
                streamWriter.Close();
            }
            try
            {
                var httpResponse = (HttpWebResponse)request.GetResponse();
                using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
                {
                    return streamReader.ReadToEnd();
                }
            }
            catch (WebException ex)
            {
                using (var sr = new StreamReader(ex.Response.GetResponseStream()))
                {
                    var data = sr.ReadToEnd();
                    throw new ApplicationException(data);
                }
            }

        }

        public static string jsonPOSTPanel(string url, string json)
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);

            request.Headers.Add("Authorization", "Basic " + Base64Encode(""));

            request.Accept = "application/json";
            request.ContentType = "application/json";
            request.Method = "POST";

            using (var streamWriter = new StreamWriter(request.GetRequestStream()))
            {
                streamWriter.Write(json);
                streamWriter.Flush();
                streamWriter.Close();
            }

            try
            {
                var httpResponse = (HttpWebResponse)request.GetResponse();
                using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
                {
                    return streamReader.ReadToEnd();
                }
            }
            catch (WebException ex)
            {
                using (var sr = new StreamReader(ex.Response.GetResponseStream()))
                {
                    var data = sr.ReadToEnd();
                    throw new ApplicationException(data);
                }
            }

        }

        public static string jsonGETPanel(string url)
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);

            //Key: 257eef39-d250-4df9-8460-ce7d6ff80f2f
            //Secret: XnNTjuuuHFJA6
            request.Accept = "application/json";
            request.Headers.Add("Authorization", "Basic " + Base64Encode(""));
            
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
                }
                return "";
            }
        }



        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("survey.aspx");
        }
    }
}