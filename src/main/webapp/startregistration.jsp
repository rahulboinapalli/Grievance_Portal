<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>EHR- Track Registration</title>
        <link href="page_style.css" rel="stylesheet" type="text/css" />
        <link type="text/css" href="themes/base/jquery.ui.all.css" rel="stylesheet" />
        <script type="text/javascript" src="js/jquery-1.4.2.js"></script>
        <script src="./js/jquery.tools.min.js"></script>
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
        <link type="text/css" href="jquery_dialog.css" rel="stylesheet" />
        <script type="text/javascript" src="js/slidedeck.jquery.lite.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.datepicker.js"></script>
        
        <style type="text/css">
            div#users-contain { width: 650px; margin: 10px 0; }
            div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
            div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
            .ui-dialog .ui-state-error { padding: .3em; }
            .validateTips { border: 1px solid transparent; padding: 0.3em; }

        </style>
        <style type="text/css">
            #dhtmltooltip{
                position: absolute;
                border: 1px solid #2B3856;
                width: 150px;
                padding:10px;
                background-color: lightyellow;
                visibility: hidden;
                z-index: 100;
                font: normal 0.9em/1.2em arial, helvetica, sans-serif;
                filter: progid:DXImageTransform.Microsoft.Shadow(color=gray,direction=115);
            }

            /* tooltip styling. by default the element to be styled is .tooltip  */
            .tooltip {
                display:none;
                background:transparent url(images/black_arrow.png);
                font-size:12px;
                height:70px;
                width:160px;
                padding:25px;
                color:#fff;
            }

            /* style the trigger elements */
            #demo img {
                border:0;
                cursor:pointer;
                margin:0 8px;
            }
        </style>
        <script type="text/javascript">
            //jQuery.timer = function(time, func, callback) {
                //var a = {timer: setTimeout(func, time), callback: null}
                //if (typeof(callback) == 'function') {
                   // a.callback = callback;
                //}
                //return a;
            //};
            $(function() {
		$("#exclusionsDate").datepicker();
                $("#federalDateOfBirth").datepicker();
                $("#expiryDate").datepicker();

            });
        </script>
        <script type="text/javascript">
            $(document).ready(function()
            {
               var status = '${SUBMIT_STATUS}';
               if(status != null && status != "")
                alert(status);
                //timer();
                links();
                showprocessor();
            }
            );
        </script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('#pr').hide(); // hide the div of slide deck on login.
                $('#pd').hide(); // hide the div of slide deck on login.
                $('#fq').hide(); // hide the div of slide deck on login.
                $('#hs').hide(); // hide the div of slide deck on login.
                $('#pa').hide(); // hide the div of slide deck on login.
                $('#gp').hide(); // hide the div of slide deck on login.
                $('#mp').hide(); // hide the div of slide deck on login.
                $('#mf').hide(); // hide the div of slide deck on login.
                $('#am').hide(); // hide the div of slide deck on login.
                $('#oc').hide(); // hide the div of slide deck on login.


            });

            $(function() {
                $("#dgSubmitReg").dialog({
                    autoOpen: false,
                    modal: true,
                    buttons: {
                        Ok: function() {
                            $(this).dialog('close');
                            var myTimer = {};
                            OpenProcessor();
                            myTimer = $.timer(2500, function() {
                                // Display hello message when timer goes off
                                //alert("Saved successfully!");
//                                window.open("registrationack.jsp", '_self');
                                window.open("startregistration.jsp", '_self');
                            });

                        },
                        Cancel: function()
                        {
                            $(this).dialog('close');
                        }
                    }

                });
                $('#submit').click(function() {
//				alert('checked '+document.forms[0].terms1.checked);
                    if (!document.forms[0].terms1.checked)
                    {
                        $('#dgAcceptTerms').text('Please accept the terms and conditions before submitting the registration');
                        $('#dgAcceptTerms').dialog('open');
                        return false;
                    }
                    else
                    {
                        $('#dgSubmitReg').text('Are you sure you want to submit the Registration for state review?');
                        $('#dgSubmitReg').dialog('open');

                    }
                });
            });
            $(function() {
                $("#dgAcceptTerms").dialog({
                    autoOpen: false,
                    modal: true,
                    buttons: {
                        OK: function() {
                            $(this).dialog('close');
                        }
                    }
                });


            });

            $(function() {
                // a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
                $("#dialog").dialog("destroy");
                var pstart = $("#periodstart");
                $("#dialog-elig-form").dialog({
                    autoOpen: false,
                    height: 600,
                    width: 600,
                    modal: true,
                    buttons: {
                        'Save': function() {
                            var bValid = true;
                            var pstartvalue = window.document.getElementById("periodstart").value;
                            var periodendvalue = window.document.getElementById("periodend").value;
                            var certamtvalue = window.document.getElementById("certamt").value;
                            document.getElementById("ps1").innerHTML = pstartvalue;
                            document.getElementById("pe1").innerHTML = periodendvalue;
                            document.getElementById("ea1").innerHTML = certamtvalue;
                            document.getElementById("pt1").innerHTML = "N";
                            document.getElementById("fq1").innerHTML = "N";

                            if (bValid) {

                                $(this).dialog('close');
                            }
                        },
                        Cancel: function() {
                            $(this).dialog('close');
                        }
                    },
                });



                $('#addBtn')
                        .button()
                        .click(function() {
                    $('#dialog-elig-form').dialog('open');
                    return false;
                });


            });

            $(function() {
                // a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
                $("#dialog").dialog("destroy");

                $("#dialog-upload").dialog({
                    autoOpen: false,
                    height: 175,
                    width: 300,
                    modal: true,
                    buttons: {
                        'Save': function() {
                            var bValid = true;
                            var myDate = new Date();
                            var prettyDate = (myDate.getMonth() + 1) + '/' + myDate.getDate() + '/' + myDate.getFullYear();
                            var myTimer = {};
                            OpenProcessor();
                            myTimer = $.timer(2500, function() {
                                var rowcount = document.getElementById('fileupload').rows.length - 1;
                                var filetype = "";
                                var filesize = "";
                                if (rowcount % 2 == 0) {
                                    filesize = "10 KB";
                                    filetype = "TXT";
                                } else {
                                    filesize = "20 KB";
                                    filetype = "PDF";
                                }
                                //var filesize=rowcount+10;
                                var x = document.getElementById('fileupload').insertRow(1);
                                var col1 = x.insertCell(0);
                                var col2 = x.insertCell(1);
                                var col3 = x.insertCell(2);
                                var col4 = x.insertCell(3);
                                col1.innerHTML = "EHR-MIPP Support Document " + rowcount;
                                col2.innerHTML = filetype;
                                col3.innerHTML = filesize;
                                col4.innerHTML = myDate;
                                //alert(document.getElementById('fileupload').rows.length);
                                //document.getElementById("flname").innerHTML = "EHR-MIPP Demo Template";
                                //document.getElementById("fltyp").innerHTML = "TXT";
                                //document.getElementById("flsize").innerHTML = "10KB";
                                //document.getElementById("fldt").innerHTML = myDate;
                            });

                            if (bValid) {

                                $(this).dialog('close');
                            }
                        },
                        Cancel: function() {
                            $(this).dialog('close');
                        }
                    },
                });
                $('#uploadBtn')
                        .button()
                        .click(function() {
                    $('#dialog-elig-form').dialog('open');
                    return false;
                });


            });
            $(function() {
                // a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
                $("#dialog").dialog("destroy");
//		var pstart = $("#periodstart");
                $("#dialog-attest").dialog({
                    autoOpen: false,
                    height: 575,
                    width: 700,
                    modal: true,
                    buttons: {
                        Close: function() {
                            $(this).dialog('close');
                        }
                    },
                });

                $('#print1')
                        .button()
                        .click(function() {
                    $('#dialog-attest').dialog('open');
                    return false;
                });


            });
        function submitForm(method){
           // alert("method="+method);
            document.forms[0].action = method;
            document.forms[0].submit();
        }
        </script>

    </head>
    <body>
        <div id="templatemo_banner_wrapper">

            <div id="templatemo_banner">

                <div id="banner_content">
                    <table width="100%" border="0"  cellspacing="0">
                        <tr>
                            <td width="50%"  align="left"><img height="105" src="images/help.png"/></td>
                            <td align="right"><img height="100" src="images/home.png"/></td>
                        </tr>
                    </table>


                </div>

            </div> <!-- end of templatemo_banner -->

        </div>
        <form action="startRegistration" method="post" id="startRegistrationForm">
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
                        <h2>Success</h2>
                        <img src="images/Checkmark.png" alt="image 1" />
                        <p>Received your registration from NLR. Continue with state registration.</p>
                        <div class="cleaner"></div>
                    </div>
                    <div class="product_box margin_r_20">
                        <h2>Search Criteria</h2>
                        <p>Registration ID:  <input type="text" name="regId" value="1357924680" id="regId" size="10"/></p>
                            <p>NPI: <input type="text" name="npi" value="1033366513" id="npi" size="10"></p>
                        <p>Tax ID / SSN: <input type="text" name="taxId" value=" 999-99-9999" id="taxId"  size="10"/></p>
                        <div class="cleaner"></div>
                    </div>
                    <div class="product_box">
                        <h2>Login Information</h2>
                        <p>User ID: doej</p>
                        <p>Profile: Provider Admin</p>
                        <div class="cleaner"></div>
                    </div>
                </div><!-- End of section_w940 -->
                <div class="section_w940">
                    <div id="slidedeck_frame">
                        <dl class="slidedeck">
                            <dt>Member Information</dt>
                            <dd>
                                <table width="100% border="0">
                                    <tr>
                                        <td width="50%">
                                            <fieldset style="width:350px">
                                                <legend align="center"><h6>Personal Info</h6></legend>
                                                <table width="100%" border="0" cellpadding="2" cellspacing="0">
                                                    <tr>
                                                        <td width="35%"><h4>First Name</h4></td>
                                                        <td width="2%">:</td>
                                                        <td width="25%"> <input type="text" name="to.memberFirstName" id="memberFirstName" size="10"/></td>
                                                        <td><h4>Last Name</h4></td>
                                                        <td>:</td>
                                                        <td> <input type="text" name="to.memberLastName" id="memberLastName" size="10"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h4>Middle Initial</h4></td>
                                                        <td>:</td>
                                                        <td> <input type="text" name="to.memberMiddleInitail" id="memberMiddleInitail" size="10"/></td>
                                                        <td><h4>Suffix</h4></td>
                                                        <td>:</td>
                                                        <td><input type="text" name="to.memberSuffix"  id="memberSuffix" size="10"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h4>Provider Type</h4></td>
                                                        <td>:</td>
                                                        <td colspan="2"><input type="text" name="to.memberProviderType" id="memberProviderType" size="10"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h4>Provider Specialty </h4></td>
                                                        <td>:</td>
                                                        <td colspan="2"><input type="text" name="to.memberProviderSpeciality" id="memberProviderSpeciality" size="10"/></td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                        <td width="50%">
                                            <fieldset style="width:280px">
                                                <legend align="center"><h6>Address</h6></legend>
                                                <table width="100%" border="0" cellpadding="2" cellspacing="0">
                                                    <tr>
                                                        <td width="25%"><h4>Address</h4></td>
                                                        <td width="2%">:</td>
                                                        <td><input type="text" name="to.memberStreet" id="memberStreet" size="10"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h4>City</h4></td>
                                                        <td>:</td>
                                                        <td><input type="text" name="to.memberCity" id="memberCity"size="10"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h4>State</h4></td>
                                                        <td>:</td>
                                                        <td><input type="text" name="to.memberAState" id="memberAState" size="10"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h4>Zip</h4></td>
                                                        <td>:</td>
                                                        <td><input type="text" name="to.memberzZipcode" id="memberzZipcode" size="10"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h4>Phone</h4></td>
                                                        <td>:</td>
                                                        <td><input type="text" name="to.memberPhone" id="memberPhone" maxlength="10" size="10"/></td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="50%">
                                            <fieldset style="width:350px">
                                                <legend align="center"><h6>Identifiers</h6></legend>
                                                <table width="100%" border="0" cellpadding="2" cellspacing="0">
                                                    <tr>
                                                        <td colspan="4"><p>The Tax Identification Number (TIN) captured below will receive the EHR incentive
                                                                payment.</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h4>NPI</h4></td>
                                                        <td>:</td>
                                                        <td><input type="text" name="to.npi"  id="npi" size="10"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="25%"><h4>SSN/Tax ID</h4></td>
                                                        <td width="2%">:</td>
                                                        <td><input type="text" name="to.taxId"
                                                                   id= "taxId" size="10"/></td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                        <td width="50%" valign="top">
                                            <fieldset style="width:280px">
                                                <legend align="center"><h6>Exclusions</h6></legend>
                                                <table width="90%" border="0" cellpadding="1" cellspacing="2">
                                                    <tr>
                                                        <td width="40%"><h4>Code</h4></td>
                                                        <td>:</td>
                                                        <td><input type="text" name="to.exclusionsCode"  id="exclusionsCode" size="10"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h4>Description</h4></td>
                                                        <td>:</td>
                                                        <td><input type="text" name="to.exclusionsDesc" id="exclusionsDesc"  size="10"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="25%"><h4>Date</h4></td>
                                                        <td width="2%">:</td>
                                                        <td><input type="text" name="to.exclusionsDate"  id="exclusionsDate"  size="10"/></td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                </table>
                            </dd>
                            <dt>Federal Information</dt>
                            <dd>
                                <table width="100% border="0">
                                    <tr>
                                        <td width="50%">
                                            <fieldset style="width:350px">
                                                <legend align="center"><h6>Basic Info</h6></legend>
                                                <table width="100%" border="0" cellpadding="2" cellspacing="0">
                                                    <tr>
                                                        <td width="35%"><h4>First Name</h4></td>
                                                        <td width="2%">:</td>
                                                        <td><input type="text" name="to.federalFirstName"  id="federalFirstName" size="10"/></td>
                                                        <td><h4>Last Name</h4></td>
                                                        <td>:</td>
                                                        <td><input type="text" name="to.federalLastName"  id="federalLastName"  size="10"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h4>Middle Initial</h4></td>
                                                        <td>:</td>
                                                        <td><input type="text" name="to.federalMiddleInitail" id="federalMiddleInitail" size="10"/></td>
                                                        <td><h4>Suffix</h4></td>
                                                        <td>:</td>
                                                        <td><input type="text" name="to.federalSuffix" id="federalSuffix" size="10"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h4>Provider Type</h4></td>
                                                        <td>:</td>
                                                        <td colspan="3"><input type="text" name="to.federalProviderType"  id="federalProviderType"  size="10"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h4>Date Of Birth</h4></td>
                                                        <td>:</td>
                                                        <td colspan="2"><input type="text" name="to.federalDateOfBirth"  id="federalDateOfBirth"  size="10"/></td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                        <td width="50%">
                                            <fieldset style="width:280px">
                                                <legend align="center"><h6>Address</h6></legend>
                                                <table width="100%" border="0" cellpadding="1" cellspacing="0">
                                                    <tr>
                                                        <td width="25%"><h4>Address</h4></td>
                                                        <td width="2%">:</td>
                                                        <td><input type="text" name="to.federalStreet"  id="federalStreet" size="10"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h4>City</h4></td>
                                                        <td>:</td>
                                                        <td><input type="text" name="to.federalCity"  id="federalCity" size="10"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h4>State</h4></td>
                                                        <td>:</td>
                                                        <td><input type="text" name="to.federalAState"  id="federalAState" size="10"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h4>Zip</h4></td>
                                                        <td>:</td>
                                                        <td><input type="text" name="to.federalzZipcode"  id="federalzZipcode" size="10"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h4>Phone</h4></td>
                                                        <td>:</td>
                                                        <td><input type="text" name="to.federalPhone"  id="federalPhone" maxlength="10" size="10"/></td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="50%" valign="top">
                                            <fieldset style="width:350px">
                                                <legend align="center"><h6>Provider Type/Specialty</h6></legend>
                                                <table width="100%" border="0" cellpadding="1" cellspacing="2">
                                                    <tr>
                                                        <td><h4>Specialty</h4></td>
                                                        <td>:</td>
                                                        <td><input type="text" name="to.providerSpecialty"  id="providerSpecialty" size="10"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h4>Taxonomy</h4></td>
                                                        <td>:</td>
                                                        <td><input type="text" name="to.taxonomy"  id="taxonomy" size="10"/></td>
                                                    </tr>
                                                </table>

                                            </fieldset>
                                        </td>
                                        <td width="50%" valign="top">
                                            <fieldset style="width:280px">
                                                <legend align="center"><h6>Licenses/Certifications</h6></legend>
                                                <table width="100%" border="1" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td><h4>Type</h4></td>
                                                        <td><h4>Number</h4></td>
                                                        <td><h4>Expiration Date</h4></td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="text" name="to.licenseType"  id="licenseType"  size="10"/></td>
                                                        <td><input type="text" name="to.licenseNum"  id="exclusionsDesc" size="10"/></td>
                                                        <td><input type="text" name="to.expiryDate"  id="expiryDate"  size="10"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="text" name="memberId"  id="rid" size="10"/></td>
                                                        <td><input type="text" name="memberId"  id="rid" size="10"/></td>
                                                        <td><input type="text" name="memberId"  id="rid" size="10"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="text" name="memberId"  id="rid" size="10"/></td>
                                                        <td><input type="text" name="memberId"  id="rid" size="10"/></td>
                                                        <td><input type="text" name="memberId"  id="rid" size="10"/></td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                </table>
                            </dd>
                            <dt>Eligibility</dt>
                            <dd>
                                <div id="users-contain" class="ui-widget">
                                    <table id="users" class="ui-widget ui-widget-content" cellpadding="1" cellspacing="1" width="100%">
                                        <thead>
                                            <tr class="ui-widget-header ">
                                                <th>Payment Year</th>
                                                <th>Reporting Period Start</th>
                                                <th>Reporting Period End</th>
                                                <th>EHR Investment Amount</th>
                                                <th>Pediatrician </th>
                                                <th>FQHC /RHC</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td align="left"><input type="image" title="Click To Add Eligibility Details" src="images/edit.png" onclick="jQuery('#dialog-elig-form').dialog('open');
                return false">&nbsp;&nbsp;1</td>
                                                <td id="ps1">&nbsp;</td>
                                                <td id="pe1">&nbsp;</td>
                                                <td id="ea1">&nbsp;</td>
                                                <td id="pt1">&nbsp;</td>
                                                <td id="fq1">&nbsp;</td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </div>
                            </dd>
                            <dt>Attestation</dt>
                            <dd><fieldset style="width:655px">
                                    <p class="attest"><br>NOTICE: Any person who knowingly files a statement of claim containing any misrepresentation or any
                                            false, incomplete or misleading information may be guilty of a criminal act punishable under law and
                                            may be subject to civil penalties.</p>
                                </fieldset>
                                <fieldset  style="width:655px"><legend align="center" margin-right: "5%"><h6>Signature</h6></legend>
                                    <div style="width:680px; height:100px; overflow:auto;">
                                        <p class="attest"><br>I certify that the foregoing information is true, accurate and complete. I understand that the HITECH incentive
                                                payment I requested will be paid from Federal and State funds, and that any false claims, statements, or
                                                documents, or concealment of a material fact, may be prosecuted under applicable Federal or State laws.
                                                I hereby agree to keep such records as are necessary to demonstrate that I met all HITECH
                                                requirements and to furnish those records to the Medicaid State Agency, Dept. of Health and Humans
                                                Services, or contractor acting on their behalf
                                                No HITECH payment may be paid unless this registration form is completed as required by existing law
                                                and regulations (42 CFR ___.___).
                                                NOTICE: Anyone who misrepresents or falsifies essential information to receive payment from Federal
                                                funds requested by this form may upon conviction be subject to fine and imprisonment under applicable
                                                Federal laws.
                                                ROUTINE USE(S): Information from this HITECH registration form and subsequently submitted
                                                information and documents may be given to the Internal Revenue Service, private collection agencies,
                                                and consumer reporting agencies in connection with recoupment of any overpayment made and to
                                                Congressional Offices in response to inquiries made at the request of the person to whom a record
                                                pertains. Appropriate disclosures may be made to other federal, state, local, foreign government
                                                agencies, private business entities, and individual providers of care, on matters relating to entitlement,
                                                fraud, program abuse, program integrity, and civil and criminal litigation related to the operation of the
                                                HITECH Program.
                                                DISCLOSURES: Voluntary; however, failure to provide information will result in delay in payment or may
                                                result in denial of HITECH payment. With the one exception discussed below, there are no penalties
                                                under these programs for refusing to supply information. However, failure to furnish information on this
                                                registration form will prevent HITECH payment from being issued. Failure to furnish subsequently
                                                requested information or documents will result in the issuance of an overpayment demand letter followed
                                                by recoupment procedures.
                                                It is mandatory that you tell us if you believe you have been overpaid under the HITECH program.
                                                ______________ provides penalties for withholding this information.
                                                You should be aware that P.L. 100-503, the "Computer Matching and Privacy Protection Act of 1988",
                                                permits the government to verify information by way of computer matches.</p></div>
                                    <table width="655px">
                                        <tr>
                                            <td width="40%">
                                                <input type=checkbox id="terms" name="terms1" > I accept the terms and conditions</input></td>
                                            <td align="center">
                                                <input type="submit" value="Register" name="SubmitReg" id="SubmitReg" onmouseover="over_button('SubmitReg', 'images/Register_Down.png')"
                                                       onmouseout="up_button('SubmitReg', 'images/Register_Up.png')" src="./images/Register_Up.png" onclick="submitForm('saveRegistration');"></input>
                                                <%--<a href="saveRegistration" id="submit" onMouseOver="over_button('SubmitReg', 'images/Register_Down.png')" onclick="submitForm('saveRegistration');"
                                                   onMouseOut="up_button('SubmitReg', 'images/Register_Up.png')"><img src="./images/Register_Up.png" name="SubmitReg" id="SubmitReg" /></a>--%>

                                            </td>
                                            <td align="right">
                                                <input type="image" src="images/print-preview.png" alt="print preview" id="print1" title="Print Preview" />
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset></dd>
                            <dt>Upload Documents</dt>
                            <dd>
                                <div id="users-contain" class="ui-widget">
                                    <h3>Click <input type="image" title="Click To Upload" src="images/file_upload.png" onclick="jQuery('#dialog-upload').dialog('open');
                return false"> to upload supporting documents</h3>
                                    <table id="fileupload" name="to.attachedFile" class="ui-widget ui-widget-content" cellpadding="1" cellspacing="1" width="100%">
                                        <thead>
                                            <tr class="ui-widget-header ">
                                                <th>File Name</th>
                                                <th>File Type</th>
                                                <th>File Size</th>
                                                <th>Upload Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td id="flname">&nbsp;</td>
                                                <td id="fltyp">&nbsp;</td>
                                                <td id="flsize">&nbsp;</td>
                                                <td id="fldt">&nbsp;</td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </div>
                            </dd>
                            </d1> <!--End of Slidedeck-->
                            <script type="text/javascript">
            $('.slidedeck').slidedeck();
                            </script>
                    </div>
                    <div class="cleaner"></div>
                </div>
            </div> <!-- end of templatemo_content -->
            <div class="processor" id="showprocessor">
                <table><tr><td><img src="images/red-processor-small1.gif"/></td><td><h4 class="redclass">&nbsp;&nbsp;Processing Request......<h4></td><tr></table>
                                        <div class="close" id="CloseBtn"></div>
                                        </div>
                                        <a class="modalInput" rel="#showprocessor" id="showProcessor" ></a>
                                        <div id="templatemo_content_bottom"></div>
                                        <div id="templatemo_footer">
                                            Copyright&nbsp;© 2010 <a href="grievanceDetails">GrievanceApp</a> | Development
                                        </div> <!-- end of footer -->
                                        <!-- Content For adding Eligibility Information -->
                                        <div id="dialog-attest" title="Attestation Information">
                                            <fieldset style="width:750px">
                                                <p class="attest-dialogue"><br>NOTICE: Any person who knowingly files a statement of claim containing any misrepresentation or any
                                                        false, incomplete or misleading information may be guilty of a criminal act punishable under law and
                                                        may be subject to civil penalties.</p>
                                            </fieldset>
                                            <fieldset  style="width:740px"><legend align="center" margin-right: "5%"><h6>Signature</h6></legend>
                                                <div style="width:750px; height:350px;">
                                                    <p class="attest-dialogue"><br>I certify that the foregoing information is true, accurate and complete. I understand that the HITECH incentive
                                                            payment I requested will be paid from Federal and State funds, and that any false claims, statements, or
                                                            documents, or concealment of a material fact, may be prosecuted under applicable Federal or State laws.
                                                            I hereby agree to keep such records as are necessary to demonstrate that I met all HITECH
                                                            requirements and to furnish those records to the Medicaid State Agency, Dept. of Health and Humans
                                                            Services, or contractor acting on their behalf
                                                            No HITECH payment may be paid unless this registration form is completed as required by existing law
                                                            and regulations (42 CFR ___.___).
                                                            NOTICE: Anyone who misrepresents or falsifies essential information to receive payment from Federal
                                                            funds requested by this form may upon conviction be subject to fine and imprisonment under applicable
                                                            Federal laws.
                                                            ROUTINE USE(S): Information from this HITECH registration form and subsequently submitted
                                                            information and documents may be given to the Internal Revenue Service, private collection agencies,
                                                            and consumer reporting agencies in connection with recoupment of any overpayment made and to
                                                            Congressional Offices in response to inquiries made at the request of the person to whom a record
                                                            pertains. Appropriate disclosures may be made to other federal, state, local, foreign government
                                                            agencies, private business entities, and individual providers of care, on matters relating to entitlement,
                                                            fraud, program abuse, program integrity, and civil and criminal litigation related to the operation of the
                                                            HITECH Program.
                                                            DISCLOSURES: Voluntary; however, failure to provide information will result in delay in payment or may
                                                            result in denial of HITECH payment. With the one exception discussed below, there are no penalties
                                                            under these programs for refusing to supply information. However, failure to furnish information on this
                                                            registration form will prevent HITECH payment from being issued. Failure to furnish subsequently
                                                            requested information or documents will result in the issuance of an overpayment demand letter followed
                                                            by recoupment procedures.
                                                            It is mandatory that you tell us if you believe you have been overpaid under the HITECH program.
                                                            ______________ provides penalties for withholding this information.
                                                            You should be aware that P.L. 100-503, the "Computer Matching and Privacy Protection Act of 1988",
                                                            permits the government to verify information by way of computer matches.</p></div>
                                                <br>
                                                    <table width="655px">
                                                        <tr>
                                                            <td align="center">
                                                                <input type="image" src="images/print2.jpg" alt="Submit" id="print1" title="print" onClick="window.print()">
                                                            </td>
                                                        </tr>
                                                    </table>
                                            </fieldset>
                                        </div>

                                        <div id="dialog-elig-form" title="Enter Eligibility Information">
                                            <style type="text/css">
                                                <!--
                                                form fieldset legend {
                                                    font-size:1.1em; /* bump up legend font size, not too large or it'll overwrite border on left */
                                                    /* be careful with padding, it'll shift the nice offset on top of border  */
                                                }

                                                form label {
                                                    display: block;  /* block float the labels to left column, set a width */
                                                    float: left;
                                                    width: 250px;
                                                    padding: 0;
                                                    margin: 5px 0 0; /* set top margin same as form input - textarea etc. elements */
                                                    text-align: right;
                                                }


                                                form input, form textarea {
                                                    /* display: inline; inline display must not be set or will hide submit buttons in IE 5x mac */
                                                    width:auto;      /* set width of form elements to auto-size, otherwise watch for wrap on resize */
                                                    margin:5px 0 0 10px; /* set margin on left of form elements rather than right of
                                                    label aligns textarea better in IE */
                                                }

                                                form input#reset {
                                                    margin-left:0px; /* set margin-left back to zero on reset button (set above) */
                                                }

                                                textarea { overflow: auto; }

                                                form small {
                                                    display: block;
                                                    margin: 0 0 5px 160px; /* instructions/comments left margin set to align w/ right column inputs */
                                                    padding: 1px 3px;
                                                    font-size: 88%;
                                                }

                                                form .required{font-weight:bold;} /* uses class instead of div, more efficient */

                                                form br {
                                                    clear:left; /* setting clear on inputs didn't work consistently, so brs added for degrade */
                                                }
                                                /* error message */
                                                .error {
                                                    /* supply height to ensure consistent positioning for every browser */
                                                    height:15px;
                                                    background-color:#FFFE36;
                                                    border:1px solid #E1E16D;
                                                    font-size:11px;
                                                    color:#000;
                                                    padding:3px 10px;
                                                    margin-left:-2px;


                                                    /* CSS3 spicing for mozilla and webkit */
                                                    -moz-border-radius:4px;
                                                    -webkit-border-radius:4px;
                                                    -moz-border-radius-bottomleft:0;
                                                    -moz-border-radius-topleft:0;
                                                    -webkit-border-bottom-left-radius:0;
                                                    -webkit-border-top-left-radius:0;
                                                    -moz-box-shadow:0 0 6px #ddd;
                                                    -webkit-box-shadow:0 0 6px #ddd;
                                                }

                                                -->
                                            </style>
                                            <!--
                                                      <form action="#" method="post" name="f">
                                                      <p><b>Bold</b> fields are required.</p>
                                                      <fieldset>
                                                      <legend >Reporting Period</legend>
                                                          <label for="Period Start"   class="required" onMouseover="displaycontent(3)" width=50px height=50px onMouseout="hideddrivetip()" style="cursor: hand">Start Date: </label>
                                                          <input type="text" id="periodstart" name="periodstart" tabindex="1" value="" title="period start" required="required"><br>
                                                          <label for="Period End" class="required" onMouseover="displaycontent(4)" width=50px height=50px onMouseout="hideddrivetip()" style="cursor: hand">End Date: </label>
                                                          <input type="text" id="periodend" name="periodend" tabindex="2" value="" title="period end">
                                                          <br>
                                                      </fieldset>
                                                      <fieldset>
                                                      <legend>Encounter Volume</legend>
                                                          <label for="Total Enc"  class="required"  >Total Encounters: </label>
                                                          <input type="text"  name="totalenc" tabindex="3" value="" title="Total Encounters"/>&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent(1)" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                          <label for="Medicaid Enc" class="required">Qualified Patient Encounters: </label>
                                                          <input type="text" id="medicaidenc" name="medicaidenc" tabindex="4" value="" title="medicaid encounters" />&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent(2)" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                      </fieldset>
                                                       <fieldset>
                                                      <legend>EHR Certification Information</legend>
                                                          <label for="Cert Num"  class="required" >EHR Certification Number: </label>
                                                          <input type="text" id="certnum" name="certnum" tabindex="5" value="" title="Certification Number">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('cert')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                          <label for="certamt" class="required">EHR Investment Amount: </label>
                                                          <input type="text" id="certamt" name="certamt" tabindex="6" value="" title="Investment Amount">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('invstamt')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                          <label for="certamt" class="required">Adopt/Implement/Upgrade Date: </label>
                                                          <input type="text" id="aiudate" name="aiudate" tabindex="7" value="" title="A/I/U Date"><br>
                                                      </fieldset>
                                                      <fieldset>
                                                      <legend>Medicaid Patient Volume</legend>
                                                            <label for="pediatrician"  class="required">Pediatrician &nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('ped')" onMouseout="hideddrivetip()" style="cursor: hand"/></label>
                                                            <input type="radio"  name="rpediatrician" onClick = "jQuery('#pd').show(); return false" value="Y" />Yes &nbsp; <input type="radio" name="rpediatrician" onClick = "jQuery('#pd').hide(); return false" value="N" />No <br>
                                                                    <div id="pd">
                                                                    <fieldset>
                                                                            <label for="Total Enc"  class="required">Total Encounters: </label>
                                                                            <input type="text" id="totalenc" name="totalenc" tabindex="1" value="" title="Total Encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedtot')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                                            <label for="Medicaid Enc" class="required">Qualified Patient Encounters: </label>
                                                                            <input type="text" id="medicaidenc" name="medicaidenc" tabindex="2" value="" title="medicaid encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedqal')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                                    </fieldset>
                                                                    </div>
                                                            <label   class="required">FQHC/RHC provider &nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('fqhc')" onMouseout="hideddrivetip()" style="cursor: hand"/></label>
                                                            <input type="radio"  name="radiofqhc" onClick = "jQuery('#fq').show(); return false" value="Y" />Yes &nbsp; <input type="radio" name="radiofqhc" onClick = "jQuery('#fq').hide(); return false" value="N" selected />No <br>
                                                                    <div id="fq">
                                                                    <fieldset>
                                                                            <label for="Total Enc"  class="required">Total Encounters: </label>
                                                                            <input type="text" id="totalenc" name="totalenc" tabindex="1" value="" title="Total Encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('fqhctot')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                                            <label for="Medicaid Enc" class="required">Qualified Patient Encounters: </label>
                                                                            <input type="text" id="medicaidenc" name="medicaidenc" tabindex="2" value="" title="medicaid encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('fqhcqal')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                                    </fieldset>
                                                                    </div>
                                                            <label   class="required">Eligible Physician Assistant (PA) &nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pa')" onMouseout="hideddrivetip()" style="cursor: hand"/></label>
                                                            <input type="radio"  name="radiopa" onClick = "jQuery('#pa').show(); return false" value="Y" />Yes &nbsp; <input type="radio" name="radiopa" onClick = "jQuery('#pa').hide(); return false" value="N" />No <br>
                                                                    <div id="pa">
                                                                    <fieldset>
                                                                          <label for="Total Enc"  class="required">Total Encounters: </label>
                                                                          <input type="text" id="totalenc" name="totalenc" tabindex="1" value="" title="Total Encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('patot')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                                          <label for="Medicaid Enc" class="required">Qualified Patient Encounters: </label>
                                                                          <input type="text" id="medicaidenc" name="medicaidenc" tabindex="2" value="" title="medicaid encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('paqal')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                                    </fieldset>
                                                                    </div>
                                                            <label   class="required">Hospital-based provider &nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('hs')" onMouseout="hideddrivetip()" style="cursor: hand"/></label>
                                                            <input type="radio"  name="radiohospital" onClick = "jQuery('#hs').show(); return false" value="Y" />Yes &nbsp; <input type="radio" name="radiohospital" onClick = "jQuery('#hs').hide(); return false" value="N" />No <br>
                                                                    <div id="hs">
                                                                     <fieldset>
                                                                          <label for="Total Enc"  class="required">Total Encounters: </label>
                                                                          <input type="text" id="totalenc" name="totalenc" tabindex="1" value="" title="Total Encounters"/>&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('hstot')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                                          <label for="Medicaid Enc" class="required">Qualified Patient Encounters: </label>
                                                                          <input type="text" id="medicaidenc" name="medicaidenc" tabindex="2" value="" title="medicaid encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('hsqal')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                                     </fieldset>
                                                                    </div>
                                                      </fieldset>
                                                                    <div id="dhtmltooltip"></div>
                                            <script type="text/javascript">
                                            -->
                                            <form action="#" method="post" name="f">
                                                <p><b>Bold</b> fields are required.</p>

                                                <!--
                                                <fieldset>
                                                <legend >Reporting Period</legend>
                                                    <label for="Period Start"   class="required" onMouseover="displaycontent(3)" width=50px height=50px onMouseout="hideddrivetip()" style="cursor: hand">Start Date: </label>
                                                    <input type="text" id="periodstart" name="periodstart" tabindex="1" value="" title="period start" required="required"><br>
                                                    <label for="Period End" class="required" onMouseover="displaycontent(4)" width=50px height=50px onMouseout="hideddrivetip()" style="cursor: hand">End Date: </label>
                                                    <input type="text" id="periodend" name="periodend" tabindex="2" value="" title="period end">
                                                    <br>
                                                </fieldset>
                                                <fieldset>
                                                <legend>Encounter Volume</legend>
                                                    <label for="Total Enc"  class="required"  >Total Encounters: </label>
                                                    <input type="text"  name="totalenc" tabindex="3" value="" title="Total Encounters"/>&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent(1)" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                    <label for="Medicaid Enc" class="required">Qualified Patient Encounters: </label>
                                                    <input type="text" id="medicaidenc" name="medicaidenc" tabindex="4" value="" title="medicaid encounters" />&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent(2)" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                </fieldset>

                                                -->
                                                <fieldset>
                                                    <legend >Reporting Period</legend>
                                                    <label for="Period Start"   class="required" onMouseover="displaycontent(3)" width=50px height=50px onMouseout="hideddrivetip()" style="cursor: hand">Start Date: </label>
                                                    <input type="text" id="periodstart" name="periodstart" tabindex="1" value="" title="period start" required="required"><br>
                                                            <label for="Period End" class="required" onMouseover="displaycontent(4)" width=50px height=50px onMouseout="hideddrivetip()" style="cursor: hand">End Date: </label>
                                                            <input type="text" id="periodend" name="periodend" tabindex="2" value="" title="period end">
                                                                <br>
                                                                    </fieldset>
                                                                    <fieldset>
                                                                        <legend>Medicaid Patient Volume</legend>

                                                                        <label for="pediatrician"  class="required">Pediatrician &nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('ped')" onMouseout="hideddrivetip()" style="cursor: hand"/></label>
                                                                        <input type="radio"  name="rpediatrician" onClick = "jQuery('#pd').show();
                                                                            return false" value="Y" />Yes &nbsp; <input type="radio" name="rpediatrician" onClick = "jQuery('#pd').hide();
                                                                            return false" value="N"  />No <br>


                                                                            <label   class="required">Eligible physician assistant (PA) &nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pa')" onMouseout="hideddrivetip()" style="cursor: hand"/></label>
                                                                            <input type="radio"  name="radiopa" onClick = "jQuery('#pa').show();
                                                                                return false" value="Y" />Yes &nbsp; <input type="radio" name="radiopa" onClick = "jQuery('#pa').hide();
                                                                                return false" value="N"  />No <br>
                                                                                <div id="pa">
                                                                                    <fieldset>
                                                                                        <label for="Total Enc"  class="required"> &nbsp</label><input type="checkbox"  name="PA"  value="P" onMouseover="displaycontent(3)" width=50px height=50px onMouseout="hideddrivetip()" style="cursor: hand" />Primary Provider at FQHC/RHC <br>
                                                                                            <label for="Total Enc"  class="required">&nbsp </label><input type="checkbox" name="PA"  value="D" class="required" />Clinical/Medical Director at FQHC/RHC <br>
                                                                                                <label for="Total Enc"  class="required">&nbsp </label><input type="checkbox" name="PA"  value="O" class="required" /> An Owner at RHC<br>
                                                                                                    <label for="Total Enc"  class="required">&nbsp </label><input type="checkbox" name="PA"  value="N" class="required" /> None of the above<br>
                                                                                                        </fieldset>
                                                                                                        </div>
                                                                                                        <label   class="required"> Do you render service in hospital  &nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('hs')" onMouseout="hideddrivetip()" style="cursor: hand"/></label>
                                                                                                        <input type="radio"  name="radiohospital" onClick = "jQuery('#hs').show();
                                                                                                            return false" value="Y" />Yes &nbsp; <input type="radio" name="radiohospital" onClick = "jQuery('#hs').hide();
                                                                                                            return false" value="N" />No <br>
                                                                                                            <div id="hs">
                                                                                                                <fieldset>


                                                                                                                    <fieldset>
                                                                                                                        <label for="Total Enc"  class="required">Total Inpatient Discharges: </label>
                                                                                                                        <input type="text" id="totalenc" name="totalenc" tabindex="1" value="" title="Total Encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedtot')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                                                                                                <label for="Total Enc"  class="required">Total ER Encounters: </label>
                                                                                                                                <input type="text" id="totalenc" name="totalenc" tabindex="1" value="" title="Total Encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedtot')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                                                                                                        <label for="Medicaid Enc" class="required">Medicaid Inpatient Discharges: </label>
                                                                                                                                        <input type="text" id="medicaidenc" name="medicaidenc" tabindex="2" value="" title="medicaid encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedqal')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                                                                                                                <label for="Medicaid Enc" class="required">Medicaid ER Encounters: </label>
                                                                                                                                                <input type="text" id="medicaidenc" name="medicaidenc" tabindex="2" value="" title="medicaid encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedqal')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>

                                                                                                                                                        </fieldset>
                                                                                                                                                        </div>
                                                                                                                                                        <label   class="required">Organization Encounter Proxy&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('gp')" onMouseout="hideddrivetip()" style="cursor: hand"/></label>
                                                                                                                                                        <input type="radio"  name="radioencproxy" onClick = "jQuery('#gp').show();
                                                                                                                                                            return false" value="Y" />Yes &nbsp; <input type="radio" name="radioencproxy" onClick = "jQuery('#gp').hide();
                                                                                                                                                            return false" value="N" />No <br>
                                                                                                                                                            <div id="gp">
                                                                                                                                                                <fieldset>
                                                                                                                                                                    <fieldset>
                                                                                                                                                                        <legend >Organization NPI</legend>
                                                                                                                                                                        <label for="Org NPI"  class="required">Organization NPI: </label>
                                                                                                                                                                        <input type="text" id="totalenc" name="orgnpi" tabindex="1" value="" title="Organization NPI">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedtot')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                                                                                                                                                <br>
                                                                                                                                                                                    </fieldset>

                                                                                                                                                                                    <fieldset>
                                                                                                                                                                                        <label for="Total Enc"  class="required">Total Encounters: </label>
                                                                                                                                                                                        <input type="text" id="totalenc" name="totalenc" tabindex="1" value="" title="Total Encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedtot')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                                                                                                                                                                <label for="Medicaid Enc" class="required">Qualified Patient Encounters: </label>
                                                                                                                                                                                                <input type="text" id="medicaidenc" name="medicaidenc" tabindex="2" value="" title="medicaid encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedqal')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                                                                                                                                                                        </fieldset>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        <label   class="required">FQHC/RHC provider &nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('fqhc')" onMouseout="hideddrivetip()" style="cursor: hand"/></label>
                                                                                                                                                                                                        <input type="radio"  name="radiofqhc" onClick = "jQuery('#fq').show();
                                                                                                                                                                                                        return false" value="Y" />Yes &nbsp; <input type="radio" name="radiofqhc" onClick = "jQuery('#fq').hide();
                                                                                                                                                                                                        return false" value="N" selected />No <br>
                                                                                                                                                                                                        <div id="fq">
                                                                                                                                                                                                        <fieldset>


                                                                                                                                                                                                        <fieldset>
                                                                                                                                                                                                        <label for="Total Enc"  class="required">Total Encounters: </label>
                                                                                                                                                                                                        <input type="text" id="totalenc" name="totalenc" tabindex="1" value="" title="Total Encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedtot')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                                                                                                                                                                        <label for="Total Enc"  class="required">Total Encounters Other Settings: </label>
                                                                                                                                                                                                        <input type="text" id="totalenc" name="totalenc" tabindex="1" value="" title="Total Encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedtot')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                                                                                                                                                                        <label for="Medicaid Enc" class="required">Qualified Patient Encounters: </label>
                                                                                                                                                                                                        <input type="text" id="medicaidenc" name="medicaidenc" tabindex="2" value="" title="medicaid encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedqal')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                                                                                                                                                                        <label for="Medicaid Enc" class="required">MIChild Encounters: </label>
                                                                                                                                                                                                        <input type="text" id="medicaidenc" name="medicaidenc" tabindex="2" value="" title="medicaid encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedqal')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                                                                                                                                                                        <label for="Medicaid Enc" class="required">Charity Care Encounters: </label>
                                                                                                                                                                                                        <input type="text" id="medicaidenc" name="medicaidenc" tabindex="2" value="" title="medicaid encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedqal')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                                                                                                                                                                        <label for="Medicaid Enc" class="required">Sliding Fee Scale Encounters: </label>
                                                                                                                                                                                                        <input type="text" id="medicaidenc" name="medicaidenc" tabindex="2" value="" title="medicaid encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedqal')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                                                                                                                                                                        <label for="Medicaid Enc" class="required">Medicaid Encounters Other Settings: </label>
                                                                                                                                                                                                        <input type="text" id="medicaidenc" name="medicaidenc" tabindex="2" value="" title="medicaid encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedqal')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                                                                                                                                                                        </fieldset>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        <label   class="required">MCO primary care provider &nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('mp')" onMouseout="hideddrivetip()" style="cursor: hand"/></label>
                                                                                                                                                                                                        <input type="radio"  name="radiomco" onClick = "jQuery('#mp').show();
                                                                                                                                                                                                        return false" value="Y" />Yes &nbsp; <input type="radio" name="radiomco" onClick = "jQuery('#mp').hide();
                                                                                                                                                                                                        return false" value="N" />No <br>
                                                                                                                                                                                                        <div id="mp">
                                                                                                                                                                                                        <fieldset>
                                                                                                                                                                                                        <label for="Total Enc"  class="required">Total PCP Panel: </label>
                                                                                                                                                                                                        <input type="text" id="totalenc" name="totalenc" tabindex="1" value="" title="Total Encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedtot')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                                                                                                                                                                        <label for="Total Enc"  class="required">Total Unduplicated Encounters: </label>
                                                                                                                                                                                                        <input type="text" id="totalenc" name="totalenc" tabindex="1" value="" title="Total Encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedtot')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                                                                                                                                                                        <label for="Medicaid Enc" class="required">Medicaid PCP Panel: </label>
                                                                                                                                                                                                        <input type="text" id="medicaidenc" name="medicaidenc" tabindex="2" value="" title="medicaid encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedqal')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
                                                                                                                                                                                                        <label for="Medicaid Enc" class="required">Medicaid Unduplicated Encounters: </label>
                                                                                                                                                                                                        <input type="text" id="medicaidenc" name="medicaidenc" tabindex="2" value="" title="medicaid encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedqal')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>

                                                                                                                                                                                                        </fieldset>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        <label   class="required">MCO primary care provider(FQHC) &nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('mf')" onMouseout="hideddrivetip()" style="cursor: hand"/></label>
                                                                                                                                                                                                        <input type="radio"  name="radiopcpfqhc" onClick = "jQuery('#mf').show();
                return false" value="Y" />Yes &nbsp; <input type="radio" name="radiopcpfqhc" onClick = "jQuery('#mf').hide();
                return false" value="N" />No <br>
        <div id="mf">
        <fieldset>
        <label for="Total Enc"  class="required">Total PCP Panel: </label>
        <input type="text" id="totalenc" name="totalenc" tabindex="1" value="" title="Total Encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedtot')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
        <label for="Total Enc"  class="required">Total Unduplicated Encounters: </label>
        <input type="text" id="totalenc" name="totalenc" tabindex="1" value="" title="Total Encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedtot')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
        <label for="Medicaid Enc" class="required">Medicaid PCP Panel: </label>
        <input type="text" id="medicaidenc" name="medicaidenc" tabindex="2" value="" title="medicaid encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedqal')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
        <label for="Medicaid Enc" class="required">MIChild Panel: </label>
        <input type="text" id="medicaidenc" name="medicaidenc" tabindex="2" value="" title="medicaid encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedqal')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
        <label for="Medicaid Enc" class="required">Charity Care Panel: </label>
        <input type="text" id="medicaidenc" name="medicaidenc" tabindex="2" value="" title="medicaid encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedqal')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
        <label for="Medicaid Enc" class="required">Sliding Fee Scale Panel: </label>
        <input type="text" id="medicaidenc" name="medicaidenc" tabindex="2" value="" title="medicaid encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedqal')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
        <label for="Medicaid Enc" class="required">Medicaid Unduplicated Encounters Other Settings: </label>
        <input type="text" id="medicaidenc" name="medicaidenc" tabindex="2" value="" title="medicaid encounters">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('pedqal')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
        </fieldset>

        </div>
        <!--
        <label   class="required">Did you include any encounters out side [State Name] &nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('am')" onMouseout="hideddrivetip()" style="cursor: hand"/></label>
        <input type="radio"  name="radiostate" onClick = "jQuery('#am').show(); return false" value="Y" />Yes &nbsp; <input type="radio" name="radiostate" onClick = "jQuery('#am').hide(); return false" value="N" />No <br>
        -->
        <div id="am">
        <fieldset>
        <label for="Total Enc"  class="required">State(s): </label>
        <input type="text" id="totalenc" name="totalenc" tabindex="1" value="" title="Total Encounters"/>&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('hstot')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>

        </fieldset>
        </div>
        </fieldset>
        <fieldset>
        <legend>EHR Certification Information</legend>
        <label for="Cert Num"  class="required" >EHR Investment Type: </label>
        <input type="radio"  name="aiu"  value="a" class="required" />Adopt
        <input type="radio" name="aiu"  value="I" class="required" />Implment
        <input type="radio" name="aiu"  value="U" class="required" />Upgrade <br>
        <label for="Cert Num"  class="required" >EHR Certification Number: </label>
        <input type="text" id="certnum" name="certnum" tabindex="5" value="" title="Certification Number">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('cert')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>
        <label for="certamt" class="required">EHR Investment Amount: </label>
        <input type="text" id="certamt" name="certamt" tabindex="6" value="" title="Investment Amount">&nbsp;<img src="images\tool_tips_icon.gif" onMouseover="displaycontent('invstamt')" onMouseout="hideddrivetip()" style="cursor: hand"/><br>

        </fieldset>
        <div id="dhtmltooltip"></div>
        <script type="text/javascript">
            /***********************************************
             * Freejavascriptkit.com
             * Visit http://www.freejavascriptkit.com for more free Javascripts source code
             ***********************************************/

            var offsetxpoint = -60 //Customize x offset of tooltip
            var offsetypoint = 20 //Customize y offset of tooltip
            var ie = document.all
            var ns6 = document.getElementById && !document.all
            var enabletip = false
            if (ie || ns6)
                var tipobj = document.all ? document.all["dhtmltooltip"] : document.getElementById ? document.getElementById("dhtmltooltip") : ""

            function ietruebody() {
                return (document.compatMode && document.compatMode != "BackCompat") ? document.documentElement : document.body
            }

            function ddrivetip(thetext, thecolor, thewidth) {
                if (ns6 || ie) {
                    if (typeof thewidth != "undefined")
                        tipobj.style.width = thewidth + "px"
                    if (typeof thecolor != "undefined" && thecolor != "")
                        tipobj.style.backgroundColor = thecolor
                    tipobj.innerHTML = thetext
                    enabletip = true
                    return false
                }
            }

            function positiontip(e) {
                if (enabletip) {
                    var curX = (ns6) ? e.pageX : event.clientX + ietruebody().scrollLeft;
                    var curY = (ns6) ? e.pageY : event.clientY + ietruebody().scrollTop;

                    var fordg = document.getElementById('dialog-elig-form');

                    var leftValue = 0;
                    var topValue = 0;

                    //alert(fordg.style.display);
                    //if(fordg.style.display!='none'){
                    while (fordg) {
                        leftValue += fordg.offsetLeft;
                        topValue += fordg.offsetTop;
                        fordg = fordg.offsetParent;
                    }


                    //Find out how close the mouse is to the corner of the window
                    var rightedge = ie && !window.opera ? ietruebody().clientWidth - event.clientX - offsetxpoint : window.innerWidth - e.clientX - offsetxpoint - 20
                    var bottomedge = ie && !window.opera ? ietruebody().clientHeight - event.clientY - offsetypoint : window.innerHeight - e.clientY - offsetypoint - 20;

                    var leftedge = (offsetxpoint < 0) ? offsetxpoint * (-1) : -1000;

                    //if the horizontal distance isn't enough to accomodate the width of the context menu
                    if (rightedge < tipobj.offsetWidth)
                            //move the horizontal position of the menu to the left by it's width
                            {
                                tipobj.style.left = ie ? ietruebody().scrollLeft + event.clientX - tipobj.offsetWidth + "px" : window.pageXOffset + e.clientX - tipobj.offsetWidth + "px";
                            }
                    else if (curX < leftedge)
                    {
                        tipobj.style.left = "5px";
                    }
                    else
                        //position the horizontal position of the menu where the mouse is positioned
                        tipobj.style.left = curX + offsetxpoint - leftValue + "px"; //-leftValue

                    //same concept with the vertical position
                    if (bottomedge < tipobj.offsetHeight)
                    {
                        tipobj.style.top = ie ? ietruebody().scrollTop + event.clientY - tipobj.offsetHeight - offsetypoint + "px" : window.pageYOffset + e.clientY - tipobj.offsetHeight - offsetypoint + "px";
                    }
                    else
                        tipobj.style.top = curY + offsetypoint - topValue + 25 + "px"; //-topValue
                    tipobj.style.visibility = "visible";


                    //tipobj.innerHTML= curX+":"+offsetxpoint+":"+leftValue+"px" + "," + curY+":"+offsetypoint+":"+topValue+"px";


                }
            }

            function displaycontent(workflowno)
            {
                var desc = '';

                if (workflowno == 1) {
                    desc = 'Total number of patients that are seen each day during the reporting period in all practice locations'
                } else if (workflowno == 2) {
                    desc = 'Total number of patients seen each day during the reporting period in all practice locations with any Medicaid billable services';
                } else if (workflowno == 3) {
                    desc = 'Any Continuous 90 day period in the previous calendar year with typical qualifying patient volume. Eligible provider types are Physicians, Nurse Midwives, Nurse Practitioners and Dentists';
                } else if (workflowno == 4) {
                    desc = 'Any Continuous 90 day period in the previous calendar year with typical qualifying patient volume. Eligible provider types are Physicians, Nurse Midwives, Nurse Practitioners and Dentists';
                } else if (workflowno == 'cert') {
                    desc = 'Certification number of the qualifying EHR software.';
                } else if (workflowno == 'invstamt') {
                    desc = 'Amount invested in EHR software this payment year.  Investment includes operation and maintenance costs';
                } else if (workflowno == 'ped') {
                    desc = 'Pediatricians are physicians, Nurse Midwives and Nurse Practitioners who see qualifying patients';
                } else if (workflowno == 'pedtot') {
                    desc = 'Total number of patients under 18 years old that are seen each day during the reporting period in all practice locations.';
                } else if (workflowno == 'pedqal') {
                    desc = 'Total number of patients under 18 years old seen each day during the reporting period in all practice locations with any Medicaid billable services.';
                } else if (workflowno == 'fqhc') {
                    desc = 'FQHC/RHC providers are physicians, Nurse Midwives, Nurse Practitioners and Dentists who see qualifying patients.';
                } else if (workflowno == 'fqhctot') {
                    desc = 'Total number of patients at FQHC or RHC settings plus all non-duplicated patients seen at other locations with qualifying patients seen each day during the reporting period.'
                } else if (workflowno == 'fqhcqal') {
                    desc = 'Total number of patients seen at FQHC or RHC settings with Medicaid or SCHIP funding plus Charity Care and Sliding fee scale funding plus all non duplicated patients seen each day during the reporting period in all practice locations with any Medicaid billable services.';
                } else if (workflowno == 'pa') {
                    desc = 'Only PA s working at an FQHC or RHC meeting at least one of the following requirements is eligible: <br>' +
                            '1.	A PA is the primary provider at the FQHC or RHC. <br>' +
                            '2.	A PA is the Clinical or Medical director at the FQHC or RHC. <br>' +
                            '3.	A PA is an owner at the RHC.';
                } else if (workflowno == 'patot') {
                    desc = 'Total number of patients at FQHC or RHC settings seen each day during the reporting period.'
                } else if (workflowno == 'paqal') {
                    desc = 'Total number of patients seen at FQHC or RHC settings with Medicaid or SCHIP funding plus Charity Care and Sliding fee scale funding seen each day during the reporting period.';
                } else if (workflowno == 'hs') {
                    desc = 'Eligible Professionals are Physicians, Nurse Midwives, Nurse Practitioner and Dentists.  Hospital based professionals provide 90% of all professional billings are in hospital or emergency room places of service.';
                } else if (workflowno == 'hstot') {
                    desc = 'Total number of patients that are seen each day during the reporting period in where place of service is Hospital or Emergency Room.'
                } else if (workflowno == 'hsqal') {
                    desc = 'Total number of patients seen each day during the reporting period in all practice locations where place of service is Hospital or Emergency Room with any Medicaid billable services.';
                }


                ddrivetip(desc, '#EDF3FC', 200);
            }

            function hideddrivetip() {
                if (ns6 || ie) {
                    enabletip = false
                    tipobj.style.visibility = "hidden"
                    tipobj.style.left = "-1000px"
                    tipobj.style.backgroundColor = ''
                    tipobj.style.width = ''
                }
            }

            document.onmousemove = positiontip

    </script>
    <div id="dialog-upload" title="Upload File">
    <p>Click on the Browse button to select a file , Click save to upload the file to EHR-MIPP application.</p><br>
    <input type="file" name="upfile"/>
    </div>
    </form>
    <div id="dgSubmitReg" title="Submit Registration">
    </div>
    <div id="dgAcceptTerms" title="Accept Terms">
    </div>

    </body>
    </html>