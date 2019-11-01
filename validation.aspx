<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="validation.aspx.cs" Inherits="prediqtWeb.cint.validation" EnableEventValidation="true" MasterPageFile="cint.Master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

  <%--  <style>
        table, th, td {
            border: 0px solid black;
            padding: 10px;
        }

        table {
            border-spacing: 15px;
        }
    </style>

--%>

<%--


    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>--%>


    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script>
        function toggleTable(hide) {
            if (hide) {
                document.getElementById("surveyTable").style.display = "table";
                document.getElementById("surveyLink").style.display = "none";

            } else {
                document.getElementById("surveyTable").style.display = "none";
                // document.getElementById("surveyLink").onclick = toggleTable(true);
            }
        }
    </script>



      <div id="page-wrapper">
         
          
            <!-- /.row -->
            <div class="row">




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
                    <h1><b>Survey Validations</b></h1>
                </td>
            </tr>

            <%--  <tr>
                <td colspan="3" >
                    <h3><b><%= Request["title"]%></b></h3>
                    Thank you for considering this survey. There are 1 questions in the survey and should take approximately 2 minutes to complete.
                    <br />
                    <b>Reward Amount: <%= Request["amount"]%> QT</b>
                </td>
            </tr>--%>
        </table>

        <table width="100%" id="surveyTable">
            <tr style="background-color: white; height: 100px;">

                <td style="vertical-align: middle">



                    <asp:Repeater ID="rptSurveys" runat="server" >
                        <HeaderTemplate>
                            <table width="100%" class="table table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Survey Reference</th>
                                        <th>Panelist Member Id</th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>

                            <div >
                         
                            <tr style="background-color: #f1f1f1">
                                <td>
                                    <div id="SurveyId" runat="server" ><%# DataBinder.Eval(Container.DataItem, "ReferenceNumber") %></div>
                                </td>
                                <td>
                                    <div id="PanelistId" runat="server"><%# DataBinder.Eval(Container.DataItem, "memberId") %></div>
                                </td>
                                <td></td>
                                <td>
                                    <asp:Button ID="btnPass" runat="server" class="w3-button w3-green" Text="Pass" OnClick="btnPass_Onclick" width="90px"/>
                                    <asp:Button ID="btnFail" runat="server" class="w3-button w3-red" Text="Fail" OnClick="btnFail_Onclick" width="90px"/>
                                </td>
                            </tr>

                            <tr class="even gradeX">
                                <td></td>
                                <td style="font-size: smaller"><i><%# DataBinder.Eval(Container.DataItem, "Question1") %> </i></td>
                                <td style="font-size: smaller"><i><%# DataBinder.Eval(Container.DataItem, "Response1") %></i> </td>
                                <td></td>
                            </tr>
                            <tr class="even gradeX">
                                <td></td>
                                <td style="font-size: smaller"><i><%# DataBinder.Eval(Container.DataItem, "Question2") %> </i></td>
                                <td style="font-size: smaller"><i><%# DataBinder.Eval(Container.DataItem, "Response2") %></i> </td>
                                <td></td>
                            </tr>

                         </div>

                        </ItemTemplate>
                        <%--<AlternatingItemTemplate>
                            <tr class="even gradeX">
                                <td><%# DataBinder.Eval(Container.DataItem, "SurveyId") %> </td>
                                <td><%# DataBinder.Eval(Container.DataItem, "PanelistId") %> </td>
                                <td><%# DataBinder.Eval(Container.DataItem, "Pending") %> </td>
                                 <td><asp:Button id="btnButton2" runat="server"  class="w3-button w3-green" Text="Approve"/> 
                                     <asp:Button id="Button12" runat="server"  class="w3-button w3-red" Text="Deny"/>

                                 </td>
                            </tr>
                            <tr class="even gradeX">
                                <td></td>
                                  <td style="font-size:smaller"><i><%# DataBinder.Eval(Container.DataItem, "Question1") %> </i></td>
                                <td style="font-size:smaller"><i><%# DataBinder.Eval(Container.DataItem, "Response1") %></i> </td>
                                 <td></td>
                            </tr>

                        </AlternatingItemTemplate>--%>
                        <FooterTemplate>
                            </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>




                </td>
            </tr>




        </table>








        <%--<br>
<button class="w3-button w3-green" onclick="move()">Click Me</button> 
        --%>



        <%--   <center><asp:Label ID="lblScore" runat="server" style="font-size:8em" Text="0"></asp:Label></center>
        --%>
 


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


                
                <!-- /.panel-body -->
    </div>
            <!-- /.panel -->
    </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    </div>
    <!-- /#page-wrapper -->



</asp:Content>