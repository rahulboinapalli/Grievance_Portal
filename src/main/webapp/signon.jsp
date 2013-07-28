<!DOCTYPE html>
<!--[if lt IE 7]><html lang="en" class=”ie6”><![endif]-->
<!--[if IE 7]><html lang="en" class=”ie7”><![endif]-->
<!--[if IE 8]><html lang="en" class=”ie8”><![endif]-->
<!--[if IE 9]><html lang="en" class=”ie9”><![endif]-->
<!--[if gt IE 9]><html lang="en"><![endif]-->
<!--[if !IE]>--><html lang="en"><!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login</title>
<link href="mainmedia.css" rel="stylesheet" type="text/css" />
<link href="page_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
<script type="text/javascript">
jQuery.timer = function(time,func,callback){
		var a = {timer:setTimeout(func,time),callback:null}
		if(typeof(callback) == 'function'){a.callback = callback;}
		return a;
	};
function launchapp(){
var myTimer = {};
						
for (var i=0; i < document.loginfrm.usertype.length; i++)
   {
   if (document.loginfrm.usertype[i].checked)
      {
		var rad_val = document.loginfrm.usertype[i].value;
		if(rad_val=='p'){
			myTimer = $.timer(2000,function(){
				window.open("index.jsp",'_self');
			});
			
			
		}else if(rad_val=='s'){
			myTimer = $.timer(2000,function(){
				window.open("index-state.jsp",'_self');
			});
			
		}
      }
   }

	

}
</script>
</head>
<body>
     <div id="templatemo_banner_wrapper">

            <div id="templatemo_banner">

                <div id="banner_content">
                    <table width="100%" border="0"  cellspacing="0">
                        <tr>
                            <td width="50%"  align="left"><img height="102" src="images/help.png"/></td>
                            <td align="right"><img height="94" src="images/home.png"/></td>
                            </tr>
                                </table>


                                </div>

                                </div> <!-- end of templatemo_banner -->

                                </div> 
<div id="templatemo_menu_wrapper">


</div> <!-- end of templatemo_menu_wrapper -->

<div id="templatemo_content">

        <div id="container">

            <div id="content"><div id="tabs">
                    <ul>
                        <li class="active"><a href="signon" name="showPage" >Sign in</a> </li>
                        <li><a href="signup">Create an account</a></li>
                    </ul>
                </div>
                <div id="mainContainer">
                    <form id="UserAction" action="signIn" method="post" autocomplete="off">
                        <table>
                            <tr><td>
                            <label for="username">User Name:</label></td>
                            <td>
                                <input name="username" tabindex="1" id="username" type="text" maxlength="150" value="" size="25"></td>
                            </tr>
                            <tr><td>
                            <label for="password">Password:</label></td>
                            <td>
                            <input name="password" tabindex="2" id="password" type="password" maxlength="256" value="" autocomplete="off" size="25"></td>
                            </tr>
                        </table>
                        <div class="signInContainer">
                            <button tabindex="3" class="smallButton primaryCta" id="signIn" type="submit" value="signIn">
                                <span>Sign me in</span></button>
                        </div>

                        <input name="session_token" type="hidden"></form>
                    <div id="partnerLogins">
                        <div id="alternativeSignInTitle">Alternatively, sign in with</div>
                        <a tabindex="4" id="microsoftLogin" href="https://login.skype.com/login/oauth/microsoft?application=account&amp;return_url=https%3A%2F%2Fsecure.D10">
                            Microsoft account</a>
                        <p id="microsoftLoginHint">A Messenger, Hotmail or Outlook.com account.</p>
                        <a tabindex="5" id="facebookLogin" href="https://login.skype.com/login/oauth/facebook?application=account&amp;return_url=https%3A%2F%2Fsecure.skype.com%2Faccount%2Floginhttp%3A%2F%2Fsearch.conduit.com%2F%3FSearchSource%3D10">
                            Facebook</a>
                    </div><div style="clear: both;">

                    </div>

                </div>
                <script>
                    $(function() {
                        if ($("#username").val()) {
                            $("#password").focus();
                        } else {
                            $("#username").focus();
                        }
                    });
                </script>
            </div>
        </div>
			<div class="cleaner"></div>
    
    
    <div class="cleaner_h30"></div>
    
    <div class="section_w940">
    	<div class="section_w450 margin_r_40">
		
      	</div>
        
        <!--div class="section_w450">
       	 </div-->
      	<div class="cleaner"></div>
    </div>

</div> <!-- end of templatemo_content -->
<div id="templatemo_content_bottom"></div>
<div id="templatemo_footer">  
        Copyright © 2010 <a href="grievanceDetails">Grievance</a> | Development
</div> <!-- end of footer -->
</body>
</html>