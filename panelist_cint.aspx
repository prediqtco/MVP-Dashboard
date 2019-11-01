<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="panelist_cint.aspx.cs" Inherits="prediqtWeb.panelist_cint" EnableEventValidation="false" MasterPageFile="cint.Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">










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








    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/cint/cintlogopanel.png" Width="300px" />
                    </h1>
                <%--<div style="text-align:right">Select Panelist: <a href="panel.aspx?id=108195917">John (108195917)</a> | <a href="panel.aspx?id=108186073">Miguel (108186073)</a> | <a href="panel.aspx?id=108195918">Jennifer (108195918)</a></div>--%>
            </div>
            <!-- /.col-lg-12 -->
        
        </div>
        
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h2>Welcome, <asp:Label ID="lblPanelistName" runat="server" /> </h2>
                        Gender: <asp:Label ID="lblPanelistGender" runat="server" /> | Age: <asp:Label ID="lblPanelistAge" runat="server" /> | Cint Id: <asp:Label ID="lblPanelistCintId" runat="server" /> | Prediqt Id: <asp:Label ID="lblPanelistPrediqtId" runat="server" />
                       |
                        <asp:HyperLink ID="HyperLinkWallet" runat="server" Target="_blank">Panelist Wallet</asp:HyperLink>
                       <br />Quality Score: <asp:Label ID="lblQualityScore" runat="server" text="500" Font-Size="X-Large"/>  - Last Change: <asp:Label ID="lblQualityScorePoints" runat="server" text="+1" Font-Size="Medium" ForeColor="Green"/> 
                       
                    </div>
                    <div class="panel-body" >

                        <form role="form">


                               <div class="alert alert-success">
                                 <h4>Survey Opportunities</h4>
                                   <i>Check your survey opportunities every day. Complete the surveys to get more Tokens.</i>
                                </div>

                       
                            
                            <div class="row">
                                <div class="panel-body">
                                  


                                     <asp:Repeater ID="rptOportunities" runat="server">
                            <HeaderTemplate>
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>                                    
                                    <th>Project Id</th>
                                   <th>Reference</th>
                                    <th>Survey Url</th>
                                    
                                      <th>Length</th>
                                              <th>End Date</th>
                                </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                 <tr class="odd gradeX">
                                   
                                       <td><%# DataBinder.Eval(Container.DataItem, "projectid") %> </td>
                                        <td><%# DataBinder.Eval(Container.DataItem, "referencenumber") %> </td>
                                   <td><a href="<%# DataBinder.Eval(Container.DataItem, "url") %>" target="_blank">Start Survey</a></td> 
                                 
                                      <td><%# DataBinder.Eval(Container.DataItem, "length") %> min. </td>
                                      <td><%# DataBinder.Eval(Container.DataItem, "enddate") %> </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                  <tr class="even gradeX">
                                     
                                       <td><%# DataBinder.Eval(Container.DataItem, "projectid") %> </td>
                                      <td><%# DataBinder.Eval(Container.DataItem, "referencenumber") %> </td>
                                     <td><a href="<%# DataBinder.Eval(Container.DataItem, "url") %>" target="_blank">Start Survey</a></td> 
                                        <%--       <td><%# DataBinder.Eval(Container.DataItem, "price") %> QT </td>--%>
                                      <td><%# DataBinder.Eval(Container.DataItem, "length") %> min. </td>
                                      <td><%# DataBinder.Eval(Container.DataItem, "enddate") %> </td>
                                </tr>

                            </AlternatingItemTemplate>
                            <FooterTemplate>
                                </tbody>
                            </table>
                            </FooterTemplate>
                        </asp:Repeater>


                                </div>


                            </div>

















                            <div class="row">
                                <div class="col-lg-6">                                  


                                        <asp:Repeater ID="rptPanelists" runat="server">
                            <HeaderTemplate>
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                    <th>Id</th>

                                    <th>Name</th>
                                    <th>Gender</th>
                                   <th>Age</th>

                                </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                 <tr class="odd gradeX">
                                    <td><%# ((ApiBridge.JsonCintPanelPanelist)Container.DataItem).key %> </td>
                                     <td><%# ((ApiBridge.JsonCintPanelPanelist)Container.DataItem).first_name %> <%# ((ApiBridge.JsonCintPanelPanelist)Container.DataItem).last_name %></td>
                                     <td><%# ((ApiBridge.JsonCintPanelPanelist)Container.DataItem).gender %> </td>
                                     <td><%# DateTime.Now.Year - Convert.ToInt16(((ApiBridge.JsonCintPanelPanelist)Container.DataItem).year_of_birth) %> </td>
                                  <%--  <td><%#((ApiBridge.JsonActionTask)Container.DataItem).title%></td>
                                    <td><%#((ApiBridge.JsonActionTask)Container.DataItem).numRespondents%></td>
                                     <td><%# ((ApiBridge.JsonActionTask)Container.DataItem).startDate %></td>
                                       <td><%# ((ApiBridge.JsonActionTask)Container.DataItem).endDate %></td>
                                      <td class="center"><a href="survey_edit.aspx?id=<%# ((ApiBridge.JsonActionTask)Container.DataItem).id %>">edit</a></td>
                                     <td class="center"><a href="question.aspx?id_survey=<%# ((ApiBridge.JsonActionTask)Container.DataItem).id %>">Questions</a></td>--%>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                  <tr class="even gradeX">
                                       <td><%# ((ApiBridge.JsonCintPanelPanelist)Container.DataItem).key %> </td>
                                       <td><%# ((ApiBridge.JsonCintPanelPanelist)Container.DataItem).first_name %> <%# ((ApiBridge.JsonCintPanelPanelist)Container.DataItem).last_name %></td>
                                      <td><%# ((ApiBridge.JsonCintPanelPanelist)Container.DataItem).gender %> </td>
                                      <td><%# DateTime.Now.Year - Convert.ToInt16(((ApiBridge.JsonCintPanelPanelist)Container.DataItem).year_of_birth) %> </td>
                                  <%--  <td><%#((ApiBridge.JsonActionTask)Container.DataItem).title%></td>
                                    <td><%#((ApiBridge.JsonActionTask)Container.DataItem).numRespondents%></td>
                                     <td><%# ((ApiBridge.JsonActionTask)Container.DataItem).startDate %></td>
                                       <td><%# ((ApiBridge.JsonActionTask)Container.DataItem).endDate %></td>
                                      <td class="center"><a href="survey_edit.aspx?id=<%# ((ApiBridge.JsonActionTask)Container.DataItem).id %>">edit</a></td>
                                     <td class="center"><a href="question.aspx?id_survey=<%# ((ApiBridge.JsonActionTask)Container.DataItem).id %>">Questions</a></td>--%>
                                </tr>

                            </AlternatingItemTemplate>
                            <FooterTemplate>
                                </tbody>
                            </table>
                            </FooterTemplate>
                        </asp:Repeater>


                                </div>


                            </div>

























                                <!-- /.col-lg-6 (nested) -->
                        </form>

                    </div>
                    <!-- /.col-lg-6 (nested) -->
                    <div class="col-lg-6">
                        



                    </div>
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
