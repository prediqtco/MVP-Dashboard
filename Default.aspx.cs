using Newtonsoft.Json;
using stellar_dotnet_sdk;
using stellar_dotnet_sdk.responses;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ApiBridge;
namespace prediqtWeb.cint
{





    public partial class Default : System.Web.UI.Page
    {

        public static string HorizonServer = "https://horizon.stellar.org";


        protected void Page_Load(object sender, EventArgs e)
        {

            ///ordering/reference/survey/categories
            ///

            if (!IsPostBack)
            {

            //    GetAssets();

            }


        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {



            GetAssets();


        }




        protected Boolean showButton(string Amount)
        {

            if (Amount == "0 PQT")
                return true;
            else
                return false;
        }




        async Task GetCoinsFromIssuer(string asset_code, double amount)
        {


            Network network = new Network("Public Global Stellar Network ; September 2015");
            Server server = new Server("https://horizon.stellar.org");

            Network.UsePublicNetwork();

            KeyPair issuerKeypair = KeyPair.FromSecretSeed("SEED");
            KeyPair destinationKeyPair = KeyPair.FromAccountId("PUBLIC");


            AccountResponse issuerAccountResponse = null;
            var t = Task.Run(async () =>
            {
                issuerAccountResponse = await server.Accounts.Account(issuerKeypair);
            });
            t.Wait();


            Account issuerAccount = new Account(issuerAccountResponse.KeyPair, issuerAccountResponse.SequenceNumber);
            Asset asset = new AssetTypeCreditAlphaNum12(asset_code, issuerKeypair);

            PaymentOperation operation = new PaymentOperation.Builder(destinationKeyPair, asset, amount.ToString()).SetSourceAccount(issuerAccount.KeyPair).Build();

            Transaction transaction = new Transaction.Builder(issuerAccount).AddOperation(operation).Build();

            //Try to send the transaction
            try
            {
                transaction.Sign(issuerKeypair);

                var tSign = Task.Run(async () =>
                {
                    await server.SubmitTransaction(transaction);
                });
                tSign.Wait();

            }
            catch (Exception exception)
            {
                Console.WriteLine("Send Transaction Failed");
                Console.WriteLine("Exception: " + exception.Message);
            }


        }




        public static string jsonGET(string url)
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);

            request.Headers.Add("X-Api-Key", "KEY");

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

        protected void Button1_Click(object sender, EventArgs e)
        {
            File.Delete(HttpContext.Current.Request.PhysicalApplicationPath + @"\cint\surveys.xml");
            File.Delete(HttpContext.Current.Request.PhysicalApplicationPath + @"\cint\responses.xml");
        }
    }




    public class StellarAssets
    {
        public StellarAssetsEmbedded _embedded { get; set; }
    }

    public class StellarAssetsEmbedded
    {
        public List<StellarAssetsRecords> records { get; set; }
    }

    public class StellarAssetsRecords
    {
        public StellarAssetsLinks _links { get; set; }
        public string asset_type { get; set; }
        public string asset_code { get; set; }
        public string asset_issuer { get; set; }
        public string paging_token { get; set; }
        public double amount { get; set; }




    }

    public class StellarAssetsLinks
    {
        public StellarAssetsToml toml { get; set; }
    }

    public class StellarAssetsToml
    {
        public string href { get; set; }
    }
}