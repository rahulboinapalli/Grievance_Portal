<!DOCTYPE html>
<!--[if lt IE 7]><html lang="en" class=”ie6”><![endif]-->
<!--[if IE 7]><html lang="en" class=”ie7”><![endif]-->
<!--[if IE 8]><html lang="en" class=”ie8”><![endif]-->
<!--[if IE 9]><html lang="en" class=”ie9”><![endif]-->
<!--[if gt IE 9]><html lang="en"><![endif]-->
<!--[if !IE]>--><html lang="en"><!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>EHR Home</title>
<link href="page_style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery-1.4.2.js"></script>
        <script type="text/javascript" src="js/myutils.js"></script>
        <script src="js/jquery.tools.min.js"></script>


<script type="text/javascript">
$(document).ready(function()
	{
		timer();
		links();
		showprocessor();
	}
);
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
			if(document.getElementById('templatemo_content') != null)
			{
				
				document.getElementById('templatemo_content').style.height = sHeight + 'px';
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
				<tr>
			</table>
		
		
	</div>
</div> <!-- end of templatemo_banner -->

</div> <!-- end of templatemo_banner_wrapper -->
<div id="templatemo_menu_wrapper">
	<div id="templatemo_menu"> 
        <ul>
            <li><a href="index"  id="homep" class="modalInput current" rel="#showprocessor"><span></span>Home</a></li>
            <li><a href="provGrievance"  id="grievance" class="modalInput" rel="#showprocessor"><span></span>Grievance</a></li>
            <li><a href="trackRegistrationList"  id="track" class="modalInput" rel="#showprocessor"><span></span>Track</a></li>
            
        </ul>   	
    </div> <!-- end of templatemo_menu -->
</div> <!-- end of _menu_wrapper -->

<div id="templatemo_content">

	<div class="section_w940">
<h2> Welcome John Doe</h2>
    	<div class="product_box margin_r_20">
        	<h2>Submit Grievance</h2>   
            <img src="images/add.png" alt="image 1" /><p>submit new grievance.&nbsp;&nbsp;&nbsp; </p>
                   <a href="startRegistration" class="modalInput" rel="#showprocessor" id="btnstart" onMouseOver="over_button('Start','images/Start_Down.png')"
  onMouseOut="up_button('Start','images/Start_Up.png')"><img src="./images/Start_Up.png" name="Start" id="Start" /></a>
            <div class="cleaner"></div>
        </div>

        <div class="product_box">
        	<h2>Track Grievance</h2>
            <img src="images/Contract.png" alt="image 3" /><p>View the grievance list   &nbsp;&nbsp;</p>
                   <a href="trackRegistrationList" class="modalInput" rel="#showprocessor" id="btngrievance"  onMouseOver="over_button('Track','images/Track_Down.png')"
  onMouseOut="up_button('Track','images/Track_Up.png')"><img src="./images/Track_Up.png" name="Track" id="Track" /></a>
                   
            <div class="cleaner"></div>
        </div>
    
    	<div class="cleaner"></div>
    </div>
    
    <div class="cleaner_h30"></div>
    
    <div class="section_w940">
    	<table width="500" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>

      	<div class="cleaner"></div>
    </div>

</div> <!-- end of templatemo_content -->
<div class="processor" id="showprocessor">
	<table><tr><td><img src="images/red-processor-small1.gif"/></td><td><h4 class="redclass">&nbsp;&nbsp;Processing Request.....</h4></td><tr></table>
 <div class="close" id="CloseBtn"></div>
</div>

<div id="templatemo_content_bottom"></div>
<div id="templatemo_footer">  
        Copyright © 2010 <a href="grievanceDetails">grievance</a> | Development
</div> <!-- end of footer -->
<script>
	window.onresize=function ResizeWindow_maintemplate(){
	getWidthHeigth();
	};
	getWidthHeigth();
</script>

</body>
</html>