<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="survey_cint.aspx.cs" Inherits="prediqtWeb.survey_cint" EnableEventValidation="false" MasterPageFile="cint.Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        function tParticipants(txt) {
           // var at = txt.value;          
           tPrice(document.getElementById("<%= txtTotalPriceSlide.ClientID %>"));
       //     document.getElementById("txtContracts").innerHTML = at;
         //   document.getElementById("txtStacking").innerHTML = at * document.getElementById("<%= txtTotalPrice.ClientID %>").value;

        }

        function tPrice(txt) {

            var at = txt.value;

            //alert(at);
          //  alert(document.getElementById("<%= txtTotalRewardAmount.ClientID %>").value);
            document.getElementById("<%= txtTotalRewardAmount.ClientID %>").value = parseFloat((at /100) * document.getElementById("<%= txtParticipants.ClientID %>").value).toFixed(2)   ;
            
          //  document.getElementById("<%= txtTotalRewardAmount.ClientID %>").innerText = parseFloat((at / 100) * document.getElementById("<%= txtParticipants.ClientID %>").value).toFixed(2);


           // alert(document.getElementById("<%= txtTotalRewardAmount.ClientID %>").value);
            document.getElementById("txtTotalRewardAmountQT").innerText = (document.getElementById("<%= txtTotalRewardAmount.ClientID %>").value) / 2;

          
           // alert((document.getElementById("<%= txtTotalRewardAmount.ClientID %>").value) / 2);
            
        }
</script>










</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
        .ajax_slider_h_rail {
            position: relative;
            height: 18px;
            width: 400px;
            background: url('Images/1.png') repeat-x;
        }

        .ajax_slider_h_handle {
            height: 10px;
            width: 10px;
            position: absolute;
        }
    </style>


    <style>
        .headerCssClass {
            background-color: #FFFFFF;
            color: black;
            border: 0px solid black;
            padding: 15px;
        }

        .contentCssClass {
            background-color: #dcdee2;
            color: black;
            border: 0px dotted #dcdee2;
            padding: 15px;
        }

        .headerSelectedCss {
            background-color: #FFFFFF;
            color: black;
            border: 0px solid black;
            padding: 15px;
        }
    </style>


    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>






    <form role="form">


        <div id="page-wrapper">
         
            


            <!-- /.row -->
            <div class="row">


                <div class="col-lg-12">
                    <div class="panel panel-cint">
                        <div class="panel-heading">
                            <h4>PROJECT SETTING</h4>
                        </div>
                        <div class="panel-body" style="background-color: #f8f8f8">


                            <div class="row">
                                <div class="col-lg-8">
                                    <div class="form-group">

                                        <h4><b>Survey Categories</b> &nbsp<i class="fa fa-th-list fa-fw"></i></h4>
                                        Select the main categories your study is about in order to make feasibility estimation as accurate as possible.
                                           <asp:DropDownList ID="DropDownListCategory" runat="server" class="form-control"></asp:DropDownList>

                                        <hr />


                                        <table width="100%">

                                            <tr>
                                                <td width="33%">
                                                    <h4><b>Survey</b></h4>
                                                </td>
                                                <td width="33%">
                                                    <h4><b>Respondents</b></h4>
                                                </td>
                                                <td width="33%">
                                                    <h4><b>Data collection</b></h4>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <asp:CheckBox runat="server" Text="&nbsp Suitable for mobile" Font-Size="small" Font-Bold="false" Checked="true" /><br />
                                                    <asp:CheckBox runat="server" Text="&nbsp Suitable for tablet" Font-Size="small" Font-Bold="false" Checked="true" /><br />
                                                    <asp:CheckBox runat="server" Text="&nbsp Suitable for desktop" Font-Size="small" Font-Bold="false" Checked="true" /><br />
                                                    <asp:CheckBox runat="server" Text="&nbsp Requires webcam" Font-Size="small" Font-Bold="false" Checked="false" /><br />
                                                    <asp:CheckBox runat="server" Text="&nbsp Requires Flash" Font-Size="small" Font-Bold="false" Checked="false" /><br />

                                                </td>
                                                <td valign="top">

                                                    <asp:CheckBox runat="server" Text="&nbsp Restrict geographically" Font-Size="small" Font-Bold="false" Checked="true" /><br />
                                                    <asp:CheckBox runat="server" Text="&nbsp Prevent duplicates" Font-Size="small" Font-Bold="false" Checked="true" /><br />

                                                </td>
                                                <td valign="top">
                                                    <asp:Label runat="server" Font-Size="X-Small">Will this project collect personally identifiable information (PII)?</asp:Label>
                                                    <br />
                                                    <asp:CheckBox runat="server" Text="&nbsp Collects PII" Font-Size="small" Font-Bold="false" Checked="false" /><br />
                                                </td>
                                            </tr>
                                        </table>

                                        <hr />







                                        <div class="panel panel-cint">
                                            <div class="panel-heading">
                                                <h4>BASIC SETTINGS</h4>
                                            </div>
                                            <div class="panel-body">




                                                <table width="100%">

                                                    <tr>
                                                        <td width="50%">
                                                            <h4><b>Demographics</b></h4>
                                                        </td>
                                                        <td width="50%">
                                                            <h4><b>Survey-specific data</b></h4>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="top">Country: &nbsp
                                        <asp:DropDownList ID="DropDownListCountry" runat="server"></asp:DropDownList>
                                                            <br />
                                                            <br />

                                                            Gender: &nbsp
                                                <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal" Width="50%" Font-Bold="false">
                                                    <asp:ListItem Text="Male" Value="0" />
                                                    <asp:ListItem Text="Female" Value="1" />
                                                    <asp:ListItem Text="Both" Value="2" Selected="True" />
                                                </asp:RadioButtonList>


                                                            <br />

                                                            Minimum age:<asp:TextBox ID="txtAgeMinimum" MaxLength="2" runat="server" Text="18" Width="35px" TextMode="Number"></asp:TextBox>
                                                            Maximum age:<asp:TextBox ID="txtAgeMaximum" MaxLength="2" runat="server" Text="65" Width="35px" TextMode="Number"></asp:TextBox>


                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAgeMinimum" ErrorMessage="* Age should be a whole number between 18 and 100" ForeColor="Red"></asp:RequiredFieldValidator><br />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAgeMaximum" ErrorMessage="* Age should be a whole number between 18 and 100" ForeColor="Red"></asp:RequiredFieldValidator>




                                                        </td>
                                                        <td valign="top">


                                                            <table width="100%">
                                                                <tr>
                                                                    <td width="70%">Number of wanted completes:</td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtParticipants" class="form-control" Height="25px" runat="server" Width="100%" onchange="tParticipants(this)"  MaxLength="5">10</asp:TextBox></td>
                                                                </tr>

                                                                <tr>
                                                                    <td width="70%">Estimated incidence rate (IR):</td>
                                                                    <td>
                                                                        <asp:TextBox ID="TextBox2" class="form-control" Height="25px" runat="server" Width="100%"  MaxLength="5">100</asp:TextBox></td>
                                                                </tr>

                                                                <tr>
                                                                    <td width="70%">Estimated length of interview (LOI):</td>
                                                                    <td>
                                                                        <asp:TextBox ID="TextBox3" class="form-control" Height="25px" runat="server" Width="100%"  MaxLength="5">5</asp:TextBox></td>
                                                                </tr>

                                                                <tr>
                                                                    <td width="70%">Start date:</td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtStartDate" class="form-control" Height="25px" runat="server" Width="100%"></asp:TextBox></td>
                                                                </tr>

                                                                <tr>
                                                                    <td width="70%">Number of days in field:</td>
                                                                    <td>
                                                                        <asp:TextBox ID="TextBox5" class="form-control" Height="25px" runat="server" Width="100%"  MaxLength="5">7</asp:TextBox></td>
                                                                </tr>

                                                            </table>


                                                        </td>
                                                    </tr>
                                                </table>



                                            </div>
                                        </div>







                                        <%-- <label>TOTAL PARTICIPANTS</label>&nbsp<i class="fa fa-users fa-fw"></i><br />
                                        <br />
                                        <ajaxToolkit:MaskedEditExtender TargetControlID="txtParticipants" Mask="99,999"
                                            MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                                            MaskType="Number" InputDirection="RightToLeft" AcceptNegative="None" DisplayMoney="None"
                                            ErrorTooltipEnabled="True" runat="server" ID="mskD" />
                                        <asp:TextBox ID="txtParticipantsControler" Enabled="false" runat="server" Style="font-size: 30px; text-align: center" Width="120px"></asp:TextBox>
                                        <br />
                                        <br />
                                        <asp:TextBox ID="txtParticipants" runat="server" Width="100%" onchange="tParticipants(this)">500 </asp:TextBox>
                                        <table width="400px">
                                            <tr>
                                                <td width="33%">100</td>
                                                <td width="33%">5,000</td>
                                                <td width="33%">10,000</td>
                                            </tr>
                                        </table>

                                        <br />
                                        <br />

                                        <cc1:SliderExtender
                                            ID="SliderExtender1"
                                            runat="server"
                                            TargetControlID="txtParticipants"
                                            BoundControlID="txtParticipantsControler"
                                            Steps="100"
                                            Length="300"
                                            Minimum="100" Maximum="10000"></cc1:SliderExtender>--%>
                                    </div>








                                       <div class="panel panel-cint">
                                        <div class="panel-heading">
                                            <h4>QUALITY SCORE</h4>
                                        </div>
                                        <div class="panel-body">
                                           
                                              <h4><b>Minimum Quality Score</b></h4>


                                             <div class="form-group input-group">
                                        <%-- <span class="input-group-addon">$</span>--%>
                                        <ajaxToolkit:MaskedEditExtender TargetControlID="txtTotalPrice" Mask="99.99"
                                            MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                                            MaskType="Number" InputDirection="RightToLeft" AcceptNegative="None" DisplayMoney="None"
                                            ErrorTooltipEnabled="True" runat="server" ID="MaskedEditExtender1" />
                                        <asp:TextBox ID="txtTotalPrice" runat="server" class="form-control" Width="100px"  ReadOnly="true" Font-Size="XX-Large"></asp:TextBox>
                                        &nbsp;                                        
                                        
                                      <%--  <asp:Button ID="btnLogin" Width="120px" class="btn btn-success " runat="server" Text="Check Balance" />--%>
                                        <%--<span class="input-group-addon">.00</span>--%>
                                    </div>


                                    <asp:TextBox ID="txtTotalPriceSlide" runat="server" Width="100%" onchange="tPrice(this)" >500</asp:TextBox>
                                    <table width="400px">
                                        <tr>
                                            <td width="36%">0</td>
                                            <td width="36%">500</td>
                                            <td width="36%">1000</td>
                                        </tr>
                                    </table>
                                    <cc1:SliderExtender
                                        ID="SliderExtender2"
                                        runat="server"
                                        TargetControlID="txtTotalPriceSlide"
                                        BoundControlID="txtTotalPrice"
                                        Decimals="0"
                                        Length="300"
                                        Minimum="0" Maximum="1000"></cc1:SliderExtender>

                                    <br />


                                    <div class="form-group">
                                        <ajaxToolkit:MaskedEditExtender TargetControlID="txtTotalRewardAmount" Mask="9999.99"
                                            MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                                            MaskType="Number" InputDirection="RightToLeft" AcceptNegative="None" DisplayMoney="None"
                                            ErrorTooltipEnabled="True" runat="server" ID="MaskedEditExtender2" />
                                        <label>Total Reward Amount </label><i class="fa fa-certificate fa-fw"></i><br />
                                        $ <asp:TextBox ID="txtTotalRewardAmount" MaxLength="10"  runat="server" Text="50.00" Width="80px" Height="30px" Enabled="true"></asp:TextBox>  (Token Equivalent = <label id="txtTotalRewardAmountQT">25.00</label> QT)
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTitle" ErrorMessage="* Please Enter the Title" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>


                                            <br />


                                               <label>Validation </label><br />
                                             <asp:CheckBox ID="checkboxValidation" runat="server" Text="&nbsp Do you Want to Validate the Participant Results?" Font-Size="small" Font-Bold="false" Checked="false" />
                                        </div>
                                       </div>












                                    <div class="panel panel-cint">
                                        <div class="panel-heading">
                                            <h4>SUMMARY</h4>
                                        </div>
                                        <div class="panel-body">

                                            <table width="100%" style="border-spacing: 50px">
                                                <tr>
                                                    <td width="20%" height="50px">Project name:</td>
                                                    <td width="30%" height="50px">
                                                        <asp:TextBox ID="txtTitle" Width="200px" MaxLength="100" class="form-control" runat="server" Text="Survey 2018 Test"></asp:TextBox></td>
                                                    <td width="20%" height="50px">&nbsp Contact name:</td>
                                                    <td width="30%" height="50px">
                                                        <asp:TextBox ID="TextBox6" Width="200px" MaxLength="100" class="form-control" runat="server" Text="Prediqt"></asp:TextBox></td>
                                                </tr>

                                                <tr>
                                                    <td width="20%" height="50px">PO number:</td>
                                                    <td width="30%" height="50px">
                                                        <asp:TextBox ID="TextBox7" Width="200px" MaxLength="100" class="form-control" runat="server" Text=""></asp:TextBox></td>
                                                    <td width="20%" height="50px">&nbsp Contact email:</td>
                                                    <td width="30%" height="50px">
                                                        <asp:TextBox ID="TextBox8" Width="200px" MaxLength="100" class="form-control" runat="server" Text="email@prediqt.co"></asp:TextBox></td>
                                                </tr>


                                                <tr>
                                                    <td width="20%" height="50px">Job number:</td>
                                                    <td width="30%" height="50px">
                                                        <asp:TextBox ID="TextBox9" Width="200px" MaxLength="100" class="form-control" runat="server" Text=""></asp:TextBox></td>
                                                    <td width="20%" height="50px">&nbsp Contact telephone:</td>
                                                    <td width="30%" height="50px">
                                                        <asp:TextBox ID="TextBox10" Width="200px" MaxLength="100" class="form-control" runat="server" Text=""></asp:TextBox></td>
                                                </tr>



                                            </table>

                                        </div>
                                    </div>


                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle" ErrorMessage="* Please Enter the Title" ForeColor="Red"></asp:RequiredFieldValidator>







                                    <div class="panel panel-cint">
                                        <div class="panel-heading">
                                            <h4>SURVEY LINKS SETUP - TARGET GROUP 1</h4>
                                        </div>
                                        <div class="panel-body">
                                            Connect your survey tool to Access/Pro. The live link is used while your project is in field.
                                            <br />
                                            You can have a separate link for testing or use the same live link.

                                            <hr />

                                            <h4><b>Live link</b></h4>

                                            <p style="font-size: smaller">
                                                Examples:<br />
                                                http://www.example.com/survey.html?id=[ID]<br />
                                                http://www.example.com/survey.html?id=[ID]&gender=[S]<br />
                                            </p>
                                            Link template:<br />
                                            <asp:TextBox ID="txtlinkTemplate" MaxLength="100" class="form-control" runat="server" Text="http://prediqtweb.azurewebsites.net/cint/survey.aspx?id=[ID]&memberId=[M]"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtlinkTemplate" ErrorMessage="* Please Enter the Link" ForeColor="Red"></asp:RequiredFieldValidator>




                                            <h4><b>Test link</b></h4>
                                            Link template:<br />
                                            <asp:TextBox ID="txttestLinkTemplate" MaxLength="100" class="form-control" runat="server" Text="http://prediqtweb.azurewebsites.net/cint/survey.aspx?id=[ID]&memberId=[M]"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txttestLinkTemplate" ErrorMessage="* Please Enter the Link" ForeColor="Red"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>



                                  


                                    <center>
                                               <asp:Button ID="btnCancel" runat="server" class="btn btn-outline btn-primary btn-lg" Text="Cancel" OnClick="btnCancel_Click" UseSubmitBehavior="false" />


                                    <asp:Button ID="btnSave" runat="server" class="btn btn-primary btn-lg" Text="Create" OnClick="btnSave_Click" />
                     </center>

                                    
                                 </div>
                                
    
                                <div >
                                <h4><b>Prediqt Wallet</b></h4>

                                     <asp:HyperLink ID="HyperLinkWallet" runat="server" Target="_blank" NavigateUrl="https://horizon.stellar.org/accounts/GDJ45NGL6ZZ4B4ARKGMCKO6Q2X5PBKULWCKJSFMAQI6D4AQBCHYXWRQI">Client Wallet</asp:HyperLink>                        
                                    <br />
                                    <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" NavigateUrl="https://horizon.stellar.org/accounts/GDJ45NGL6ZZ4B4ARKGMCKO6Q2X5PBKULWCKJSFMAQI6D4AQBCHYXWRQI/payments?limit=10&order=desc">Last Transactions</asp:HyperLink>
                        

                                    

                                    </div>


                                </div>
                                 
                               </div>
            
                        </div>

                                  
                                 





                                    <%--                                <div class="col-lg-4">
                                    <label>PREDIQT</label><br />

                                    <div style="background-color: #ffffff; padding: 10px">

                                        <font size="1">
                                           Asset Code: PQT <br />
                                            Asset Issuer: GD7CN3HBSZBG44NPEOFNPOLDTO462BBXBXJEBMI3TUWBN44YGJD2NDAB 
                                             <a href="http://testnet.stellarchain.io/address/GD7CN3HBSZBG44NPEOFNPOLDTO462BBXBXJEBMI3TUWBN44YGJD2NDAB" target="_blank">(VIEW)</a>
                                             <br />
                                             </font>

                                    </div>
                                </div>





                                <div class="col-lg-4">

                                    <div class="panel panel-green">
                                        <div class="panel-heading">
                                            <div class="row">
                                                <div class="col-xs-3">
                                                    <i class="fa fa-tasks fa-5x"></i>
                                                </div>
                                                <div class="col-xs-9 text-right">
                                                    <div class="huge">
                                                        <label id="txtContracts">500</label>
                                                    </div>
                                                    <div>Contracts</div>
                                                </div>
                                            </div>
                                        </div>
                                        <a href="http://testnet.stellarchain.io/address/GC7Q7IJ2VEE7DTZWIA6723KGRNH2S72MXRYSMTCIXXV43H3R6WGMA6X5" target="_blank">
                                            <div class="panel-footer" style="background-color: #FFFFFF">
                                                <span class="pull-left">View Blockchain</span>
                                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                                <div class="clearfix"></div>
                                            </div>
                                        </a>


                                    </div>
                                    <div class="panel panel-yellow">
                                        <div class="panel-heading">
                                            <div class="row">
                                                <div class="col-xs-3">
                                                    <i class="fa fa-shopping-cart fa-5x"></i>
                                                </div>
                                                <div class="col-xs-9 text-right">
                                                    <div class="huge">
                                                        <label id="txtStacking">250</label>
                                                    </div>
                                                    <div>PQT Staking</div>
                                                </div>
                                            </div>
                                        </div>
                                        <a href="http://testnet.stellarchain.io/address/GC7Q7IJ2VEE7DTZWIA6723KGRNH2S72MXRYSMTCIXXV43H3R6WGMA6X5" target="_blank">
                                            <div class="panel-footer" style="background-color: #FFFFFF">
                                                <span class="pull-left">View Blockchain</span>
                                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                                <div class="clearfix"></div>
                                            </div>
                                        </a>
                                    </div>

                                </div>

                            </div>--%>






                                    <%--
                                    <div class="form-group">
                                        <label>Text Input with Placeholder</label>
                                        <input class="form-control" placeholder="Enter text">
                                    </div>
                                    <div class="form-group">
                                        <label>Static Control</label>
                                        <p class="form-control-static">email@example.com</p>
                                    </div>
                                    <div class="form-group">
                                        <label>File input</label>
                                        <input type="file">
                                    </div>

                                    <div class="form-group">
                                        <label>Checkboxes</label>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="">Checkbox 1
                                               
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="">Checkbox 2
                                               
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="">Checkbox 3
                                               
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Inline Checkboxes</label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox">1
                                           
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox">2
                                           
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox">3
                                           
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <label>Radio Buttons</label>
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>Radio 1
                                               
                                            </label>
                                        </div>
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">Radio 2
                                               
                                            </label>
                                        </div>
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="optionsRadios" id="optionsRadios3" value="option3">Radio 3
                                               
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Inline Radio Buttons</label>
                                        <label class="radio-inline">
                                            <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline1" value="option1" checked>1
                                           
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline2" value="option2">2
                                           
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline3" value="option3">3
                                           
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <label>Selects</label>
                                        <select class="form-control">
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Multiple Selects</label>
                                        <select multiple class="form-control">
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>--%>
                                    <%-- <button type="submit" class="btn btn-default">Submit Button</button>
                                    <button type="reset" class="btn btn-default">Reset Button</button>--%>


                                    <%--                                    <h2>Demographics</h2>


                                   









                                    <div class="form-group">
                                        <label>Age</label>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="">18-24                                               
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="">25-34                                               
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="">35-44                                               
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="">45-54                                               
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="">55-64                                               
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="">65+                                               
                                            </label>
                                        </div>

                                    </div>





                                    --%>











                                    <%--
                                <form role="form">
                                    <fieldset disabled>
                                        <div class="form-group">
                                            <label for="disabledSelect">Disabled input</label>
                                            <input class="form-control" id="disabledInput" type="text" placeholder="Disabled input" disabled>
                                        </div>
                                        <div class="form-group">
                                            <label for="disabledSelect">Disabled select menu</label>
                                            <select id="disabledSelect" class="form-control">
                                                <option>Disabled select</option>
                                            </select>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox">Disabled Checkbox
                                               
                                            </label>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Disabled Button</button>
                                    </fieldset>
                                </form>
                                <h1>Form Validation States</h1>
                                <form role="form">
                                    <div class="form-group has-success">
                                        <label class="control-label" for="inputSuccess">Input with success</label>
                                        <input type="text" class="form-control" id="inputSuccess">
                                    </div>
                                    <div class="form-group has-warning">
                                        <label class="control-label" for="inputWarning">Input with warning</label>
                                        <input type="text" class="form-control" id="inputWarning">
                                    </div>
                                    <div class="form-group has-error">
                                        <label class="control-label" for="inputError">Input with error</label>
                                        <input type="text" class="form-control" id="inputError">
                                    </div>
                                </form>
                                <h1>Input Groups</h1>
                                <form role="form">
                                    <div class="form-group input-group">
                                        <span class="input-group-addon">@</span>
                                        <input type="text" class="form-control" placeholder="Username">
                                    </div>
                                    <div class="form-group input-group">
                                        <input type="text" class="form-control">
                                        <span class="input-group-addon">.00</span>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-eur"></i>
                                        </span>
                                        <input type="text" class="form-control" placeholder="Font Awesome Icon">
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon">$</span>
                                        <input type="text" class="form-control">
                                        <span class="input-group-addon">.00</span>
                                    </div>
                                    <div class="form-group input-group">
                                        <input type="text" class="form-control">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </span>
                                    </div>
                                </form>--%>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
    </form>

    </div>
                    <!-- /.col-lg-6 (nested) -->

    <center>
                                </center>



    <!-- /.row (nested) -->
    </div>
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
