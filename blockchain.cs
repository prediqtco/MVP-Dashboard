using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using stellar_dotnet_sdk;
using stellar_dotnet_sdk.responses;

namespace prediqtWeb.cint
{



    public class blockchainPqt
    {


        

        string asset_code = "QT";
        string asset_issuer= "GD7CN3HBSZBG44NPEOFNPOLDTO462BBXBXJEBMI3TUWBN44YGJD2NDAB";




       public  async Task SendPQTPayment(string FromSecret, string ToAccount, double amount)
        {


            Network network = new Network("Public Global Stellar Network ; September 2015");
            Server server = new Server("https://horizon.stellar.org");

            Network.UsePublicNetwork();

            KeyPair fromKeypair = KeyPair.FromSecretSeed(FromSecret);
            KeyPair destinationKeyPair = KeyPair.FromAccountId(ToAccount);


            AccountResponse issuerAccountResponse = null;
            var t = Task.Run(async () =>
            {
                issuerAccountResponse = await server.Accounts.Account(fromKeypair);
            });
            t.Wait();


            Account fromAccount = new Account(issuerAccountResponse.KeyPair, issuerAccountResponse.SequenceNumber);



            KeyPair issuerKeypair = KeyPair.FromAccountId(asset_issuer);
            Asset asset = new AssetTypeCreditAlphaNum4(asset_code, issuerKeypair);

            PaymentOperation operation = new PaymentOperation.Builder(destinationKeyPair, asset, amount.ToString()).SetSourceAccount(fromAccount.KeyPair).Build();

            Transaction transaction = new Transaction.Builder(fromAccount).AddOperation(operation).Build();

            //Try to send the transaction
            try
            {
                transaction.Sign(fromKeypair);

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




        async Task GetCoinsFromIssuer(string asset_code, double amount)
        {


            Network network = new Network("Public Global Stellar Network ; September 2015");
            Server server = new Server("https://horizon.stellar.org");

            Network.UsePublicNetwork();

            KeyPair issuerKeypair = KeyPair.FromSecretSeed("SECRET SEED");
            KeyPair destinationKeyPair = KeyPair.FromAccountId("PUBLIC ACCOUNT");


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



        async Task CreateSurveyAsset(string asset_code)
        {

            Network network = new Network("Public Global Stellar Network ; September 2015");
            Server server = new Server("https://horizon.stellar.org");
            Network.UsePublicNetwork();
            KeyPair issuerKeypair = KeyPair.FromAccountId("SEED");
            KeyPair destinationKeyPair = KeyPair.FromSecretSeed("PUBLIC");

            AccountResponse destinationAccountResponse = null;
            var t = Task.Run(async () =>
            {
                destinationAccountResponse = await server.Accounts.Account(destinationKeyPair);
            });
            t.Wait();
            Account destinationAccount = new Account(destinationAccountResponse.KeyPair, destinationAccountResponse.SequenceNumber);
            Asset asset = new AssetTypeCreditAlphaNum12(asset_code, issuerKeypair);
            ChangeTrustOperation operation = new ChangeTrustOperation.Builder(asset, "100000000000").Build();
            Transaction transaction = new Transaction.Builder(destinationAccount).AddOperation(operation).Build();

            try
            {
                transaction.Sign(destinationKeyPair);

                var tSign = Task.Run(async () =>
                {
                    await server.SubmitTransaction(transaction);
                });
                tSign.Wait();


                //    await GetCoinsFromIssuer(asset_code,100);

            }
            catch (Exception exception)
            {
                Console.WriteLine("Send Transaction Failed");
                Console.WriteLine("Exception: " + exception.Message);
            }

        }




    }

}