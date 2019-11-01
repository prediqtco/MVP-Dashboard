<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="survey.aspx.cs" Inherits="prediqtWeb.cint.survey" %>

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


    <script>
    function toggleTable(hide)
    {
    if (hide) {
       document.getElementById("surveyTable").style.display="table";
       document.getElementById("surveyLink").style.display="none";

    } else {
       document.getElementById("surveyTable").style.display="none";
      // document.getElementById("surveyLink").onclick = toggleTable(true);
    }
   }
   </script>



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


             <tr>
                <td colspan="3" align="center">
                    <h1><b>Survey Summary</b></h1>
                </td>
            </tr>

              <tr>
                <td colspan="3" >
                    <h3><b><%= Request["title"]%></b></h3>
                    Thank you for considering this survey. There are 2 questions in the survey and should take approximately 2 minutes to complete.
                    <br />
                    <b>Reward Amount: <%= Request["amount"]%> QT</b> 
                </td>
            </tr>


             <tr>
                <td colspan="3" align="center" >
                    <a href="#" id="surveyLink" class="btn btn-primary" onclick="toggleTable(true);">Begin Survey</a> 
                </td>
            </tr>

        </table>

        <table width="100%" id="surveyTable" style="display:none">
            <tr style="background-color: white; height: 100px;">

                 <td style="vertical-align: middle" >               
            
                      <h3>Survey</h3>
                      <br />
                     1. Overall, how satisfied or dissatisfied are you with our company? <br />
                     <asp:RadioButtonList runat="server" ID="Question1">
                         <asp:ListItem Text="&nbsp a). Very satisfied" Selected="True"></asp:ListItem>
                         <asp:ListItem Text="&nbsp b). Somewhat satisfied"></asp:ListItem>
                         <asp:ListItem Text="&nbsp c). Neither satisfied nor dissatisfied"></asp:ListItem>
                         <asp:ListItem Text="&nbsp d). Somewhat dissatisfied"></asp:ListItem>
                         <asp:ListItem Text="&nbsp e). Very dissatisfied"></asp:ListItem>                         
                     </asp:RadioButtonList>
                     <br /> <br />
                          2. How satisfied or dissatisfied are you with our Service Representatives? <br />
                     <asp:RadioButtonList runat="server" ID="Question2">
                         <asp:ListItem Text="&nbsp a). Very satisfied" ></asp:ListItem>
                         <asp:ListItem Text="&nbsp b). Somewhat satisfied" Selected="True"></asp:ListItem>
                         <asp:ListItem Text="&nbsp c). Neither satisfied nor dissatisfied"></asp:ListItem>
                         <asp:ListItem Text="&nbsp d). Somewhat dissatisfied"></asp:ListItem>
                         <asp:ListItem Text="&nbsp e). Very dissatisfied"></asp:ListItem>                         
                     </asp:RadioButtonList>


                </td>
            </tr>
            <tr style="background-color: white; height: 100px">

                 

                <td style="vertical-align: middle" width="60%" align="center">               
            

	              <%--  <a href="https://sim.cintworks.net/<%= Request["id"]%>/Complete" class="btn btn-primary">Complete</a> 
		            <a href="https://sim.cintworks.net/<%= Request["id"]%>/EarlyScreenOut" class="btn btn-primary">Cancel</a> 
		           --%> <%--<a href="https://sim.cintworks.net/<%= Request["id"]%>/QuotaFull" class="btn btn-primary">Quota Full</a> | 
		            <a href="https://sim.cintworks.net/<%= Request["id"]%>/QualityTerminate" class="btn btn-primary">Quality Terminate</a>--%>

                    <br />
                    <asp:Button ID="btnComplete" runat="server" class="btn btn-primary" Text="Complete" OnClick="btnComplete_Click" />
                    <asp:Button ID="btnCancel" runat="server" class="btn btn-primary" Text="Cancel" OnClick="btnCancel_Click" />

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
