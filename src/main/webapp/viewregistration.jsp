<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>EHR- Track Registration</title>
<link type="text/css" href="themes/base/jquery.ui.all.css" rel="stylesheet" />
<link href="page_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
<script src="js/jquery.tools.min.js"></script>
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
<script type="text/javascript" src="js/slidedeck.jquery.lite.pack.js"></script>
<script type="text/javascript" src="js/myutils.js"></script>
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

<style type="text/css">
		div#users-contain { width: 600px; margin: 20px 0; }
		div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 110%; }
		div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
		.ui-dialog .ui-state-error { padding: .3em; }
		.validateTips { border: 1px solid transparent; padding: 0.3em; }

</style>
<script type="text/javascript">
$(document).ready(function()
	{
		timer();
		links();
		showprocessor();
	}
);

	$(document).ready(function(){
		$('#pd').hide(); // hide the div of slide deck on login.
		$('#fq').hide(); // hide the div of slide deck on login.
		$('#hs').hide(); // hide the div of slide deck on login.
		$('#pa').hide(); // hide the div of slide deck on login.
		$('#show1').hide();
		$('#step2').hide();
		$('#step3').hide();
		$('#step4').hide();
		$('#step5').hide();
		$('#step6').hide();
		$('#step3process').hide();
		$('#step4process').hide();
		$('#step5process').hide();
		$('#step6process').hide();
		$('#step2complete').hide();
		$('#step3complete').hide();
		$('#step4complete').hide();
		$('#step5complete').hide();
		$('#step6complete').hide();
		$('#select1icon').hide();
		$('#select2icon').hide();
		$('#select3icon').hide();
		$('#select4icon').hide();
		$('#select5icon').hide();
		$('#select6icon').hide();

		$('#step3process1complete').hide();
		$('#step3process2complete').hide();
		$('#step4process1complete').hide();
		$('#step4process2complete').hide();
		$('#step5process1complete').hide();
		$('#step5process2complete').hide();
		$('#step6process1complete').hide();
		$('#step6process2complete').hide();

	});

	$(function() {
		$("#dgSubmitReg").dialog({
			autoOpen: false,
			modal: true,
			buttons: {
				Ok: function() {
				$(this).dialog('close');
				var myTimer = {};
						myTimer = $.timer(2000,function(){
							// Display hello message when timer goes off
							//alert("hello");
							window.open("registrationack.jsp",'_self');
						});

				},
				Cancel: function()
				{
				$(this).dialog('close');
				}
			}

		});
		$('#submit').click(function(){
//				alert('checked '+document.forms[0].terms1.checked);
				if(!document.forms[0].terms1.checked)
				{
							$('#dgAcceptTerms').text('Please Accept The Terms And Conditions Before Submitting The Registration');
							$('#dgAcceptTerms').dialog('open');
							return false;
				}
				else
				{
					$('#dgSubmitReg').text('Are You Sure You Want To Submit The Registration for state review?');
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
              height:600,
              width: 600,
              modal: true,
              buttons: {
                  OK: function() {
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
//		var pstart = $("#periodstart");
		$("#dialog-attest").dialog({
			autoOpen: false,
			height:575,
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
	$(function() {
		$("#dialog-pstatus").dialog({
			autoOpen: false,
            height:400,
            width: 720,
            modal: true,
			buttons: {

				Cancel: function()
				{
				$(this).dialog('close');
				},
				Override: function() {
					var myTimer = {};
						myTimer = $.timer(1000,function(){
							// Display hello message when timer goes off
							//alert("hello");
							$('#select1icon').show();
							$('#process1icon').hide();

						});
					$(this).dialog('close');
				},
				Deny: function()
				{
				$(this).dialog('close');
				},
				GenerateLetter: function()
				{
				$(this).dialog('close');
				}
			}

		});
	});
$(function() {
		$("#dialog-Approve").dialog({
			autoOpen: false,
            height:500,
            width: 750,
            modal: true,
			buttons: {

				Cancel: function()
				{
				$(this).dialog('close');
				},
				Approve: function() {
					var myTimer = {};
						myTimer = $.timer(1000,function(){
							// Display hello message when timer goes off
							//alert("hello");
							$('#step3').hide();
								$('#step4info').hide();
							$('#step4process').show();
							$('#step3process').hide();
							$('#step3complete').show();

						});
					$(this).dialog('close');
				},
				Deny: function()
				{
				$(this).dialog('close');
				}
			}

		});
	});
$(function() {
		$("#dialog-payment").dialog({
			autoOpen: false,
            height:510,
            width: 800,
            modal: true,
			buttons: {

				Cancel: function()
				{
				$(this).dialog('close');
				},
				Submit: function() {
					var myTimer = {};
						myTimer = $.timer(3500,function(){
							// Display hello message when timer goes off
							//alert("hello");
							$('#step4').hide();
							$('#step5info').hide();
							$('#step5process').show();
							$('#step4process').hide();
							$('#step4complete').show();

						});
					$(this).dialog('close');
				},
				Deny: function()
				{
				$(this).dialog('close');
				}
			}

		});
	});
$(function() {
		$("#dialog-paymentapprove").dialog({
			autoOpen: false,
            height:510,
            width: 800,
            modal: true,
			buttons: {

				Cancel: function()
				{
				$(this).dialog('close');
				},
				Approve: function() {
					var myTimer = {};
						myTimer = $.timer(3500,function(){
							// Display hello message when timer goes off
							//alert("hello");
							$('#step5').hide();
							$('#step6info').hide();
							$('#step6process').show();
							$('#step5process').hide();
							$('#step5complete').show();

						});
					$(this).dialog('close');
				},
				Deny: function()
				{
				$(this).dialog('close');
				}
			}

		});
	});
 $(function() {
		$("#dialog-plicense").dialog({
			autoOpen: false,
            height:400,
            width: 420,
            modal: true,
			buttons: {

				Ok: function()
				{
				$(this).dialog('close');
				},

			}

		});
	});
	$(function() {
		$("#dialog-psanction").dialog({
			autoOpen: false,
            height:400,
            width: 720,
            modal: true,
			buttons: {

				Cancel: function()
				{
				$(this).dialog('close');
				},
				Override: function() {
					var myTimer = {};
						myTimer = $.timer(1000,function(){
							// Display hello message when timer goes off
							//alert("hello");
							$('#select3icon').show();
							$('#process3icon').hide();

						});
					$(this).dialog('close');
				},
				Deny: function()
				{
				$(this).dialog('close');
				},
				GenerateLetter: function()
				{
				$(this).dialog('close');
				}
			}

		});
	});
	$(function() {
		$("#dialog-evolume").dialog({
			autoOpen: false,
			height:400,
            width: 750,
			modal: true,
			buttons: {

				Cancel: function()
				{
				$(this).dialog('close');
				},
				Override: function() {
					var myTimer = {};
						myTimer = $.timer(2000,function(){
							// Display hello message when timer goes off
							//alert("hello");
							$('#select4icon').show();
							$('#select6icon').show();
							$('#process4icon').hide();
							$('#process5icon').hide();

						});
					$(this).dialog('close');
				},
				Deny: function()
				{
				$(this).dialog('close');
				}


			}

		});
	});
	$(function() {
		$("#dialog-evolume").dialog({
			autoOpen: false,
			height:400,
            width: 750,
			modal: true,
			buttons: {

				Cancel: function()
				{
				$(this).dialog('close');
				},
				Override: function() {
					var myTimer = {};
						myTimer = $.timer(3500,function(){
							// Display hello message when timer goes off
							//alert("hello");
							$('#select4icon').show();
							$('#select6icon').show();
							$('#process4icon').hide();
							$('#process5icon').hide();

						});
					$(this).dialog('close');
				},
				Deny: function()
				{
				$(this).dialog('close');
				}


			}

		});
	});
	$(function() {
		var myTimer = {};
		$("#dialog-ecertificaion").dialog({
			autoOpen: false,
			height:300,
            width: 600,
			modal: true,
			buttons: {

				Cancel: function()
				{
				$(this).dialog('close');
				},
				Accept: function() {
						OpenProcessor();
						myTimer = $.timer(3500,function(){
							// Display hello message when timer goes off
							//alert("hello");
							$('#process5icon').hide();
							$('#select5icon').hide();
							$('#step3process').show();
							$('#step2complete').show();

							$('#step3info').hide();
							$('#step2process').hide();
							jQuery('#step2').hide();

						});
					$(this).dialog('close');
				},
				Deny: function()
				{
					myTimer = $.timer(2000,function(){
							// Display hello message when timer goes off
							//alert("hello");
							$('#select6icon').show();
							$('#process5icon').hide();

						});
				$(this).dialog('close');
				}
			}

		});
	});
	</script>

</head>
<body>
<div id="templatemo_banner_wrapper">

    <div id="templatemo_banner">

    	<div id="banner_content" >


	</div>
</div> <!-- end of templatemo_banner -->

</div> <!-- end of templatemo_banner_wrapper -->
<form action="viewRegistration"name="frmresult" id="form1">
<div id="templatemo_menu_wrapper">
	<div id="templatemo_menu">
        <ul>
		 <li><a href="index" id="homep" class="modalInput" rel="#showprocessor"><span></span>Home</a></li>

                        <li><a href="trackRegistrationList"  id="track" class="modalInput " rel="#showprocessor"><span></span>Track</a></li>

                        <li><a href="grievanceDetails"  id="grievance" class="modalInput " rel="#showprocessor"><span></span>Grievance</a></li>
        </ul>
    </div> <!-- end of templatemo_menu -->

</div> <!-- end of templatemo_menu_wrapper -->

<div id="templatemo_content">
	<div class="section_w940">
        <div class="product_box margin_r_20">
                <h2>Review Workflow</h2>
                <img src="images/Process.png" alt="image 1" />
                <p>Review Application for registration approval and payment processing.</p>
                <div class="cleaner"></div>
         </div>
         <div class="product_box margin_r_20">
                <h2>Selected Provider</h2>
                        <p>NPI: 1033366513</p>
                        <p>Tax ID / SSN: 999-99-9999</p>
                <div class="cleaner"></div>
         </div>
         <div class="product_box">
                <h2>Login Information</h2>
                        <p>User ID: smithj</p>
                        <p>Profile: Super Administrator</p>
         <div class="cleaner"></div>
         </div>
    </div><!-- End of section_w940 -->
	<br/>
		<div class="section_w940">
        	<h2>Registration Approval and Payment Process</h2>
			<fieldset>
				<table cellspacing=0 cellpadding=0 width="100%" border="0">
					<tr valign="middle">
						<td><img src="images/Process-Accept.png" onMouseover="displaycontent('regcomp')" onMouseout="hideddrivetip()" style="cursor: hand" /></td>
						<td><img width=115px height=11px src="images/forward.png"/></td>
						<td><img src="images/running_process.png" id='step2process' onMouseover="displaycontent('streview')" onMouseout="hideddrivetip()"  onclick="jQuery('#step2').show();return false" style="cursor: hand"  /><img src="images/Process-Accept.png" id='step2complete' onMouseover="displaycontent('streviewcomp')" onMouseout="hideddrivetip()" style="cursor: hand"></td>
						<td><img width=115px height=11px src="images/forward.png"/></td>
						<td><img  src="images/Process-Info.png" id = 'step3info'/ onMouseover="displaycontent('regapp')" onMouseout="hideddrivetip()" style="cursor: hand"><img src="images/running_process.png" id='step3process' onclick="jQuery('#step3').show();return false" onMouseover="displaycontent('appinprocess')" onMouseout="hideddrivetip()" style="cursor: hand"  /><img src="images/Process-Accept.png" id='step3complete' onMouseover="displaycontent('appcomp')" onMouseout="hideddrivetip()" style="cursor: hand"></td>
						<td><img width=115px height=11px src="images/forward.png"/></td>
						<td><img  src="images/Process-Info.png"id = 'step4info' onMouseover="displaycontent('initpay')" onMouseout="hideddrivetip()"  style="cursor: hand"/><img src="images/running_process.png" id='step4process' onclick="jQuery('#step4').show();return false" style="cursor: hand"  /><img src="images/Process-Accept.png" id='step4complete'></td>
						<td><img width=115px height=11px src="images/forward.png"/></td>
						<td><img src="images/Process-Info.png"id = 'step5info' onMouseover="displaycontent('apppay')" onMouseout="hideddrivetip()"   style="cursor: hand"/><img src="images/running_process.png" id='step5process' onclick="jQuery('#step5').show();return false" style="cursor: hand"  /><img src="images/Process-Accept.png" id='step5complete'></td>
						<td><img width=115px height=11px src="images/forward.png"/></td>
						<td><img  src="images/Process-Info.png"id = 'step6info' onMouseover="displaycontent('nlrupd')" onMouseout="hideddrivetip()"  style="cursor: hand"/><img src="images/running_process.png" id='step6process' onclick="jQuery('#step6').show();return false" style="cursor: hand"  /><img src="images/Process-Accept.png" id='step6complete'></td>
					</tr>
					<tr valign="top">
						<td colspan="2"><font size=2> Step-1<br />Registration <br/>Submitted
						</td>
						<td colspan="2"><font size=2>Step-2<br/> Registration Review<!--img src="images/Download.png" alt="click to view" onclick="jQuery('#show1').show()" style="cursor: hand" return false" /!-->
						</td>
						<td colspan="2"><font size=2>Step-3<br /> Registration Approval<br /><!--img src="images/Download.png" alt="click to view" onclick="jQuery('#show1').show()" style="cursor: hand" return false" /!-->
						</td>
						<td colspan="2"><font size=2>Step-4<br />Initiate Payment</td>
						<td colspan="2"><font size=2>Step-5<br />Approve Payment</td>
						<td colspan="2"><font size=2>Step-6<br />Payment Made</td>
					</tr>


				</table>
			</fieldset>
        <div class="cleaner"></div>
		</div>
		<br/>
		<br/>
		<div class="section_w940">
			<div id="step2">
				<table cellspacing="0" cellpadding="0" width="75%" border="0">
					<tr valign="center" bgcolor="#efefef">
						<td width="20%"><h3>State Review Process Flow</h3></td>
						<td width="8%"><img src="images/Process-Accept.png" id="process1icon" onclick="jQuery('#dialog-pstatus').dialog('open'); return false" style="cursor: hand"/></a> <img src="images/select.png" id="select1icon"/><br>Provider<br> Status</td>
						<td valign="center"width="5%" ><img  src="images/blue_arrow_right.png"/></td>
						<td width="8%"><img src="images/Process-Accept.png" id="process2icon" onclick="jQuery('#dialog-plicense').dialog('open'); return false" style="cursor: hand"/></a> <img src="images/select.png" id="select2icon"/><br>License<br> Validation</td>
						<td valign="center"width="5%" ><img  src="images/blue_arrow_right.png"/></td>
						<td width="8%"><img src="images/Process-Accept.png" id="process3icon" onclick="jQuery('#dialog-psanction').dialog('open'); return false" style="cursor: hand"/></a> <img src="images/select.png" id="select3icon"/><br>Sanction<br> Review</td>
						<td valign="center"width="5%" ><img  src="images/blue_arrow_right.png"/></td>
						<td width="8%"><img src="images/Process-Warning.png" id="process4icon" onclick="jQuery('#dialog-evolume').dialog('open'); return false" style="cursor: hand"/></a> <img src="images/Process-Accept.png" id="select4icon"/><br>Volume <br>Review</td>
						<td valign="center" width="5%"><img  src="images/blue_arrow_right.png"/></td>
						<td width="10%" ><img src="images/Process-Info.png" id="process5icon" onclick="jQuery('#dialog-ecertificaion').dialog('open'); return false" style="cursor: hand"/></a> <img src="images/stop.png" id="select5icon"/><img src="images/Process-Warning.png" id="select6icon" onclick="jQuery('#dialog-ecertificaion').dialog('open'); return false" style="cursor: hand"/><br>EHR Certfication <br>Review</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="section_w940">
			<div id="step3">
				 <table cellspacing=0 cellpadding=0 width="60%" border="0">
							<tr valign="center">
								<td width="35%" align="center" bgcolor="#efefef"><h3>Registration approval process</h3></td>
								<td width="8%" bgcolor="#efefef"><img src="images/Process-Warning.png" id="step3process1icon" onclick="jQuery('#dialog-Approve').dialog('open'); return false" style="cursor: hand"/></a> <img src="images/Process-Accept.png" id="step3process1complete"/><br>Approve<br> Registration</td>
								<td valign="top"width="5%" bgcolor="#efefef" ><img  src="images/blue_arrow_right.png"/></td>
								<td width="8%" bgcolor="#efefef"><img src="images/Process-Info.png" id="step3process2icon" onclick="jQuery('#dialog-plicense').dialog('open'); return false" /></a> <img src="images/Process-Warning.png" id="step3process2complete"/><br>Generate<br>Correspondence</td>
							</tr>
					</table>
				</fieldset>
			</div>
		</div>
		<div class="section_w940">
			<div id="step4">
				 <table cellspacing=0 cellpadding=0 width="70%" border="0" >
							<tr valign="center">
								<td>&nbsp;</td>
								<td width="35%" align="center" bgcolor="#efefef"><h3>Payment initiation process</h3></td>
								<td width="8%" bgcolor="#efefef"><img src="images/Process-Accept.png" id="step4process1icon" onclick="jQuery('#dialog-Approve').dialog('open'); return false" /></a> <img src="images/Process-Warning.png" id="step4process1complete"/><br>Duplicate<br> Check</td>
								<td valign="top"width="5%" bgcolor="#efefef"><img  src="images/blue_arrow_right.png"/></td>
								<td width="8%" bgcolor="#efefef"><img src="images/Process-Warning.png" id="step4process2icon" onclick="jQuery('#dialog-payment').dialog('open'); return false" style="cursor: hand"/></a> <img src="images/Process-Warning.png" id="step4process2complete"/><br>Create<br>Payment</td>
							</tr>
					</table>
			</div>
		</div>
		<div class="section_w940">
			<div id="step5">
					 <table cellspacing=0 cellpadding=0 width="80%" border="0">
							<tr valign="center">
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td width="35%" align="center" bgcolor="#efefef"><h3>Payment approval process</h3></td>
								<td width="8%" bgcolor="#efefef"><img src="images/Process-Warning.png" id="step5process1icon" onclick="jQuery('#dialog-paymentapprove').dialog('open'); return false" style="cursor: hand"/ /></a> <img src="images/Process-info.png" id="step5process1complete"/><br>Approve<br> Payment</td>
								<td valign="top"width="5%" bgcolor="#efefef" ><img  src="images/blue_arrow_right.png"/></td>
								<td width="12%" bgcolor="#efefef"><img src="images/Process-info.png" id="step5process2icon" /></a> <img src="images/Process-Warning.png" id="step5process2complete"/><br>State Accounting System<br>Submission</td>
							</tr>
					</table>
			</div>
		</div>
		<div class="section_w940">
			<div id="step6">
					 <table cellspacing=0 cellpadding=0 width="80%" border="0">
							<tr valign="center">
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td width="35%" align="center" bgcolor="#efefef"><h3>Payment completion process</h3></td>
								<td width="8%" bgcolor="#efefef"><img src="images/Process-Info.png" id="step6process1icon" onclick="jQuery('#dialog-Approve').dialog('open'); return false" /></a> <img src="images/Process-Warning.png" id="step6process1complete"/><br>RA<br>Generated</td>
								<td valign="top"width="5%" bgcolor="#efefef"><img  src="images/blue_arrow_right.png"/></td>
								<td width="8%" bgcolor="#efefef"><img src="images/Process-Info.png" id="step6process2icon" onclick="jQuery('#dialog-payment').dialog('open'); return false" /></a> <img src="images/Process-Warning.png" id="step6process2complete"/><br>NLR<br>Confirmation</td>

							</tr>
					</table>

			</div>
		</div>
    <div class="section_w940" id="show1">
     <div id="slidedeck_frame">
			<dl class="slidedeck">
				<dt>NLR Information</dt>
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
                                            <td width="25%"><h5>John</h5></td>
                                            <td><h4>Last Name</h4></td>
                                            <td>:</td>
                                            <td><h5>Doe</h5></td>
                                        </tr>
                                        <tr>
                                            <td><h4>Middle Initial</h4></td>
                                            <td>:</td>
                                            <td><h5>A</h5></td>
                                            <td><h4>Suffix</h4></td>
                                            <td>:</td>
                                            <td><h5>&nbsp;</h5></td>
                                        </tr>
                                        <tr>
                                            <td><h4>Provider Type</h4></td>
                                            <td>:</td>
                                            <td colspan="2"><h5>Doctor of Medicine</h5></td>
                                        </tr>
                                        <tr>
                                            <td><h4>Provider Speciality</h4></td>
                                            <td>:</td>
                                            <td colspan="2"><h5>Speciality</h5></td>
                                        </tr>
                                      </table>
                                	</fieldset>
                              </td>
                              <td width="50%">
                              	<fieldset style="width:310px">
                                    <legend align="center"><h6>Address</h6></legend>
                                    <table width="100%" border="0" cellpadding="2" cellspacing="0">
                                        <tr>
                                            <td width="25%"><h4>Address</h4></td>
                                            <td width="2%">:</td>
                                            <td><h5>1234 Michigan Ave</h5></td>
                                        </tr>
                                        <tr>
                                            <td><h4>City</h4></td>
                                            <td>:</td>
                                            <td><h5>Lansing</h5></td>
                                        </tr>
                                        <tr>
                                            <td><h4>State</h4></td>
                                            <td>:</td>
                                            <td><h5>Michigan</h5></td>
                                            <td><h4>Zip</h4></td>
                                            <td>:</td>
                                            <td><h5>48917-1234</h5></td>
                                        </tr>
                                         <tr>
                                            <td><h4>Phone</h4></td>
                                            <td>:</td>
                                            <td><h5>517-111-2222</h5></td>
                                            <td><h4>Ext</h4></td>
                                            <td>:</td>
                                            <td><h5>2121</h5></td>
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
                                                    <td colspan="4"><p>Please note, the tax identification number (TIN) captured below will receive the EHR incentive
                                                        payment.</p></td>
                                                </tr>
                                                <tr>
                                                    <td><h4>NPI</h4></td>
                                                    <td>:</td>
                                                    <td><h5>1033366513</h5></td>
                                                </tr>
                                                <tr>
                                                    <td width="25%"><h4>SSN/TIN</h4></td>
                                                    <td width="2%">:</td>
                                                    <td><h5>999-99-9999</h5></td>
                                                </tr>
                                              </table>
                                         </fieldset>
                              	</td>
                                <td width="50%" valign="top">
                                     <fieldset style="width:310px">
                                        <legend align="center"><h6>Exclusions</h6></legend>
                                            <table width="100%" border="0" cellpadding="1" cellspacing="2">
                                                <tr>
                                                    <td width="40%"><h4>Exclusion Code</h4></td>
                                                    <td>:</td>
                                                    <td><h5>1128Aa</h5></td>
                                                </tr>
                                                <tr>
                                                    <td><h4>Exclusion Desc</h4></td>
                                                    <td>:</td>
                                                    <td><h5>Description</h5></td>
                                                </tr>
                                                <tr>
                                                    <td width="25%"><h4>Exclusion Date</h4></td>
                                                    <td width="2%">:</td>
                                                    <td><h5>12/31/2010</h5></td>
                                                </tr>
                                              </table>
                                         </fieldset>
                              	</td>
                             </tr>
                         </table>
                </dd>
                <dt>MMIS Provider Info</dt>
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
                                            <td><h5>John</h5></td>
                                            <td><h4>Last Name</h4></td>
                                            <td>:</td>
                                            <td><h5>Smith</h5></td>
                                        </tr>
                                        <tr>
                                            <td><h4>Middle Initial</h4></td>
                                            <td>:</td>
                                            <td><h5>A</h5></td>
                                            <td><h4>Suffix</h4></td>
                                            <td>:</td>
                                            <td><h5>&nbsp;</h5></td>
                                        </tr>
                                        <tr>
                                            <td><h4>Provider Type</h4></td>
                                            <td>:</td>
                                            <td colspan="3"><h5>Physcian</h5></td>
                                        </tr>
                                        <tr>
                                            <td><h4>Date Of Birth</h4></td>
                                            <td>:</td>
                                            <td colspan="2"><h5>05/03/1966</h5></td>
                                        </tr>
                                      </table>
                                	</fieldset>
                              </td>
                              <td width="50%">
                              	<fieldset style="width:310px">
                                    <legend align="center"><h6>Address</h6></legend>
                                    <table width="100%" border="0" cellpadding="2" cellspacing="0">
                                        <tr>
                                            <td width="25%"><h4>Address</h4></td>
                                            <td width="2%">:</td>
                                            <td><h5>300 Michigan Ave</h5></td>
                                        </tr>
                                        <tr>
                                            <td><h4>City</h4></td>
                                            <td>:</td>
                                            <td><h5>Lansing</h5></td>
                                        </tr>
                                        <tr>
                                            <td><h4>State</h4></td>
                                            <td>:</td>
                                            <td><h5>Michigan</h5></td>
                                            <td><h4>Zip</h4></td>
                                            <td>:</td>
                                            <td><h5>48917-1234</h5></td>
                                        </tr>
                                         <tr>
                                            <td><h4>Phone</h4></td>
                                            <td>:</td>
                                            <td><h5>517-111-2222</h5></td>
                                            <td><h4>Ext</h4></td>
                                            <td>:</td>
                                            <td><h5>2121</h5></td>
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
                                                    <td><h5>Physician/General Practice</h5></td>
                                                </tr>
                                                 <tr>
                                                    <td><h4>Taxonomy</h4></td>
                                                    <td>:</td>
                                                    <td><h5>208D00000X - General Practice</h5></td>
                                                </tr>
                                              </table>

                                         </fieldset>
                              	</td>
                                <td width="50%" valign="top">
                                     <fieldset style="width:310px">
                                        <legend align="center"><h6>Licenses/Certifications</h6></legend>
                                            <table width="100%" border="1" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td><h4>Type</h4></td>
                                                    <td><h4>Number</h4></td>
                                                    <td><h4>Expiration Date</h4></td>
                                                </tr>
                                                <tr>
                                                    <td><h5>MI License</h5></td>
                                                    <td><h5>4704232724</h5></td>
                                                    <td><h5>12/31/2012</h5></td>
                                                </tr>
                                                <tr>
                                                    <td><h5>CLIA</h5></td>
                                                    <td><h5>14D0413011</h5></td>
                                                    <td><h5>12/31/2012</h5></td>
                                                </tr>
                                                <tr>
                                                    <td><h5>DEA</h5></td>
                                                    <td><h5>AA1005461</h5></td>
                                                    <td><h5>12/31/2999</h5></td>
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
                                  <th>Participating Year</th>
                                  <th>Reporting Period Start</th>
                                  <th>Reporting Period End</th>
                                  <th>EHR Investment Amount</th>
                                  <th>Pediatrician </th>
                                  <th>FQHC /RHC</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                 <td align="left"><input type="image" title="Click To Add Eligibility Details" src="images/edit.jpg" onclick="jQuery('#dialog-elig-form').dialog('open'); return false">&nbsp;&nbsp;Year 1</td>
                                 <td id="ps1">01/01/2011</td>
                                 <td id="pe1">03/31/2011</td>
                                 <td id="ea1">$ 30,000.00</td>
                                 <td id="pt1">No</td>
                                 <td id="fq1">No</td>
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
			  permits the government to verify information by way of computer matches.
			  </p>
		</div>
		   <table width="655px">
		   <tr>
		   <td width="40%">
			<input type=checkbox id="terms" name="terms1" checked=true disabled > I accept the terms and conditions</input></td>
			<td align="center">
			<!--input type="button" id="submit" alt="Submit" Value="Submit Registartion"-->
			</td>
		   <td align="right">
			<input type="image" src="images/print-preview.png" alt="print preview" id="print1" title="Print Preview" >
			</td>
			</tr>
			</table>
		</fieldset>
	</dd>
	</d1>
		<script type="text/javascript">
			$('.slidedeck').slidedeck();
		</script>
        </div>
    	<div class="cleaner"></div>
    </div>
</div> <!-- end of templatemo_content -->
<div class="processor" id="showprocessor">
	<table><tr><td><img src="images/red-processor-small1.gif"/></td><td><h4 class="redclass">&nbsp;&nbsp;Please Wait<h4></td><tr></table>
 <div class="close" id="CloseBtn"></div>
 </div>
<div id="templatemo_content_bottom"></div>
<div id="templatemo_footer">
        Copyright &copy; 2013 <a href="grievanceDetails">GrievanceApp</a> | Development
</div> <!-- end of footer -->
<div id="dhtmltooltip"></div>
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
          <form action="#" method="post" name="f">
          <p><b>Bold</b> fields are required.</p>
          <fieldset>
          <legend>Reporting Period for </legend>
              <label for="Period Start"   class="required">Period Start: </label>
              <input type="text" id="periodstart" name="periodstart" tabindex="1" value="01/01/2011" title="period start" required="required"><br>
              <label for="Period End" class="required">Period End: </label>
              <input type="text" id="periodend" name="periodend" tabindex="2" value="03/31/2011" title="period end">
              <br>
          </fieldset>
          <fieldset>
          <legend>Encounter Volume</legend>
              <label for="Total Enc"  class="required">Total Encounters: </label>
              <input type="text" id="totalenc" name="totalenc" tabindex="3" value="30000" title="Total Encounters"><br>
              <label for="Medicaid Enc" class="required">Medicaid Encounters: </label>
              <input type="text" id="medicaidenc" name="medicaidenc" tabindex="4" value="10000" title="medicaid encounters"><br>
          </fieldset>
           <fieldset>
          <legend>EHR Certification Information</legend>
              <label for="Cert Num"  class="required">EHR Certification Number: </label>
              <input type="text" id="certnum" name="certnum" tabindex="5" value="123876900" title="Certification Number"><br>
              <label for="certamt" class="required">EHR Investment Amount: </label>
              <input type="text" id="certamt" name="certamt" tabindex="6" value="30,000.00" title="Investment Amount"><br>
          </fieldset>
          <fieldset>
          <legend>Medicaid Patient Volume</legend>
              <label for="pediatrician"  class="required">Are you a pediatrician?:</label>
              <input type="radio"  name="rpediatrician" onClick = "jQuery('#pd').show(); return false" value="Y" />Yes &nbsp; <input type="radio" name="rpediatrician" onClick = "jQuery('#pd').hide(); return false" value="N"selected="selected" />No <br>
				<div id="pd">
                	<fieldset>
                      <label for="Total Enc"  class="required">Total Encounters: </label>
                      <input type="text" id="totalenc" name="totalenc" tabindex="1" value="" title="Total Encounters"><br>
                      <label for="Medicaid Enc" class="required">Medicaid Encounters: </label>
                      <input type="text" id="medicaidenc" name="medicaidenc" tabindex="2" value="" title="medicaid encounters"><br>
         		 </fieldset>
                </div>
                <label   class="required">Are you a FQHC/RHC provider?:</label>
              <input type="radio"  name="radiofqhc" onClick = "jQuery('#fq').show(); return false" value="Y" />Yes &nbsp; <input type="radio" name="radiofqhc" onClick = "jQuery('#fq').hide(); return false" value="N" selected />No <br>
				<div id="fq">
                	<fieldset>
                      <label for="Total Enc"  class="required">Total Encounters: </label>
                      <input type="text" id="totalenc" name="totalenc" tabindex="1" value="" title="Total Encounters"><br>
                      <label for="Medicaid Enc" class="required">Medicaid Encounters: </label>
                      <input type="text" id="medicaidenc" name="medicaidenc" tabindex="2" value="" title="medicaid encounters"><br>
         		 </fieldset>
                </div>
                <label   class="required">Are you a hospital based provider?:</label>
              <input type="radio"  name="radiohospital" onClick = "jQuery('#hs').show(); return false" value="Y" />Yes &nbsp; <input type="radio" name="radiohospital" onClick = "jQuery('#hs').hide(); return false" value="N" />No <br>
				<div id="hs">
                	<fieldset>
                      <label for="Total Enc"  class="required">Total Encounters: </label>
                      <input type="text" id="totalenc" name="totalenc" tabindex="1" value="" title="Total Encounters"><br>
                      <label for="Medicaid Enc" class="required">Medicaid Encounters: </label>
                      <input type="text" id="medicaidenc" name="medicaidenc" tabindex="2" value="" title="medicaid encounters"><br>
         		 </fieldset>
                </div>
                <label   class="required">Are you a physcian assistant?:</label>
                <input type="radio"  name="radiopa" onClick = "jQuery('#pa').show(); return false" value="Y" />Yes &nbsp; <input type="radio" name="radiopa" onClick = "jQuery('#pa').hide(); return false" value="N" />No <br>
				<div id="pa">
                	<fieldset>
                      <label for="Total Enc"  class="required">Total Encounters: </label>
                      <input type="text" id="totalenc" name="totalenc" tabindex="1" value="" title="Total Encounters"><br>
                      <label for="Medicaid Enc" class="required">Medicaid Encounters: </label>
                      <input type="text" id="medicaidenc" name="medicaidenc" tabindex="2" value="" title="medicaid encounters"><br>
         		 </fieldset>
                </div>
            </fieldset>

</form>
<div id="dgSubmitReg" title="Submit Registration">
</div>
<div id="dgAcceptTerms" title="Accept Terms">
</div>
<div id="dialog-plicense" title="Workflow- License Validation" class="ui-widget">
	<table class="ui-widget ui-widget-content" cellpadding="1" cellspacing="1" width="100%">
		<thead>
			<tr class="ui-widget-header ">
				<th>Type</th>
				<th>Number</th>
				<th>Expiration Date</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><h5>MI License</h5></td>
				<td><h5>4704232724</h5></td>
				<td><h5>12/31/2012</h5></td>
			</tr>
			<tr>
				<td><h5>CLIA</h5></td>
				<td><h5>14D0413011</h5></td>
				<td><h5>12/31/2012</h5></td>
			</tr>
			<tr>
				<td><h5>DEA</h5></td>
				<td><h5>AA1005461</h5></td>
				<td><h5>12/31/2999</h5></td>
			</tr>
		</tbody>
		</table>
</div>
<div id="dialog-Approve" title="Workflow- Provider Validation" class="ui-widget">
	<table width="100% border="0">
                        <tr>
                          <td width="50%">
                                <fieldset style="width:350px">
                            	  <legend align="center"><h6>Basic Info</h6></legend>
                                    <table width="100%" border="0" cellpadding="2" cellspacing="0">
                                        <tr>
                                            <td width="35%"><h4>First Name</h4></td>
                                            <td width="2%">:</td>
                                            <td><h5>John</h5></td>
                                            <td><h4>Last Name</h4></td>
                                            <td>:</td>
                                            <td><h5>Smith</h5></td>
                                        </tr>
                                        <tr>
                                            <td><h4>Middle Initial</h4></td>
                                            <td>:</td>
                                            <td><h5>A</h5></td>
                                            <td><h4>Suffix</h4></td>
                                            <td>:</td>
                                            <td><h5>&nbsp;</h5></td>
                                        </tr>

                                        <tr>
                                            <td><h4>Date Of Birth</h4></td>
                                            <td>:</td>
                                            <td colspan="2"><h5>05/03/1966</h5></td>
                                        </tr>
										 <tr>
                                            <td><h4>Provider NPI</h4></td>
                                            <td>:</td>
                                            <td ><h5>123456789</h5></td>
											<td><h4>Tax ID</h4></td>
                                            <td>:</td>
                                            <td><h5>56789345</h5></td>
                                        </tr>
										<tr>
                                            <td><h4>Business Status</h4></td>
                                            <td>:</td>
                                            <td ><h5>Active</h5></td>

                                        </tr>
                                      </table>
                                	</fieldset>
                              </td>
                              <td width="50%">
                              	<fieldset style="width:310px">
                                    <legend align="center"><h6>Review Informaion</h6></legend>
                                    <table width="100%" border="0" cellpadding="2" cellspacing="0">
                                        <tr>
                                            <td width="25%"><h4>Reviewed By</h4></td>
                                            <td width="2%">:</td>
                                            <td><h5>Simith John</h5></td>
                                        </tr>
                                        <tr>
                                            <td><h4>Date</h4></td>
                                            <td>:</td>
                                            <td><h5>08/09/2010</h5></td>
                                        </tr>
                                        <tr>

                                            <td width='40%'><h4>Medicaid Percentage</h4></td>
                                            <td>:</td>
                                            <td><h5>35</h5></td>
                                        </tr>
                                         <tr>
                                            <td width='40%'><h4>Certification Status</h4></td>
                                            <td>:</td>
                                            <td><h5>Certified</h5></td>

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
                                                    <td><h5>Physician/General Practice</h5></td>
                                                </tr>
                                                 <tr>
                                                    <td><h4>Taxonomy</h4></td>
                                                    <td>:</td>
                                                    <td><h5>208D00000X - General Practice</h5></td>
                                                </tr>
												<tr>
                                                    <td><h4>Payment Withhold</h4></td>
                                                    <td>:</td>
                                                    <td><h5>No</h5></td>
                                                </tr>
												<tr>
                                                    <td><h4>Sanction</h4></td>
                                                    <td>:</td>
                                                    <td><h5>No</h5></td>
                                                </tr>
                                              </table>

                                         </fieldset>
                              	</td>
                                <td width="50%" valign="top">
                                     <fieldset style="width:310px">
                                        <legend align="center"><h6>Licenses/Certifications</h6></legend>
                                            <table width="100%" border="1" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td><h4>Type</h4></td>
                                                    <td><h4>Number</h4></td>
                                                    <td><h4>Expiration Date</h4></td>
                                                </tr>
                                                <tr>
                                                    <td><h5>MI License</h5></td>
                                                    <td><h5>4704232724</h5></td>
                                                    <td><h5>12/31/2012</h5></td>
                                                </tr>
                                                <tr>
                                                    <td><h5>CLIA</h5></td>
                                                    <td><h5>14D0413011</h5></td>
                                                    <td><h5>12/31/2012</h5></td>
                                                </tr>
                                                <tr>
                                                    <td><h5>DEA</h5></td>
                                                    <td><h5>AA1005461</h5></td>
                                                    <td><h5>12/31/2999</h5></td>
                                                </tr>
                                              </table>
                                         </fieldset>
                              	</td>
                             </tr>
                         </table>
<table width="100% border="0">
   <tr>
                         <td width="100%">
						  <fieldset style="width:550px">
                            	  <legend align="center"><h6>Review Comments</h6></legend>
								  <textarea rows="5" cols="85">

									</textarea>

						   </fieldset>
						</td>
	</tr>

</table>
</div>
<div id="dialog-evolume" title="Workflow- Encounter Qualifying Volume Review">
	<table width="100% border="0">
                        <tr>
                         <td width="50%">
						  <fieldset style="width:370px">
                            	  <legend align="center"><h6>Encounter Volume</h6></legend>
                                    <table width="100%" border="0" cellpadding="2" cellspacing="0">
                                        <tr>
                                            <td ><h4>Year</h4></td>
                                            <td>:</td>
                                            <td><h5>1</h5></td>
                                            <td><h4>Type</h4></td>
                                            <td>:</td>
                                            <td><h5>Physician</h5></td>
                                        </tr>
                                        <tr>
                                            <td><h4>Start Date</h4></td>
                                            <td>:</td>
                                            <td><h5>01/01/2010</h5></td>
                                            <td><h4>End Date</h4></td>
                                            <td>:</td>
                                            <td><h5>04/01/2010</h5></td>
                                        </tr>

                                        <tr>
                                            <td width='35%'><h4>Total Volume</h4></td>
                                            <td>:</td>
                                            <td ><h5>1000</h5></td>
											<td width='45%'><h4>Medicaid Volume</h4></td>
                                            <td>:</td>
                                            <td ><h5>350</h5></td>

                                        </tr>
										 <tr>
                                            <td><h4>Percentage</h4></td>
                                            <td>:</td>
                                            <td><h5>35</h5></td>
                                        </tr>

                                      </table>
                                	</fieldset>

						</td>
					<td width="50%">
					<fieldset style="width:310px">
                                        <legend align="center"><h6>EP Qualifying Volumes</h6></legend>
                                            <table width="100%" border="1" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td><h4>Provider Type</h4></td>
                                                    <td><h4>Percentage</h4></td>

                                                </tr>
                                                <tr>
                                                    <td><h5>Physician</h5></td>
                                                    <td><h5>>=30</h5></td>

                                                </tr>
                                                <tr>
                                                    <td><h5>Pediatrician</h5></td>
                                                    <td><h5>>=20</h5></td>

                                                </tr>
                                                <tr>
                                                    <td><h5>FQHC/RHC Provider</h5></td>
                                                    <td><h5>>=30</h5></td>

                                                </tr>
												<tr>
                                                    <td><h5>MCO Primary Care Provider</h5></td>
                                                    <td><h5>>=30</h5></td>

                                                </tr>
												<tr>
                                                    <td><h5>Physician Assistant</h5></td>
                                                    <td><h5>>=50</h5></td>

                                                </tr>

                                              </table>
                                         </fieldset>
					</td>
</tr>

</table>
<table width="100% border="0">
   <tr>
                         <td width="100%">
						  <fieldset style="width:550px">
                            	  <legend align="center"><h6>Review Comments</h6></legend>
								  <textarea rows="5" cols="85">

									</textarea>

						   </fieldset>
						</td>
	</tr>

</table>
</div>
<div id="dialog-ecertificaion" title="Workflow- EHR Certification Information">
<table id="users" class="ui-widget ui-widget-content" cellpadding="1" cellspacing="1" width="100%">
                          <thead>
                              <tr class="ui-widget-header ">
                                  <th>Participating Year</th>
                                  <th>EHR Vendor</th>
                                  <th>Certification Number</th>
								  <th>Investment Amount</th>
                                  <th>Stage</th>
                                  <th>Status(ONC) </th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                 <td align="left">&nbsp;&nbsp;Year 1</td>
                                 <td id="ps1">General Electric</td>
                                 <td id="pe1">065321786</td>
								   <td id="pe1">$30,000.00</td>
                                 <td id="ea1">Adopt</td>
                                 <td id="pt1">Certified</td>

                              </tr>
                          </tbody>
                     </table>
<table width="100% border="0">
   <tr>
                         <td width="100%">
						  <fieldset style="width:475px">
                            	  <legend align="center">Review Comments</legend>
								  <textarea rows="5" cols="75">

									</textarea>

						   </fieldset>
						</td>
	</tr>

</table>

</div>
<div id="dialog-payment" title="Workflow- Approve Incentive Payment" class="ui-widget">
	<table width="100% border="0">
                        <tr>
                          <td width="50%">
                                <fieldset style="width:350px">
                            	  <legend align="center"><h6>Basic Info</h6></legend>
                                    <table width="100%" border="0" cellpadding="2" cellspacing="0">
                                        <tr>
                                            <td width="35%"><h4>First Name</h4></td>
                                            <td width="2%">:</td>
                                            <td><h5>John</h5></td>
                                            <td><h4>Last Name</h4></td>
                                            <td>:</td>
                                            <td><h5>Smith</h5></td>
                                        </tr>
                                        <tr>
                                            <td><h4>Middle Initial</h4></td>
                                            <td>:</td>
                                            <td><h5>A</h5></td>
                                            <td><h4>Suffix</h4></td>
                                            <td>:</td>
                                            <td><h5>&nbsp;</h5></td>
                                        </tr>

                                        <tr>
                                            <td><h4>Date Of Birth</h4></td>
                                            <td>:</td>
                                            <td colspan="2"><h5>05/03/1966</h5></td>
                                        </tr>
										 <tr>
                                            <td><h4>Provider NPI</h4></td>
                                            <td>:</td>
                                            <td ><h5>123456789</h5></td>
											<td><h4>Tax ID</h4></td>
                                            <td>:</td>
                                            <td><h5>56789345</h5></td>
                                        </tr>
										<tr>
                                            <td><h4>Business Status</h4></td>
                                            <td>:</td>
                                            <td ><h5>Active</h5></td>

                                        </tr>
                                      </table>
                                	</fieldset>
                              </td>
                              <td width="50%">
                              	<fieldset style="width:375px">
                                    <legend align="center"><h6>Payment Information</h6></legend>
                                    <table width="100%" border="0" cellpadding="2" cellspacing="0">
                                        <tr>
                                            <td width="25%"><h4>Pay Cycle</h4></td>
                                            <td width="2%">:</td>
                                            <td><h5>35</h5></td>
                                        </tr>
                                        <tr>
                                            <td width="25%"><h4>Payment Date</h4></td>
                                            <td>:</td>
                                            <td><h5>08/09/2010</h5></td>
                                        </tr>
                                        <tr>

                                            <td width="25%"><h4>Payment Amount</h4></td>
                                            <td>:</td>
                                            <td><h5>$21500.00</h5></td>
                                        </tr>
                                         <tr>
                                            <td width="25%"><h4>Account Code</h4></td>
                                            <td>:</td>
                                            <td><h5>391.90001.15510.8070.69P0XXXB05AX</h5></td>

                                        </tr>
										<tr>
                                            <td width="35%"><h4>Federal Fiscal Year</h4></td>
                                            <td>:</td>
                                            <td><h5> 2010</h5></td>

                                        </tr>
										<tr>
                                            <td width="25%"><h4>Payment Code</h4></td>
                                            <td>:</td>
                                            <td><h5>P2010</h5></td>

                                        </tr>
										<tr>
                                            <td width="25%"><h4>Fund Source</h4></td>
                                            <td>:</td>
                                            <td><h5>  A1-T-XIX - Medicaid Incentive Payment</h5></td>

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
                                                    <td><h5>Physician/General Practice</h5></td>
                                                </tr>
                                                 <tr>
                                                    <td><h4>Taxonomy</h4></td>
                                                    <td>:</td>
                                                    <td><h5>208D00000X - General Practice</h5></td>
                                                </tr>
												<tr>
                                                    <td><h4>Payment Withhold</h4></td>
                                                    <td>:</td>
                                                    <td><h5>No</h5></td>
                                                </tr>
												<tr>
                                                    <td><h4>Sanction</h4></td>
                                                    <td>:</td>
                                                    <td><h5>No</h5></td>
                                                </tr>
                                              </table>

                                         </fieldset>
                              	</td>

                             </tr>
                         </table>
<table width="100% border="0">
   <tr>
                         <td width="100%">
						  <fieldset style="width:550px">
                            	  <legend align="center"><h6>Review Comments</h6></legend>
								  <textarea rows="5" cols="85">

									</textarea>

						   </fieldset>
						</td>
	</tr>

</table>
</div>
<div id="dialog-paymentapprove" title="Workflow- Initiate Incentive Payment" class="ui-widget">
	<table width="100% border="0">
                        <tr>
                          <td width="50%">
                                <fieldset style="width:350px">
                            	  <legend align="center"><h6>Basic Info</h6></legend>
                                    <table width="100%" border="0" cellpadding="2" cellspacing="0">
                                        <tr>
                                            <td width="35%"><h4>First Name</h4></td>
                                            <td width="2%">:</td>
                                            <td><h5>John</h5></td>
                                            <td><h4>Last Name</h4></td>
                                            <td>:</td>
                                            <td><h5>Smith</h5></td>
                                        </tr>
                                        <tr>
                                            <td><h4>Middle Initial</h4></td>
                                            <td>:</td>
                                            <td><h5>A</h5></td>
                                            <td><h4>Suffix</h4></td>
                                            <td>:</td>
                                            <td><h5>&nbsp;</h5></td>
                                        </tr>

                                        <tr>
                                            <td><h4>Date Of Birth</h4></td>
                                            <td>:</td>
                                            <td colspan="2"><h5>05/03/1966</h5></td>
                                        </tr>
										 <tr>
                                            <td><h4>Provider NPI</h4></td>
                                            <td>:</td>
                                            <td ><h5>123456789</h5></td>
											<td><h4>Tax ID</h4></td>
                                            <td>:</td>
                                            <td><h5>56789345</h5></td>
                                        </tr>
										<tr>
                                            <td><h4>Business Status</h4></td>
                                            <td>:</td>
                                            <td ><h5>Active</h5></td>

                                        </tr>
                                      </table>
                                	</fieldset>
                              </td>
                              <td width="50%">
                              	<fieldset style="width:375px">
                                    <legend align="center"><h6>Payment Information</h6></legend>
                                    <table width="100%" border="0" cellpadding="2" cellspacing="0">
                                        <tr>
                                            <td width="25%"><h4>Pay Cycle</h4></td>
                                            <td width="2%">:</td>
                                            <td><h5>35</h5></td>
                                        </tr>
                                        <tr>
                                            <td width="25%"><h4>Payment Date</h4></td>
                                            <td>:</td>
                                            <td><h5>08/09/2010</h5></td>
                                        </tr>
                                        <tr>

                                            <td width="25%"><h4>Payment Amount</h4></td>
                                            <td>:</td>
                                            <td><h5>$21500.00</h5></td>
                                        </tr>
                                         <tr>
                                            <td width="25%"><h4>Account Code</h4></td>
                                            <td>:</td>
                                            <td><h5>391.90001.15510.8070.69P0XXXB05AX</h5></td>

                                        </tr>
										<tr>
                                            <td width="35%"><h4>Federal Fiscal Year</h4></td>
                                            <td>:</td>
                                            <td><h5> 2010</h5></td>

                                        </tr>
										<tr>
                                            <td width="25%"><h4>Payment Code</h4></td>
                                            <td>:</td>
                                            <td><h5>P2010</h5></td>

                                        </tr>
										<tr>
                                            <td width="25%"><h4>Fund Source</h4></td>
                                            <td>:</td>
                                            <td><h5>  A1-T-XIX - Medicaid Incentive Payment</h5></td>

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
                                                    <td><h5>Physician/General Practice</h5></td>
                                                </tr>
                                                 <tr>
                                                    <td><h4>Taxonomy</h4></td>
                                                    <td>:</td>
                                                    <td><h5>208D00000X - General Practice</h5></td>
                                                </tr>
												<tr>
                                                    <td><h4>Payment Withhold</h4></td>
                                                    <td>:</td>
                                                    <td><h5>No</h5></td>
                                                </tr>
												<tr>
                                                    <td><h4>Sanction</h4></td>
                                                    <td>:</td>
                                                    <td><h5>No</h5></td>
                                                </tr>
                                              </table>

                                         </fieldset>
                              	</td>
                                <td width="50%">
                              	<fieldset style="width:310px">
                                    <legend align="center"><h6>Review Informaion</h6></legend>
                                    <table width="100%" border="0" cellpadding="2" cellspacing="0">
                                        <tr>
                                            <td width="35%"><h4>Submitted By</h4></td>
                                            <td width="2%">:</td>
                                            <td><h5>Simith John</h5></td>
                                        </tr>
                                        <tr>
                                            <td><h4>Date</h4></td>
                                            <td>:</td>
                                            <td><h5>08/09/2010</h5></td>
                                        </tr>

                                      </table>
                                 </fieldset>
                              </td>
                             </tr>
                         </table>
<table width="100% border="0">
   <tr>
                         <td width="100%">
						  <fieldset style="width:550px">
                            	  <legend align="center"><h6>Approve Comments</h6></legend>
								  <textarea rows="5" cols="85">

									</textarea>

						   </fieldset>
						</td>
	</tr>

</table>
</div>

</form>
<script type="text/javascript">

/***********************************************
* Freejavascriptkit.com
* Visit http://www.freejavascriptkit.com for more free Javascripts source code
***********************************************/

var offsetxpoint=-60 //Customize x offset of tooltip
var offsetypoint=20 //Customize y offset of tooltip
var ie=document.all
var ns6=document.getElementById && !document.all
var enabletip=false
if (ie||ns6)
var tipobj=document.all? document.all["dhtmltooltip"] : document.getElementById? document.getElementById("dhtmltooltip") : ""

function ietruebody(){
return (document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body
}

function ddrivetip(thetext, thecolor, thewidth){
if (ns6||ie){
if (typeof thewidth!="undefined") tipobj.style.width=thewidth+"px"
if (typeof thecolor!="undefined" && thecolor!="") tipobj.style.backgroundColor=thecolor
tipobj.innerHTML=thetext
enabletip=true
return false
}
}

function positiontip(e){
if (enabletip){
var curX=(ns6)?e.pageX : event.clientX+ietruebody().scrollLeft;
var curY=(ns6)?e.pageY : event.clientY+ietruebody().scrollTop;
//Find out how close the mouse is to the corner of the window
var rightedge=ie&&!window.opera? ietruebody().clientWidth-event.clientX-offsetxpoint : window.innerWidth-e.clientX-offsetxpoint-20
var bottomedge=ie&&!window.opera? ietruebody().clientHeight-event.clientY-offsetypoint : window.innerHeight-e.clientY-offsetypoint-20

var leftedge=(offsetxpoint<0)? offsetxpoint*(-1) : -1000

//if the horizontal distance isn't enough to accomodate the width of the context menu
if (rightedge<tipobj.offsetWidth)
//move the horizontal position of the menu to the left by it's width
tipobj.style.left=ie? ietruebody().scrollLeft+event.clientX-tipobj.offsetWidth+"px" : window.pageXOffset+e.clientX-tipobj.offsetWidth+"px"
else if (curX<leftedge)
tipobj.style.left="5px"
else
//position the horizontal position of the menu where the mouse is positioned
tipobj.style.left=curX+offsetxpoint+"px"

//same concept with the vertical position
if (bottomedge<tipobj.offsetHeight)
tipobj.style.top=ie? ietruebody().scrollTop+event.clientY-tipobj.offsetHeight-offsetypoint+"px" : window.pageYOffset+e.clientY-tipobj.offsetHeight-offsetypoint+"px"
else
tipobj.style.top=curY+offsetypoint+"px"
tipobj.style.visibility="visible"
}
}

function displaycontent(workflowno)
{
	var desc = '';

	if (workflowno == 0)
	{
		desc = '<Table height=100% width=100%>'
				+ '	<tr>'
					+ '		<td colspan=2>'
						+ '		<B><U>LEGEND:</U></B>'
						+ '	</td>'
					+ '	</tr>'
					+ '	<tr>'
						+ '	<td>'
							+ '	<img width=40px height=40px src="images/Process-Accept.png"/></td>'
							+ '	<td>Task Completed'
						+ '	</td>'
					+ '	</tr>'
					+ '	<tr>'
						+ '	<td>'
							+ '	<img src="images/running_process.png"/></td>'
							+ '	<td>Task In Process'
						+ '	</td>'
					+ '	</tr>'
					+ '	<tr>'
						+ '	<td>'
							+ '	<img width=40px height=40px src="images/Process-Info.png"/></td>'
							+ '	<td>Task Not Started'
						+ '	</td>'
					+ '	</tr>'
				+ '	</Table>';

		ddrivetip(desc,'#EDF3FC', 145);
		return;
	}
	else if (workflowno == 'regcomp'){
		desc = '<B><U>Registration Complete:</U></B><BR><BR> When provider has completed all registrations steps, signed attestation and submitted for State Review this step is complete. ';
	}else if (workflowno == 'streview'){
		desc = '<B><U>Registration Review:</U></B><BR><BR> State user must review Provider Status, License Validation, Sanctions, Volume and EHR Certification.  State may accept or override system automated status.<br/> <b>Click on process icon to launch approval process.<b> ';
	}else if (workflowno == 'streviewcomp'){
		desc = '<B><U>Registration Review Complete:</U></B><BR><BR> Review has been completed by the State user. The registration is now ready for approval process. ';
	}else if (workflowno == 'regapp'){
		desc = '<B><U>Registration Approval:</U></B><BR><BR> State user must approve or deny the application process.  Notes may be entered to document the decision. ';
	}else if (workflowno == 'appinprocess'){
		desc = '<B><U>Approval In Process:</U></B><BR><BR> Registration review step has been completed. State user must approve or deny the application process.';
	}else if (workflowno == 'appcomp'){
		desc = '<B><U>Registration Approved:</U></B><BR><BR> Registration has been approved by the State user.';
	}else if (workflowno == 'initpay'){
		desc = '<B><U>Initiate Payment:</U></B><BR><BR> State user must confirm or input payment amount and submit for payment approval.';
	}else if (workflowno == 'apppay'){
		desc = '<B><U>Approve Payment:</U></B><BR><BR> Approver must review and submit amount to payment system for paymentgeneration';
	}else if (workflowno == 'nlrupd'){
		desc = '<B><U>UpdateNational Level Repository (NLR):</U></B><BR><BR> Approver must review and submit amount to payment system for paymentgeneration';
	}

	ddrivetip(desc,'#EDF3FC', 300);
}

function hideddrivetip(){
if (ns6||ie){
enabletip=false
tipobj.style.visibility="hidden"
tipobj.style.left="-1000px"
tipobj.style.backgroundColor=''
tipobj.style.width=''
}
}

document.onmousemove=positiontip

</script>
</body>
</html>