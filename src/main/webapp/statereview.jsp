<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>EHR- Payment Workflow Status</title>

<link type="text/css" href="themes/base/jquery.ui.all.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="js/myutils.js"></script>
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
<script type="text/javascript" src="js/slidedeck.jquery.lite.js"></script>
<link href="page_style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
		div#users-contain { width: 600px; margin: 20px 0; }
		div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 110%; }
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
	// increase the default animation speed to exaggerate the effect
	$("#dialog").dialog("destroy");

	$(document).ready(function()
	{
		timer();
		links();
		showprocessor();
	}
);


	$(function() {
		$("#dialog-form1").dialog({
			autoOpen: false,
			height:520,
			width: 975,
			modal: true,
			buttons: {
				Ok: function() {
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
			<table width="100%" border="0" celpadding="0" cellspacing="0">
				<tr>
					<td width="50%"  align="left"><img height="105" src="images/help.png"/></td>
                            <td align="right"><img height="100" src="images/home.png"/></td>
				</tr>
			</table>


	</div>
</div> <!-- end of templatemo_banner -->

</div> <!-- end of templatemo_banner_wrapper -->
<form action="stateReview" name="frmreg" id="form1">
<div id="templatemo_menu_wrapper">
	<div id="templatemo_menu">
        <ul>
            <li><a href="signon" id="homep" class="modalInput" rel="#showprocessor"><span></span>Home</a></li>

            <li><a href="trackRegistrationList"  id="track" class="modalInput current" rel="#showprocessor"><span></span>Track</a></li>

            <li><a href="grievanceDetails"  id="grievance" class="modalInput" rel="#showprocessor"><span></span>Grievance</a></li>
        </ul>

    </div> <!-- end of templatemo_menu -->

</div> <!-- end of templatemo_menu_wrapper -->

<div id="templatemo_content">
	<div class="section_w940">
        <div class="product_box margin_r_20">
                <h2 onMouseover="displaycontent(0)" width=50px height=50px onMouseout="hideddrivetip()" style="cursor: hand" >Workflow - Current Status</h2>
                <p>Provides the current status of the grievance. Mouse over each step to get a detailed description of the status.</p>
                <div class="cleaner"></div>
         </div>
         <div class="product_box margin_r_20">
                <h2>Tracking Member</h2>
                        <p>ID: 1033366513</p>
                        <p>Tax ID / SSN: 999-99-9999</p>
                <div class="cleaner"></div>
         </div>
         <div class="product_box">
                <h2>Login Information</h2>
                        <p>User ID: doej</p>
                        <p>Profile: Case Worker</p>
         <div class="cleaner"></div>
         </div>
    </div><!-- End of section_w940 -->
		<br />
     <div class="section_w940">
        	<h2>&nbsp;</h2>
			<table cellspacing=0 cellpadding=0>
				<tr>
					<td>
						<img onMouseover="displaycontent(1)" width=50px height=50px onMouseout="hideddrivetip()" style="cursor: hand" id="wflow_1" src="images/Process-Accept.png"/>
					</td>
					<td>
						<img id="wflow_arrow_1" width=115px height=11px src="images/forward.png"/>
					</td>
					<td>
						<img onMouseover="displaycontent(3)" width=50px height=50px onMouseout="hideddrivetip()" style="cursor: hand" id="wflow_3" src="images/Process-Accept.png"/>
					</td>
					<td>
						<img id="wflow_arrow_3" width=115px height=11px src="images/forward.png"/>
					</td>
					<td>
						<img onMouseover="displaycontent(4)" width=50px height=50px onMouseout="hideddrivetip()" style="cursor: hand" id="wflow_4" src="images/running_process.png"/>
					</td>
					<td>
						<img id="wflow_arrow_4" width=115px height=11px src="images/forward.png"/>
					</td>
					<td>
						<img onMouseover="displaycontent(5)" width=50px height=50px onMouseout="hideddrivetip()" style="cursor: hand"  id="wflow_5" src="images/Process-Info.png"/>
					</td>
					<td>
						<img id="wflow_arrow_5" width=115px height=11px src="images/forward.png"/>
					</td>
					<td>
						<img onMouseover="displaycontent(6)" width=50px height=50px onMouseout="hideddrivetip()"  style="cursor: hand"  id="wflow_6" src="images/Process-Info.png"/>
					</td>
					<td>
						<img id="wflow_arrow_6" width=115px height=11px src="images/forward.png"/>
					</td>
					<td>
						<img onMouseover="displaycontent(7)" width=50px height=50px onMouseout="hideddrivetip()" style="cursor: hand"  id="wflow_7" src="images/Process-Info.png"/>
					</td>
				</tr>
				<tr valign="top">
					<td colspan="2"><font size=2> Step-1<br />Received <br>from HIX
					</td>
					<td colspan="2"><font size=2>Step-2<br />Registration<br>Process</a>
					</td>
					<td colspan="2"><font size=2>Step-3<br />State Review<br /><img src="images/Download.png" alt="click to view" onclick="jQuery('#show1').show(); return false" /></a>
					</td>
					<td colspan="2"><font size=2>Step-4<br />Approval Process
					</td>
					<td colspan="2"><font size=2>Step-5<br />Payment Process
					</td>
					<td><font size=2>Step-6<br />Case<br/>Updated HIX
					</td>
				</tr>
			</table>
         <div class="cleaner"></div>
	</div>
     <div class="section_w940" id="show1">
     <div id="slidedeck_frame">
			<dl class="slidedeck">
				<dt>HIX Information</dt>
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
                                            <td><h4>Insurance Type</h4></td>
                                            <td>:</td>
                                            <td colspan="2"><h5>Self</h5></td>
                                        </tr>
                                        <tr>
                                            <td><h4>Insurance</h4></td>
                                            <td>:</td>
                                            <td colspan="2"><h5>Medical</h5></td>
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
                                            <td><h5>Aldie</h5></td>
                                        </tr>
                                        <tr>
                                            <td><h4>State</h4></td>
                                            <td>:</td>
                                            <td><h5>Virginia</h5></td>
                                            <td><h4>Zip</h4></td>
                                            <td>:</td>
                                            <td><h5>20105-1234</h5></td>
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
                                                    <td colspan="4"><p>Please note, the tax identification number (TIN/SSN) captured below will receive the Medical Benefits.</p></td>
                                                </tr>
                                                <tr>
                                                    <td><h4>ID</h4></td>
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
                <dt>State Federal Info</dt>
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
                                            <td><h4> Type</h4></td>
                                            <td>:</td>
                                            <td colspan="3"><h5>Medical</h5></td>
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
                                            <td><h5>Aldie</h5></td>
                                        </tr>
                                        <tr>
                                            <td><h4>State</h4></td>
                                            <td>:</td>
                                            <td><h5>Virginia</h5></td>
                                            <td><h4>Zip</h4></td>
                                            <td>:</td>
                                            <td><h5>20105-1234</h5></td>
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
                                        <legend align="center"><h6>Insurance Type/Eligibility</h6></legend>
                                            <table width="100%" border="0" cellpadding="1" cellspacing="2">
                                                <tr>
                                                    <td><h4>Eligibility</h4></td>
                                                    <td>:</td>
                                                    <td><h5>Income Level</h5></td>
                                                </tr>
                                                 <tr>
                                                    <td><h4>Aggeregate</h4></td>
                                                    <td>:</td>
                                                    <td><h5>208D00000X - Below Federal</h5></td>
                                                </tr>
                                              </table>

                                         </fieldset>
                              	</td>
                                <td width="50%" valign="top">
                                     <fieldset style="width:310px">
                                        <legend align="center"><h6>IRS/Federal</h6></legend>
                                            <table width="100%" border="1" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td><h4>Type</h4></td>
                                                    <td><h4>Number</h4></td>
                                                    <td><h4>Expiration Date</h4></td>
                                                </tr>
                                                <tr>
                                                    <td><h5>Tax</h5></td>
                                                    <td><h5>4704232724</h5></td>
                                                    <td><h5>12/31/2012</h5></td>
                                                </tr>
                                                <tr>
                                                    <td><h5>Nationality</h5></td>
                                                    <td><h5>USA</h5></td>
                                                    <td><h5>Birth</h5></td>
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
                                  <th>Payment Year</th>
                                  <th>Reporting Period Start</th>
                                  <th>Reporting Period End</th>
                                  <th>Income</th>
                                  <th>Resident </th>
                                  <th>FQHC /RHC</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                 <td align="left"><input type="image" title="Click To Add Eligibility Details" src="images/edit.jpg" onclick="jQuery('#dialog-elig-form').dialog('open'); return false">&nbsp;&nbsp;Year 1</td>
                                 <td id="ps1">01/01/2012</td>
                                 <td id="pe1">12/31/2012</td>
                                 <td id="ea1">$30,000.00</td>
                                 <td id="pt1">No</td>
                                 <td id="fq1">No</td>
                              </tr>
                          </tbody>
                     </table>
				</div>
                </dd>
				<dt>Attestation</dt>
				<dd>
                <fieldset style="width:655px">
                   <legend align="center"><h6>General Notice</h6></legend>
                   <p class="attest"><br>NOTICE: Any person who knowingly files a statement of claim containing any misrepresentation or any
                      false, incomplete or misleading information may be guilty of a criminal act punishable under law and
                      may be subject to civil penalties.</p>
               </fieldset>
              <fieldset  style="width:655px">
              	<legend align="center" margin-right: "5%"><h6>Signature</h6></legend>
                  <div style="width:680px; height:120px; overflow:auto;">
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
                  permits the government to verify information by way of computer matches.</p>
                  </div>

                   <table width="655px">
                   <tr>
                   <td width="40%">
                    <input type=checkbox id="terms" name="terms1" checked="true" disabled="disabled"> I accept the terms and conditions</input></td>
                <!--	<td align="center">
                    <a href="registrationack.jsp"> <input type="button" id="submit" alt="Submit" Value="Submit"></a>
                    </td>-->
                   <td align="right">
                    <input type="image" src="images/print2.jpg" alt="print" id="print1" title="Print" >
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
        Copyright © 2013 <a href="grievanceDetails">GrievanceApp</a> | Development
</div> <!-- end of footer -->

<div id="dhtmltooltip"></div>
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
	else if (workflowno == 1)
	{
		desc = '<B><U>Received from NLR:</U></B><BR><BR> The National Level Registry (NLR) has completed a review of your EHR Medicaid Incentive Program registration. If any of the information you supplied the NLR has changed, or is incorrect you must go back to the NLR to update the information.';
	}
	else if (workflowno == 2)
	{
		desc = '<B><U>Correspondence Generated:</U></B><BR><BR> When [State Name] Medicaid received notice of your choice of [State Name]?s EHR Medicaid Incentive Program we generated a letter to inform you that your NLR registration was approved.  The correspondence informed you of next steps required to complete the registration process and the length of time you have to begin the [State Name]?s EHR Medicaid Incentive Program registration.  Remember:  If your Payee?s Employer Identification Number (EIN) is not registered with [State Name]?s State Payment system or is not in [State Name]?s MMIS system we will not be able to make the incentive payment.';
	}
	else if (workflowno == 3)
	{
		desc = '<B><U>Registration Process:</U></B><BR><BR> You have begun the registration process in [State Name]?s EHR Medicaid Incentive Program.  You have XXX days to complete and submit your registration material for State review from the date you first saved your information.  All Information must be provided for your registration to be approved.  The final step in the registration process is your attestation of the truthfulness of the information provided.  Please make sure that the information is correct.  You will not be able to change the information once it is submitted.  If you do not complete the registration within xxx days, or if the information is incorrect, you will have to re-register with the NLR to begin the process again. ';
	}
	else if (workflowno == 4)
	{
		desc = '<B><U>State Review:</U></B><BR><BR> You have provided all required information, reviewed the information and submitted your registration for [State Name] review of your registration material.  The State will notify you via mail and email when the final decision has been made.  All approval or denial decisions will be made within XX days of your submission date.';
	}
	else if (workflowno == 5)
	{
		desc = '<B><U>Approval Process:</U></B><BR><BR> Your registration has been approved/rejected for participation in this year?s Medicaid EHR Incentive Program.  You do not need to do anything else to receive your payment.  You may view your registration information at any time. There will be a final review of your qualifying information before payment is made.';
	}
	else if (workflowno == 6)
	{
		desc = '<B><U>Payment Process:</U></B><BR><BR> We are in the process of generating your EHR payment.  In addition to confirming your eligible payment amount we also must confirm with the NLR that no other payments have been made for this payment year by another State?s Medicaid agency.  We will also make sure that you have not been sanctioned for any period during this payment year since your original application.  Finally we will confirm that you license(s) are still current for the reporting period for this payment year.';
	}
	else if (workflowno == 7)
	{
		desc = '<B><U>Payment Updated NLR:</U></B><BR><BR> Your [State Name] EHR Medicaid Incentive Payment has been processed. The payment information has been sent to NLR';
	}

	ddrivetip(desc,'#EDF3FC', 500);
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