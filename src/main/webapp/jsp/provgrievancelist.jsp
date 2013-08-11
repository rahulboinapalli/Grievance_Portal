<!DOCTYPE html>
<!--[if lt IE 7]><html lang="en" class=?ie6?><![endif]-->
<!--[if IE 7]><html lang="en" class=?ie7?><![endif]-->
<!--[if IE 8]><html lang="en" class=?ie8?><![endif]-->
<!--[if IE 9]><html lang="en" class=?ie9?><![endif]-->
<!--[if gt IE 9]><html lang="en"><![endif]-->
<!--[if !IE]>--><html lang="en"><!--<![endif]-->
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <sj:head jqueryui="true"/>
<title>EHR - Provider Grievance</title>
<link href="page_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/ui-lightness/jquery-ui-1.8.2.custom.css" />
<link rel="stylesheet" type="text/css" media="screen" href="js/css/ui.jqgrid.css" />
<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="js/myutils.js"></script>
<script src="./js/jquery.tools.min.js"></script>
<script src="js/i18n/grid.locale-en.js" type="text/javascript"></script>
<script src="js/jquery.jqGrid.min.js" type="text/javascript"></script>
<script src="js/src/jquery.fmatter.js" type="text/javascript"></script>
<script type="text/javascript" src="external/jquery.bgiframe-2.1.1.js"></script>
<script type="text/javascript" src="ui/jquery.ui.core.js"></script>
<script type="text/javascript" src="ui/jquery.ui.widget.js"></script>
<script type="text/javascript" src="ui/jquery.ui.mouse.js"></script>
<script type="text/javascript" src="ui/jquery.ui.button.js"></script>
<script type="text/javascript" src="ui/jquery.ui.draggable.js"></script>
<script type="text/javascript" src="ui/jquery.ui.position.js"></script>
<script type="text/javascript" src="ui/jquery.ui.resizable.js"></script>
<script type="text/javascript" src="ui/jquery.ui.dialog.js"></script>
<script type="text/javascript" src="ui/jquery.ui.datepicker.js"></script>
<script type="text/javascript">
	$(function() {
		$("#datepicker").datepicker();
	});
	</script>

<script type="text/javascript">
$(document).ready(function()
	{
		//timer();
		links();
		showprocessor();
		var myDate = new Date();   var prettyDate =(myDate.getMonth()+1) + '/' + myDate.getDate() + '/' +  myDate.getFullYear();

               var mydata1 = '${grievance}';
               //var mydata1 = [ {rid:v_rid,pnpi:v_npi,pname:v_pname,pyear:"Self",gtype:v_type,date:v_date,status:"Submitted"}];
               // for(var i=0;i<=mydata1.length;i++) {
                  //  jQuery("#list4").jqGrid('addRowData',i+1,mydata1[i])
                //}
	}
        
);

$(function() {

          // a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
          $("#dialog").dialog("destroy");
          $("#dialog-add").dialog({
              autoOpen: false,
              height:500,
              width: 560,
              modal: true,
              buttons: {
               'Save': function() {


                /*var v_rid=window.document.getElementById("rid").value;
                var v_npi=window.document.getElementById("npi").value;
                var v_pname=window.document.getElementById("pname").value;
                var v_date=window.document.getElementById("datepicker").value;
                var v_type=jQuery('#type option:selected').text();
                var v_email=window.document.getElementById("email").value;
                var v_phone=window.document.getElementById("phone").value;
                var v_comments=window.document.getElementById("comments").value;
                var v_attachFile=window.document.getElementById("attachFile").value;

                alert("v_rid:="+v_rid+" : v_npi= "+v_npi+" :v_pname= "+v_pname+" :v_type="+v_type+" :v_comments="+v_comments);
               // var mydata1 = [ {rid:v_rid,pnpi:v_npi,pname:v_pname,pyear:"Self",gtype:v_type,date:v_date,status:"Submitted"}];
                
//required comments strart from here
                    jQuery.ajax({
                        url:'savegrievance',
                        type:'post',
                        data: "v_rid="+v_rid+"&v_npi="+v_npi+"&v_pname="+v_pname+"&v_date="+v_date+"&v_type="+v_type+"&v_email="+v_email+"&v_phone="+v_phone+"&v_comments="+v_comments+"&v_attachFile="+v_attachFile,
                        success:function(data){
                            var response = data.responseText;
                            alert("response= ::: "+response);
                            for(var i=0;i<=response.length;i++) {
                                jQuery("#list4").jqGrid('addRowData',i+1,response[i])
                            }
                                    alert("Transaction successfully saved!");
                                    $("#dialog").dialog("destroy");


                        }
                    });*/
        //required comments ends  here
                    document.forms[0].action = 'savegrievance';
                    document.forms[0].submit();

               },

                  Cancel: function() {
                      $(this).dialog('close');
                  }
        }
          });

});

function submitForm(method){
    //alert("method="+method);
    document.forms[0].action = method;
    document.forms[0].submit();
}

</script>
<script type="text/javascript">
 /*jQuery().ready(function (){
 jQuery("#list4").jqGrid({
 datatype: "local", height:100,
 colNames:['Member ID','Member SSN', 'Member Name','Insurance Type','Grievance Type', 'Date','Status'],
 colModel:[ {name:'rid',index:'rid', width:50, sorttype:"int",align:"center"},
 {name:'pnpi',index:'pnpi', width:50, sorttype:"string",align:"center"},
 {name:'pname',index:'pname', width:50, sorttype:"int",align:"center"},
 {name:'pyear',index:'pyear', width:50, sorttype:"int",align:"center"},
 {name:'gtype',index:'gtype', width:50,sorttype:"date",align:"center"},
 {name:'date',index:'date', width:50, align:"center",sorttype:"date",align:"center"},
 {name:'status',index:'status', width:50, align:"center",formatter:formateadorimg1}],
 pager: '#pager1',
 rowNum:4,
 autowidth: true,
 rowList:[2,4,6],
 viewrecords: true,
 caption: " Provider Grievance List" }).navGrid('#pager1',{edit:false,add:false,del:false});
 //var mydata = [ {rid:"1357924680",pnpi:"1231231231",pname:"John Smith",pyear:"1",gtype:"Complaint",date:"02/15/2011",status:"Submitted"}];
 //for(var i=0;i<=mydata1.length;i++)
//	jQuery("#list4").jqGrid('addRowData',i+1,mydata1[i])
 }
 );*/
  jQuery().ready(function (){
  jQuery("#list4").jqGrid({
  url:'/GrievanceApp/getJSONResult.action',
  datatype: "json",
  height:100,
 colNames:['Member ID','Member SSN', 'Member Name','Insurance Type','Grievance Type', 'Date','Status'],
 colModel:[ {name:'memberId',index:'memberId', width:50, sorttype:"int",align:"center"},
 {name:'ssn',index:'ssn', width:50, sorttype:"string",align:"center"},
 {name:'memberName',index:'memberName', width:50, sorttype:"int",align:"center"},
 {name:'requestType',index:'requestType', width:50, sorttype:"int",align:"center"},
 {name:'gtype',index:'gtype', width:50,sorttype:"date",align:"center"},
 {name:'requestDate',index:'requestDate', width:50, align:"center",sorttype:"date",align:"center"},
 {name:'status',index:'status', width:50, align:"center",formatter:formateadorimg1}],
 pager: '#pager1',
 rowNum:4,
 autowidth: true,
 rowList:[2,4,6],
 viewrecords: true,
 gridview: true,
 caption: " Provider Grievance List" }).navGrid('#pager1',{edit:false,add:false,del:false});
 //var mydata = [ {rid:"1357924680",pnpi:"1231231231",pname:"John Smith",pyear:"1",gtype:"Complaint",date:"02/15/2011",status:"Submitted"}];
 //for(var i=0;i<=mydata1.length;i++)
//	jQuery("#list4").jqGrid('addRowData',i+1,mydata1[i])
 }
 );


		function formateadorimg1(cellvalue, options, rowObject) {

		    return" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "+cellvalue +" <input type='image' src=images/search_button.png valign='center' align='center' onclick='generatelink()'/></a>";
        }
		function generatelink()
		{
           rowid=jQuery("#list4").getGridParam("selrow");
     	   var	cellvalue=jQuery("#list4").getCell(rowid,3);
			//alert( cellvalue);

		   if (cellvalue==1)
		   {
			   var myTimer = {};
			   OpenProcessor();
				//myTimer = $.timer(2500,function(){
				//	window.open("grievancedetails.jsp",'_self');
				//});

		   }

		}

  </script>
</head>
<body>
<div id="templatemo_banner_wrapper">

    <div id="templatemo_banner">

    	<div id="banner_content" >
			<table width="100%" border="0">
				<tr>
					<td width="50%"  align="left"><img height="105" src="images/help.png"/></td>
                            <td align="right"><img height="100" src="images/home.png"/></td>
				<tr>
			</table>


	</div>
</div> <!-- end of templatemo_banner -->

</div> <!-- end of templatemo_banner_wrapper -->
<div id="templatemo_menu_wrapper">
	<div id="templatemo_menu">
        <ul>
            <li><a href="index" id="homep" class="modalInput" rel="#showprocessor"><span></span>Home</a></li>
            <li><a href="grievanceDetails"  id="grievance" class="modalInput current" rel="#showprocessor"><span></span>Grievance</a></li>
            <li><a href="trackRegistrationList" id="track" class="modalInput" rel="#showprocessor"><span></span>Track</a></li>
        </ul>

    </div>
</div>
<div id="templatemo_content">
	<div class="section_w940">
		<div class="product_box margin_r_20">
			<img src="images/grievp.png" /><h2 >Grievance</h2>
			<p>Add new grievance or view the current status of the grievances that have been submitted.</p>
			<div class="cleaner"></div>
			</div>
		<div class="product_box">
			<h2>Login Information</h2>
			<p>User ID: doej</p>
			<p>Profile: Contract Holder</p>
			<div class="cleaner"></div>
		</div>
	</div>
	<div class="section_w940">
		<h3>&nbsp;<img src="images/add.gif" onclick="jQuery('#dialog-add').dialog('open'); return false" style="cursor: hand" />&nbsp;Click to add new grievance</h3>


        <div class="section_w450">
                <table id="list4"></table>
				<div id="pager1"></div>
            <div class="cleaner"></div>
        </div>
    	<div class="cleaner"></div>
    </div>
     <div class="section_w940">
    	<div class="cleaner"></div>
    </div>

</div>
<div class="processor" id="showprocessor">
	<table><tr><td><img src="images/red-processor-small1.gif"/></td><td><h4 class="redclass">&nbsp;&nbsp;Processing Request....</h4></td><tr></table>
 <div class="close" id="CloseBtn"></div>
</div>
<a class="modalInput" rel="#showprocessor" id="showProcessor" ></a>
<div id="templatemo_content_bottom"></div>
<div id="templatemo_footer">
        Copyright © 2013 <a href="grievanceDetails">GrievanceApp</a> | Development
</div> <!-- end of footer -->
<div id="dialog-add" title="Add New Grievance">
<p class="validateTips">All form fields with * are required.</p>
<form action="provGrievanceList" method="post" id="provGreinvanceForm" enctype="multipart/form-data">
	<fieldset>
		<table cellpadding="2" cellspacing="2">
			<tr>
				<td>Member ID*</td>
				<td>:</td>
				<td><input type="text" name="memberId" id="rid" maxlength="10" size="10"/></td>

			</tr>
			<tr>
				<td>SSN *</td>
				<td>:</td>
				<td><input type="text" name="SSN" id="npi" maxlength="10" size="10"/></td>

			</tr>
			<tr>
				<td>Member Name *</td>
				<td>:</td>
				<td><input type="text" name="memberName" id="pname" maxlength="30" size="30" /></td>

			</tr>
			<tr>
				<td>Request Type*</td>
				<td>:</td>
                                <td><select id="type" name="requestType">
						<option>Select an option</option>
						<option>Appeal</option>
						<option>Compliant</option>
						<option>Payment Issue</option>
						<option>Insurance Rejection</option>
					</select>
				</td>

			</tr>
			<tr>
				<td>Date *</td>
				<td>:</td>
                                <td><input type="text" name="date" id="datepicker"></td>

			</tr>
			<tr>
				<td>E-mail Address *</td>
				<td>:</td>
				<td><input type="text" name="emailAddress" id="email" size="30"/></td>
			</tr>
			<tr>
				<td>Contact Phone *</td>
				<td>:</td>
				<td><input type="text" name="contactPhone" id="phone"  /></td>
			</tr>
			<tr valign="top">
				<td>Comments *</td>
				<td>:</td>
                                <td><textarea  rows="5" cols="55" name="comments" id="comments"> </textarea></td>
			</tr>
			<tr valign="top">
				<!--<td>Attach File</td>
				<td>:</td>
                                <td><input type="file" name="attachFile" id="attachFile"/></td>-->
                                <td><s:file name="attachFile" label="Attach File" size="40" /></td>

			</tr>

		</table>
	</fieldset>
    <div id="buttons">

         <!--<button class="smallButton primaryCta" id="savegrievance" type="button" onclick="submitForm('savegrievance');" value="savegrievance">
                                <span>Save</span></button>
        <button tabindex="3" class="smallButton primaryCta" id="signIn" type="button" value="signIn">
                                <span>Cancel</span></button>
         -->
       </div>
</form>
</div>
</body>
</html>