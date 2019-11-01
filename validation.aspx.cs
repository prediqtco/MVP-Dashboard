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
    public partial class validation : System.Web.UI.Page
    {
        DataSet oDs = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {



                if (File.Exists(HttpContext.Current.Request.PhysicalApplicationPath + @"\cint\responses.xml"))
                {
                    oDs.ReadXml(HttpContext.Current.Request.PhysicalApplicationPath + @"\cint\responses.xml");

                  
                }
                else
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


                    oDs.WriteXml(HttpContext.Current.Request.PhysicalApplicationPath + @"\cint\responses.xml");
                }



                if (oDs.Tables.Count > 0)
                {

                    DataSet FilterDS = new DataSet();
                    FilterDS.Tables.Add();
                    FilterDS.Tables[0].Columns.Add("ReferenceNumber");
                    FilterDS.Tables[0].Columns.Add("memberId");
                    FilterDS.Tables[0].Columns.Add("Pending");
                    FilterDS.Tables[0].Columns.Add("Approved");
                    FilterDS.Tables[0].Columns.Add("Amount");
                    FilterDS.Tables[0].Columns.Add("Question1");
                    FilterDS.Tables[0].Columns.Add("Response1");
                    FilterDS.Tables[0].Columns.Add("Question2");
                    FilterDS.Tables[0].Columns.Add("Response2");

                    int i;

                    for (i = 0; i < oDs.Tables[0].Rows.Count; i++)
                    {

                        if (oDs.Tables[0].Rows[i]["Pending"].ToString() != "false")
                            FilterDS.Tables[0].Rows.Add(oDs.Tables[0].Rows[i].ItemArray);


                    }



                    rptSurveys.DataSource = FilterDS.Tables[0];

                }




                rptSurveys.DataBind();
            }


        }




        protected void btnPass_Onclick(object sender, EventArgs e)
        {
            oDs.ReadXml(HttpContext.Current.Request.PhysicalApplicationPath + @"\cint\responses.xml");

            RepeaterItem itemRepeater = (sender as Button).NamingContainer as RepeaterItem;
            string SurveyId = (itemRepeater.FindControl("SurveyId") as System.Web.UI.HtmlControls.HtmlGenericControl).InnerText;
            string PanelistId = (itemRepeater.FindControl("PanelistId") as System.Web.UI.HtmlControls.HtmlGenericControl).InnerText;



            double ParticipantAmount = 2.00;
            string MemberId = "108195917";
            string Wallet = "GCUFKDT2NOEOFCKJGYYJZ5W2IVNUQXS3KLMVQX24JJC4KU5RF33H3L4W";

            
            foreach (DataRow item in oDs.Tables[0].Rows)
            {

                if (item["ReferenceNumber"].ToString() == SurveyId && item["memberId"].ToString() == PanelistId)
                {
                    item["Pending"] = "false";
                    item["Approved"] = "true";
                    ParticipantAmount = Convert.ToDouble(item["Amount"]);
                    MemberId = item["memberId"].ToString();
                }
            }

            oDs.WriteXml(HttpContext.Current.Request.PhysicalApplicationPath + @"\cint\responses.xml");



            if (MemberId == "1") // 108186073 - Memberid 1 - Miguel 
                Wallet = "GAVFAFSFV47TN7RLXBD3QBGYJM2PZCJUFOSYP3X6XG76BWR6H7IXVA3J";
            else if (MemberId == "2") //108195917,   "member_id":"2", john
                Wallet = "GCUFKDT2NOEOFCKJGYYJZ5W2IVNUQXS3KLMVQX24JJC4KU5RF33H3L4W";
            else if (MemberId == "3") // // 108195918    ,"member_id":"3","first_name":"Jennifer","last_name":"Lopez",
                Wallet = "GAPJJGKUAKHHFNRICNNINMJMW7TY25WMJC6CHLEXC7TWEBQPZUIOF4W7";

     
            blockchainPqt cBlochchain = new blockchainPqt();
            System.Threading.Tasks.Task taskGetCoins = cBlochchain.SendPQTPayment("SB3T5X6LDL2VR3L57HY5CT5DNUY2NJT3QTLTIJZSQPA2P5AATJBLG7X7", Wallet, ParticipantAmount);
            taskGetCoins.Wait();


            QualityScore(MemberId, 1);

            Response.Redirect("validation.aspx");
        }

        protected void btnFail_Onclick(object sender, EventArgs e)
        {
            oDs.ReadXml(HttpContext.Current.Request.PhysicalApplicationPath + @"\cint\responses.xml");
            string MemberId = "1";
            RepeaterItem itemRepeater = (sender as Button).NamingContainer as RepeaterItem;
            string SurveyId = (itemRepeater.FindControl("SurveyId") as System.Web.UI.HtmlControls.HtmlGenericControl).InnerText;
            string PanelistId = (itemRepeater.FindControl("PanelistId") as System.Web.UI.HtmlControls.HtmlGenericControl).InnerText;
            
            foreach (DataRow item in oDs.Tables[0].Rows)
            {
                if (item["ReferenceNumber"].ToString() == SurveyId && item["memberId"].ToString() == PanelistId)
                {
                    item["Pending"] = "false";
                    item["Approved"] = "false";
                    MemberId = item["memberId"].ToString();
                }
            }

            oDs.WriteXml(HttpContext.Current.Request.PhysicalApplicationPath + @"\cint\responses.xml");




            QualityScore(MemberId, -1);

            Response.Redirect("validation.aspx");
        }



        void QualityScore(string MemberId, int score)
        {

            try
            {



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
                if (MemberId == "1" && item["panelist"].ToString() == "108186073") // 108186073 - Memberid 1 - Miguel 
                    {
                        item["score"] = Convert.ToInt16(item["score"]) + score;
                        item["point"] = score.ToString();
                    }
                   
                else if (MemberId == "2" && item["panelist"].ToString() == "108195917") //108195917,   "member_id":"2", john
                    {
                        item["score"] = Convert.ToInt16(item["score"]) + score;
                        item["point"] = score.ToString();
                    }
                 
                else if (MemberId == "3" && item["panelist"].ToString() == "108195918") // // 108195918    ,"member_id":"3","first_name":"Jennifer","last_name":"Lopez",
                    {
                        item["score"] = Convert.ToInt16(item["score"]) + score;
                        item["point"] = score.ToString();

                    }
                   
            }
                oDsScore.WriteXml(HttpContext.Current.Request.PhysicalApplicationPath + @"\cint\score.xml");


            } 
            catch (Exception ex)
            {

                //throw;
            }



        }


    }
}