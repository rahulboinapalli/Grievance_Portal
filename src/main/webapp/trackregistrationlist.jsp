<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Registration List</title>
<link href="page_style.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="themes/base/jquery.ui.all.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" media="screen" href="css/ui-lightness/jquery-ui-1.8.2.custom.css" /> 
<link rel="stylesheet" type="text/css" media="screen" href="js/css/ui.jqgrid.css" />
<script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="./js/jquery.tools.min.js"></script>
<script type="text/javascript" src="js/myutils.js"></script>
<script src="js/i18n/grid.locale-en.js" type="text/javascript"></script>
<script src="js/jquery.jqGrid.min.js" type="text/javascript"></script>
<script src="js/src/jquery.fmatter.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function()
	{
		timer();
		links();
		showprocessor();
	}
);
</script>
<script type="text/javascript"> 
 jQuery().ready(function (){ 
 jQuery("#list4").jqGrid({ 
 datatype: "local", height:200, 
 colNames:['Registration ID','NPI','Tax ID/SSN','Provider Name','Registration Status'], 
 colModel:[ {name:'pid',index:'pid', width:60, sorttype:"int",align:"center"}, 
 {name:'taxid',index:'taxid', width:60, sorttype:"int",align:"center"}, 
 {name:'regid',index:'regid', width:60, sorttype:"int",align:"center"}, 
 {name:'pname',index:'pname', width:180,sorttype:"string",align:"left",formatter:formateadorimg}, 
 {name:'regstatus',index:'regstatus', width:100, align:"right",sorttype:"string",align:"left",formatter:formateadorimg1} ],
 pager: '#pager1', 
 rowNum:4,
 autowidth: true,
 rowList:[2,4,6],
 viewrecords: true, 
 caption: "Registration List" }).navGrid('#pager1',{edit:false,add:false,del:false}); 
 var mydata = [ 
 {pid:"1357924680",taxid:"1033366513",regid:"999999999",pname:"John Doe",regstatus:"State Review                 "}, 
 {pid:"1357924682",taxid:"3333567892",regid:"345689903",pname:"Eon Morgan",regstatus:"State Review                 "}, 
 {pid:"1357924683",taxid:"4444567891",regid:"345689904",pname:"Andrew Strauss",regstatus:"State Review                 "},
  {pid:"135792464",taxid:"3333567897",regid:"345689003",pname:"James Anderson",regstatus:"State Review                 "}, 
   {pid:"1357924685",taxid:"333356789",regid:"345699003",pname:"Allan Donald",regstatus:"State Review                 "}, 
	{pid:"1357924681",taxid:"2222567893",regid:"345689900",pname:"Kevin Pieterson",regstatus:"Payment Approved        "}
 ]; 
 for(var i=0;i<=mydata.length;i++) 
	jQuery("#list4").jqGrid('addRowData',i+1,mydata[i])
 }
 ); 
 		function formateadorLink(cellvalue, options, rowObject) {

            return "<a href=./trackresults.jsp title='View Status'><u>" + cellvalue + "</u></a>";
        }
		function formateadorimg(cellvalue, options, rowObject) {

            return "<img src=images/patient.jpg valign='center' align='center'>&nbsp;&nbsp;" +  cellvalue + "</img>";
        }
		function formateadorimg1(cellvalue, options, rowObject) {

		    return" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "+cellvalue +" <input type='image' src=images/search_button.png valign='center' align='center' onclick='generatelink()'/></a>";
        }
		function generatelink()
		{
           rowid=jQuery("#list4").getGridParam("selrow");
     	   var	cellvalue=jQuery("#list4").getCell(rowid,4);
		  
			var myTimer = {};
			OpenProcessor();
			if (cellvalue.indexOf("Payment Approved",1)!=-1) {
			   var myTimer = {};
				myTimer = $.timer(2500,function(){
				window.open("viewregistration - payment.jsp",'_self');
				});
			   		   }
		   if (cellvalue.indexOf("State Review",1)!=-1)
		   {
			   var myTimer = {};
				myTimer = $.timer(2500,function(){
					window.open("viewregistration.jsp",'_self');
				});
			   
		   }
			
				
		}
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
<div id="templatemo_menu_wrapper">
	<div id="templatemo_menu"> 
       <ul>
			 <li><a href="#" id="homep" class="modalInput" rel="#showprocessor"><span></span>Home</a></li>
                         <li><a href="#"  id="grievance" class="modalInput " rel="#showprocessor"><span></span>Grievance</a></li>
                        <li><a href="#"  id="track" class="modalInput current" rel="#showprocessor"><span></span>Track</a></li>
       </ul>     	
    </div> 
<div id="templatemo_content">
	<div class="product_header_box">
		<table>
			<tr>
				<td>
					<img src="./images/line_chart.png"/>
				</td>
				<td>
					<H2 align="left">Track Registration</H2>
					List of current status of the registrations. Click the Registration Status to view the workflow approval steps.
					<br>
					<br>
				</td>
				<!--<td align="right"><img src="./images/ehr_synergy_spheres.jpg"/></td>-->
			</tr>
		</table>
	</div>
</div>
	
<div id="templatemo_content">
	<div class="section_w940">
        <div class="class="section_w450">
                <table id="list4"></table> 
				<div id="pager1"></div> 
                <input id="JQGrid1_SelectedRow" name="list4" type="hidden"></input><input id="JQGrid1_CurrentPage" name="JQGrid1" type="hidden"></input>

            <div class="cleaner"></div>
        </div>
    	<div class="cleaner"></div>
    </div>
     <div class="section_w940">
    	<div class="cleaner"></div>
    </div>
</div> 
<div class="processor" id="showprocessor">
	<table><tr><td><img src="images/red-processor-small1.gif"/></td><td><h4 class="redclass">&nbsp;&nbsp;Processing Request.....<h4></td><tr></table>
 <div class="close" id="CloseBtn"></div>
 </div>
<a class="modalInput" rel="#showprocessor" id="showProcessor" ></a>
<div id="templatemo_content_bottom"></div>
<div id="templatemo_footer">  
        Copyright © 2013 <a href="#">GrievanceApp</a> | Development
</div> <!-- end of footer -->
</div>
<script>
$("#templatemo_menu a[title]").tooltip();
</script>

</body>
</html>

