<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="thankyou.aspx.cs" Inherits="prediqtWeb.cint.thankyou" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Prediqt Survey</title>
    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style>
        table, th, td {
            border: 0px solid black;
            padding: 10px;
        }

        table {
            border-spacing: 15px;
        }
    </style>






    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>


    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<body>
    <form runat="server">






        <table width="100%">
            <tr>
                <td>
                    <img src="/images/prediqt_logo.png" hspace="30" />

                </td>
                <td></td>
                <td align="left" width="10%">HOME</td>
            </tr>
            <tr>
                <td colspan="3">
                    <hr />
                </td>
            </tr>
        </table>

        <table width="100%">
            <tr style="background-color: white; height: 100px;">

                 <td style="vertical-align: middle" align="center">               
            
                      <h1>Thank you</h1>

                     <br />
                     <b>Thank You for completing the survey. </b><br />
                     Once the validation process has been completed, you'll be informed of the status of your rewards payment and/or your account will be credited automatically.

                     <asp:Label ID="ParticipantRequest" runat="server"></asp:Label>
                </td>
            </tr>
            <tr style="background-color: white; height: 100px">

                 

                <td style="vertical-align: middle" width="60%" align="center">               
            


                </td>
            </tr>



        </table>






        <table align="center" width="500px" id="tableQualityScore" style="visibility:hidden">
            <tr>
                <td>
                    <div style="font-size: 2em; text-align: center; font-family: 'Arial Rounded MT'">Your Quality Score</div>
                    <div id="score" style="font-size: 8em; text-align: center; font-family: 'Arial Rounded MT'">0</div>
                   
                    <div class="w3-light-blue" style="width: 100%">
                        <div id="myBar" class="w3-container w3-green w3-center" style="width: 0%">0</div>
                    </div>                    
                </td>                
            </tr>
        </table>



        <%--<br>
<button class="w3-button w3-green" onclick="move()">Click Me</button> 
        --%>



        <%--   <center><asp:Label ID="lblScore" runat="server" style="font-size:8em" Text="0"></asp:Label></center>
        --%>
    </form>





    <script>
        function move(value) {
            document.getElementById("tableQualityScore").style.visibility = "visible";


            var elem = document.getElementById("myBar");
            var elemlabel = document.getElementById("score");



            var width = 0;
            var id = setInterval(frame, 2);


            function frame() {

                if (width >= value) {
                    clearInterval(id);

                } else {
                    width++;



                    if (width < 100)
                        elem.className = "w3-container w3-yellow w3-center";
                    else if (width < 300)
                        elem.className = "w3-container w3-orange w3-center";
                    else if (width < 500)
                        elem.className = "w3-container w3-light-green w3-center";
                     else if (width < 1000)
                        elem.className = "w3-container w3-green w3-center";


                    elem.style.width = width / 10 + '%';
                    elem.innerHTML = width * 1 + '';
                    elemlabel.innerHTML = width * 1 + '';
                }




            }
        }
    </script>




</body>

</html>
