<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="prediqtWeb.cint.Default" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Prediqt Blockhain</title>
  <%--  <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">--%>

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


 <%--   <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>--%>







    <script src="sweetalert2.all.min.js"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 and Android browser -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>





    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<body>


    
    <form runat="server">






        <table width="100%">
            <tr>
                <td>
                    <%--<img src="/images/prediqt_logo.png" hspace="30" />--%>

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

                <td colspan="3">
                    <center>
                    <h1><a href="survey_cint.aspx">START DEMO</a></h1>
                        </center>
                </td>
            </tr>


            <tr>
                <td colspan="3">



                   <%-- <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">


                        <ContentTemplate>

                            <asp:Timer ID="Timer1" runat="server" Interval="5000" OnTick="Timer1_Tick"></asp:Timer>


                            <asp:GridView ID="GridViewAssets" runat="server" AllowPaging="true" PageSize="20"  AutoGenerateColumns="false" CssClass="AspNet-GridView" CellPadding="10" Font-Names="Arial" Font-Size="Small" ForeColor="#333333" GridLines="None" Width="100%" 
                                OnRowCommand="GridViewAssets_RowCommand"
                             
                                >
                                <AlternatingRowStyle BackColor="White" />
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />


                                <Columns>                                
                                 
                                    

                                     <asp:TemplateField AccessibleHeaderText="Amount">
                                         <HeaderTemplate>Asset / Survey</HeaderTemplate>
                                        <ItemTemplate>

                                            <label id="lblAsset" runat="server" ><%# Eval("AssetName") %></label>
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                      <asp:TemplateField AccessibleHeaderText="Amount">
                                         <HeaderTemplate>Total Amount (PQT)</HeaderTemplate>
                                        <ItemTemplate>
                                            <b><%# Eval("Amount") %></b>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                        <asp:TemplateField AccessibleHeaderText="Issuer">
                                         <HeaderTemplate>Issuer</HeaderTemplate>
                                        <ItemTemplate>
                                            <%# Eval("Issuer") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField AccessibleHeaderText="Blockchain">
                                        <ItemTemplate>
                                            <a href='https://horizon.stellar.org/assets?asset_code=<%# Eval("AssetName") %>&asset_issuer=GDGVIA6C4AMZO6BNRGP4FHJOXUI5JEAX6MD3GX3ZAG74MSH5RIHK443B&order=desc' target="_blank">View on Blockchain</a>                                               
                                        </ItemTemplate>
                                    </asp:TemplateField>



                                   <asp:TemplateField>
                                      <ItemTemplate>
                                         
                                        <asp:Button ID="AddButton" runat="server" 
                                          CommandName="GoLive"      
                                              Visible='<%# showButton(Eval("Amount").ToString()) %>' 
                                          CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                          Text="Go Live" CausesValidation="false"  />
                                         
                                      </ItemTemplate> 
                                    </asp:TemplateField>


                                    <%-- <asp:TemplateField>
            <ItemTemplate>
                <asp:Button runat="server" Text="Reject" 
                Visible='<%# IsOverAgeLimit(Eval("Amount").ToString()) %>' 
                CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                CommandName="Select"/>
            </ItemTemplate>
        </asp:TemplateField>

                                    
                                   


                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>


                    </asp:UpdatePanel>--%>

                </td>
            </tr>

        </table>










        <%--<br>
<button class="w3-button w3-green" onclick="move()">Click Me</button> 
        --%>



        <%--   <center><asp:Label ID="lblScore" runat="server" style="font-size:8em" Text="0"></asp:Label></center>
        --%>
        <br /><br /><br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Delete" />
    </form>



</body>

</html>









