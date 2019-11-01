<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="panel.aspx.cs" Inherits="prediqtWeb.panel" EnableEventValidation="false" MasterPageFile="cint.Master" %>

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
                    <center>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/cint/prediqt_logo_panel.png" Width="400px" />
                        </center>
                    </h1>
                <div style="text-align:right">Select Panelist: <a href="panel.aspx?id=108195917" runat="server" id="linkJohn">John (108195917)</a> | <a href="panel.aspx?id=108186073" runat="server" id="linkMiguel">Miguel (108186073)</a> | <a href="panel.aspx?id=108195918" runat="server" id="linkJennifer">Jennifer (108195918)</a></div>
            </div>
            <!-- /.col-lg-12 -->
        
      
        









         <div class="col-md-4 col-md-offset-4" id="logindiv" runat="server">
                
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                         <br />
            <center> <img src="../images/prediqt_logo.png" /></center>
                        </div>
                      <div class="panel-heading">
                        <h3 class="panel-title">Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form">
                            <fieldset>
                                <div class="form-group">
                                   <asp:TextBox ID="txtEmail" class="form-control" placeholder="E-mail" runat="server" Text="demo@prediqt.co"></asp:TextBox>                                  
                                </div>
                                <div class="form-group">
                                      <asp:TextBox ID="txtPassword" class="form-control" placeholder="Password"  type="password" Text="demo" runat="server"></asp:TextBox>                                    
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <asp:Button ID="btnLogin" class="btn btn-lg btn-success btn-block" runat="server" Text="Login" OnClick="btnLogin_Click" />
                                <asp:Label ID="lblError" ForeColor="Red" runat="server" Text="Invalid Credentials" Font-Size="Small" Visible="false" ></asp:Label>
                            </fieldset>
                        </form>
                        <br />
                       <p align="center">No Account? <a href="signup.aspx">Signup</a></p>
                    </div>
                    
                </div>
            </div>





          </div>


</asp:Content>
