<!DOCTYPE html>
<!--[if lt IE 7]><html lang="en" class=”ie6”><![endif]-->
<!--[if IE 7]><html lang="en" class=”ie7”><![endif]-->
<!--[if IE 8]><html lang="en" class=”ie8”><![endif]-->
<!--[if IE 9]><html lang="en" class=”ie9”><![endif]-->
<!--[if gt IE 9]><html lang="en"><![endif]-->
<!--[if !IE]>--><html lang="en"><!--<![endif]-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>EHR- Track Registration</title>
        <link href="page_style.css" rel="stylesheet" type="text/css" />
        <link type="text/css" href="themes/base/jquery.ui.all.css" rel="stylesheet" />
        <script type="text/javascript" src="js/jquery-1.4.2.js"></script>
        <script src="js/jquery.tools.min.js"></script>
        <script type="text/javascript" src="js/myutils.js"></script>
        <script type="text/javascript" src="external/jquery.bgiframe-2.1.1.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.widget.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.mouse.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.button.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.draggable.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.position.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.resizable.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.dialog.js"></script>
        <script type="text/javascript" src="ui/jquery.effects.core.js"></script>
        <script type="text/javascript">
            $(document).ready(function()
            {
                timer();
                links();
                showprocessor();
            }
            );

            $(function() {
                $("#dialog").dialog({
                    autoOpen: false,
                    modal: true,
                    height: 250,
                    width: 400,
                    buttons: {
                               OK: function() {
                            $(this).dialog('close');
                            if (document.frmreg.txtregid.value != "")
                            {
                                document.frmreg.reset();
                                document.frmreg.txtregid.focus();
                            }
                            else
                            {
                                document.frmreg.reset();
                                document.frmreg.npi.focus();
                            }
                        }
                    }
                });

                $('#regidsearch').click(function() {
                    var pLoad = false;
                    if (document.frmreg.txtregid.value == "")
                    {
                        $('#dialog').text('Please enter a valid registration ID.');
                        $('#dialog').dialog('open');
                        return false;
                    }

                    if (document.frmreg.txtregid.value != "1357924680")
                    {
                        var myTimer = {};
                        OpenProcessor();
                        myTimer = $.timer(2500, function() {
                            $('#dialog').text('The Registration Id ' + document.frmreg.txtregid.value + ' entered could not be found from the updates received from NLR. Please checkback again to register for MEDICAID INCENTIVE PAYMENT PROGRAM.');
                            $('#dialog').dialog('open');
                            return false;
                        });
                    }
                    else
                    {
                        var myTimer = {};
                        OpenProcessor();
                        myTimer = $.timer(2500, function() {
                            // Display hello message when timer goes off
                            //alert("hello");
                            window.open("startregistration.jsp", '_self');
                        });
                    }
                });

                $('#npitaxidsearch').click(function() {
                    if (document.frmreg.npi.value == "")
                    {
                        $('#dialog').text('Please enter a valid NPI, TaxID/SSN combination.');
                        $('#dialog').dialog('open');
                        return false;
                    }
                    if (document.frmreg.npi.value != "1033366513") {
                        var myTimer = {};
                        OpenProcessor();
                        myTimer = $.timer(2500, function() {
                            $('#dialog').text('The NPI TAXID/SSN combination ' + document.frmreg.npi.value + ', ' + document.frmreg.taxid.value + ' entered could not be found from the updates received from NLR. Please checkback again to register for MEDICAID INCENTIVE PAYMENT PROGRAM.');
                            $('#dialog').dialog('open');
                            return false;
                        });
                    }
                    else {
                        var myTimer = {};
                        OpenProcessor();
                        myTimer = $.timer(2500, function() {
                            window.open("startregistration.jsp", '_self');
                        });
                    }
                });

            });

            function getWidthHeigth()
            {

                var sHeight = document.body.clientHeight;
                if (sHeight >= 600) {
                    sContextheight = 10;
                } else if (sHeight >= 500) {
                    sContextheight = 20;
                } else if (sHeight >= 400) {
                    sContextheight = 40;
                } else if (sHeight >= 300) {
                    sContextheight = 60;
                } else if (sHeight >= 200) {
                    sContextheight = 80;
                } else {
                    sContextheight = 85;
                }


                sHeight = sHeight * 0.65;
                var sWidth = document.body.clientWidth;

                sHeight = sHeight - sContextheight;
                if (sHeight <= 0) {
                    sHeight = 10;
                }
                if (document.getElementById('templatemo_content') != null)
                {

                    document.getElementById('templatemo_content').style.height = sHeight + 'px';
                }

            }
        </script>
    </head>
    <body onLoad="document.frmreg.txtregid.focus()">
        <div id="templatemo_banner_wrapper">

            <div id="templatemo_banner">

                <div id="banner_content">
                    <table width="100%" border="0"  cellspacing="0">
                        <tr>
                            <td width="50%"  align="left"><img height="105" src="images/help.png"/></td>
                            <td align="right"><img height="100" src="images/home.png"/></td>
                            <tr>
                                </table>


                                </div>

                                </div> <!-- end of templatemo_banner -->

                                </div> 
        <form action="findRegistration"name="frmreg" id="form1">
                                    <div id="templatemo_menu_wrapper">
                                        <div id="templatemo_menu"> 
                                            <ul>
                                               
                                                    <li><a href="index" id="homep" class="modalInput" rel="#showprocessor"><span></span>Home</a></li>
                                                    <li><a href="grievanceDetails"  id="grievance" class="modalInput" rel="#showprocessor"><span></span>Grievance</a></li>
                                                    <li><a href="trackRegistrationList"  id="track" class="modalInput" rel="#showprocessor"><span></span>Track</a></li>
                                                
                                            </ul>  	

                                        </div> <!-- end of templatemo_menu -->

                                    </div> <!-- end of templatemo_menu_wrapper -->

                                    <div id="templatemo_content">
                                        <div class="section_w940">
                                            <div class="product_box margin_r_20">
                                                <img src="images/find.png" alt="image 2" /><h2>Find Registration</h2>
                                                <p>Enter the Registration ID or a combination of NPI and TAX ID/SSN to retrieve the information as received from National Level Repository (NLR).</p>           
                                                <div class="cleaner"></div>
                                            </div>
                                            <div class="section_w450">
                                                 <fieldset>
                                                     <h2>Search NLR Information - Option 1 </h2>
                                                    <table >
                                                        <tr>
                                                            <td><span>Registration ID</span></td>
                                                            <td>:</td>
                                                            <td><input type="text" size="10" name="txtregid"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <a href="startRegistration" id="regidsearch" onMouseOver="over_button('Search', 'images/Search_Down.png')"
                                                                   onMouseOut="up_button('Search', 'images/Search_Up.png')"><img src="./images/Search_Up.png" name="Search" id="Search" /></a>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </fieldset>
                                                <h2>OR</h2>
                                                <fieldset>
                                                    <h2>Search NLR Information - Option 2 </h2>
                                                    <table > 
                                                        <tr>
                                                            <td>NPI:</td>
                                                            <td>:</td>
                                                            <td><input type="text" size="10" class="required" name="npi" minlength="10"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>TAX ID / SSN</td>
                                                            <td>:</td>
                                                            <td><input type="text" size="10" name="taxid"></td>
                                                        </tr>
                                                        <tr>
                                                            <td><a href="#" id="npitaxidsearch" onMouseOver="over_button('Search1', 'images/Search_Down.png')" 
                                                                   onMouseOut="up_button('Search1', 'images/Search_Up.png')"><img src="./images/Search_Up.png" name="Search1" id="Search1" /></a>
                                                            </td>

                                                        </tr>
                                                    </table>
                                                </fieldset>
                                                <div class="cleaner"></div>
                                            </div>
                                            <div class="cleaner"></div>
                                        </div><!-- section_w940 -->
                                        <div class="section_w940">
                                            <div class="cleaner"></div>
                                        </div>
                                    </div> <!-- end of templatemo_content -->
                                    <div class="processor" id="showprocessor">
                                        <table><tr><td><img src="images/red-processor-small1.gif"/></td><td><h4 class="redclass">&nbsp;&nbsp;Searching.....></h4></td><tr></table>
                                                                <div class="close" id="CloseBtn"></div>
                                                                </div>
                                                                <a class="modalInput" rel="#showprocessor" id="showProcessor" ></a>
                                                                <div id="templatemo_content_bottom"></div>
                                                                <div id="templatemo_footer">  
                                                                    Copyright © 2010 <a href="grievanceDetails">grievance</a> | Development
                                                                </div> <!-- end of footer -->

                                                                <div id="dialog" title='<img src="images/alert.png"/> Invalid Registration Details'>
                                                                </div>

                                                                </form>
                                                                <script>
                                                                    window.onresize = function ResizeWindow_maintemplate() {
                                                                        getWidthHeigth();
                                                                    };
                                                                    getWidthHeigth();
                                                                </script>
                                                                </body>
                                                                </html>