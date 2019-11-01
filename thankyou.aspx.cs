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
    public partial class thankyou : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Validation"] != null)
            {

                if (Session["Validation"].ToString() == "false")
                {
                    double ParticipantAmount = 2.00;
                    string PanelistId = "108195917";
                    string Wallet = "GCUFKDT2NOEOFCKJGYYJZ5W2IVNUQXS3KLMVQX24JJC4KU5RF33H3L4W";

                    if (Session["ParticipantAmount"] != null)
                        ParticipantAmount = Convert.ToDouble(Session["ParticipantAmount"]);

                    if (Request["PanelistId"] != null)
                        PanelistId = Request["PanelistId"];


                    if (PanelistId == "108186073") // 108186073 - Memberid 1 - Miguel 
                        Wallet = "GAVFAFSFV47TN7RLXBD3QBGYJM2PZCJUFOSYP3X6XG76BWR6H7IXVA3J";
                    else if (PanelistId == "108195917") //108195917,   "member_id":"2", john
                        Wallet = "GCUFKDT2NOEOFCKJGYYJZ5W2IVNUQXS3KLMVQX24JJC4KU5RF33H3L4W";
                    else if (PanelistId == "108195918") // // 108195918    ,"member_id":"3","first_name":"Jennifer","last_name":"Lopez",
                        Wallet = "GAPJJGKUAKHHFNRICNNINMJMW7TY25WMJC6CHLEXC7TWEBQPZUIOF4W7";


                    blockchainPqt cBlochchain = new blockchainPqt();
                    System.Threading.Tasks.Task taskGetCoins = cBlochchain.SendPQTPayment("SB3T5X6LDL2VR3L57HY5CT5DNUY2NJT3QTLTIJZSQPA2P5AATJBLG7X7", Wallet, ParticipantAmount);
                    taskGetCoins.Wait();


                    QualityScore(PanelistId, 1);
                }



            }

        
                   
             






        }




        void QualityScore(string PanelistId, int score)
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
                    if (item["panelist"].ToString() == PanelistId)
                    {
                        item["score"] = Convert.ToInt16(item["score"]) + score;
                        item["point"] = score.ToString();
                    }

               
                }
                oDsScore.WriteXml(HttpContext.Current.Request.PhysicalApplicationPath + @"\cint\score.xml");


            }
            catch (Exception)
            {

                //throw;
            }



        }








    }
}