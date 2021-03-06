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
            jQuery.timer = function(time, func, callback) {
                var a = {timer: setTimeout(func, time), callback: null}
                if (typeof(callback) == 'function') {
                    a.callback = callback;
                }
                return a;
            };
            function launchapp() {
                var myTimer = {};

                for (var i = 0; i < document.loginfrm.usertype.length; i++)
                {
                    if (document.loginfrm.usertype[i].checked)
                    {
                        var rad_val = document.loginfrm.usertype[i].value;
                        if (rad_val == 'p') {
                            myTimer = $.timer(2000, function() {
                                window.open("index.jsp", '_self');
                            });


                        } else if (rad_val == 's') {
                            myTimer = $.timer(2000, function() {
                                window.open("index-state.jsp", '_self');
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
                        <tr>
                    </table>


                </div>

            </div> <!-- end of templatemo_banner -->

        </div> 
        <div id="templatemo_menu_wrapper">


        </div> <!-- end of templatemo_menu_wrapper -->

        <div id="templatemo_content">
            <div class="sidebar" id="container"><div id="content">
                    <div id="paddedContent">
                        <div id="tabs">
                            <ul>
                                <li><a href="http://localhost:8080/Grievance_Portal/signon.jsp">Sign in</a> </li>
                                <li class="active"><a href="http://localhost:8080/Grievance_Portal/Signup.jsp">Create an account</a></li>
                            </ul>
                        </div>
                        <form name="signUpForm" class="ajaxForm isValidated" id="signUpForm" action="http://localhost:8080/Grievance_Portal/Signup.jsp" method="post">
                            <div id="partnerLogins1">
                                <div id="alternativeSignInTitle">Skip this step by signing in with your Microsoft or Facebook account</div>
                                <a tabindex="4" id="microsoftLogin" href="https://login.skype.com/login/oauth/microsoft?application=account">Microsoft account</a><p id="microsoftLoginHint">A Messenger, Hotmail or Outlook.com account.</p>
                                <a tabindex="5" id="facebookLogin" href="https://login.skype.com/login/oauth/facebook?application=account">Facebook</a></div>
                            <div class="formContainer">
                                <div class="fieldRow noMargin">
                                    <div class="specialRow leftRow">
                                        <label for="firstName">First name*</label>
                                        <input name="firstname" class="Skypelogin_Wbr_Name noMessageWhenEmpty" id="firstName" type="text" maxlength="50">
                                        <div class="fieldError"></div></div><div class="specialRow rightRow"><label for="lastName">Last name*</label> 
                                        <input name="lastname" class="Skypelogin_Wbr_Name noMessageWhenEmpty" id="lastName" type="text" maxlength="50" >
                                        <div class="fieldError">

                                        </div>

                                    </div>

                                </div>
                                <div class="fieldRow noMargin">
                                    <div class="specialRow leftRow">
                                        <label for="email">Your email address*</label>
                                        <input name="email" class="Skypelogin_Wbr_Email hasFormat fillFirst requires-emailRepeat noMessageWhenEmpty mustBeLtr" id="email" type="text" ></div>
                                    <div class="specialRow rightRow disabled">
                                        <label for="emailRepeat">Repeat email*</label> 
                                        <input name="email_repeat" disabled="disabled" class="Skypelogin_Wbr_Email hasFormat fillSecond requires-email clearDetailsOnBlur noMessageWhenEmpty mustBeLtr" id="emailRepeat" type="text"></div>
                                    <div class="fieldDetails clear"></div>
                                    <div class="fieldError clear"></div>

                                </div>
                                <div class="fieldRow">
                                    <p class="formNotice">Note: no-one can see your email address.</p>
                                </div>
                            </div>
                            <h2>Profile information</h2>
                            <div class="formContainer">
                                <div class="fieldRow">
                                    <p class="formNotice">Note: anyone on Skype can see your profile information.</p>
                                </div>
                                <div class="fieldRow labelLeft">
                                    <label for="day">Birthday</label>
                                    <select name="day" class="noMessageWhenEmpty Skypelogin_Wbr_Birthday" id="day">
                                        <option selected="selected" value="">Day</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                        <option value="13">13</option>
                                        <option value="14">14</option>
                                        <option value="15">15</option>
                                        <option value="16">16</option>
                                        <option value="17">17</option>
                                        <option value="18">18</option>
                                        <option value="19">19</option>
                                        <option value="20">20</option>
                                        <option value="21">21</option>
                                        <option value="22">22</option>
                                        <option value="23">23</option>
                                        <option value="24">24</option>
                                        <option value="25">25</option>
                                        <option value="26">26</option>
                                        <option value="27">27</option>
                                        <option value="28">28</option>
                                        <option value="29">29</option>
                                        <option value="30">30</option>
                                        <option value="31">31</option>
                                    </select>
                                    <select name="month" class="noMessageWhenEmpty Skypelogin_Wbr_Birthday" id="month">
                                        <option selected="selected" value="">Month</option>
                                        <option value="1">January</option>
                                        <option value="2">February</option>
                                        <option value="3">March</option>
                                        <option value="4">April</option>
                                        <option value="5">May</option>
                                        <option value="6">June</option>
                                        <option value="7">July</option>
                                        <option value="8">August</option>
                                        <option value="9">September</option>
                                        <option value="10">October</option>
                                        <option value="11">November</option>
                                        <option value="12">December</option>
                                    </select>
                                    <label class="inRow" for="year">Year</label>
                                    <input name="year" class="noMessageWhenEmpty Skypelogin_Wbr_Birthday short" id="year" type="text" size="4" maxlength="4" autocomplete="off">
                                    <div class="fieldError"></div>
                                    <label for="gender">Gender</label>
                                    <select name="gender" class="noMessageWhenEmpty Skypelogin_Wbr_Gender" id="gender">
                                        <option selected="selected" value="">Select</option>
                                        <option value="1">Male</option>
                                        <option value="2">Female</option>
                                    </select>
                                    <div class="fieldError"></div>

                                </div>
                                <div class="fieldRow labelLeft">
                                    <label for="country">Country/Region*</label>
                                    <select name="country" class="noMessageWhenEmpty Skypelogin_Wbr_Country" id="country">
                                        <option value="">Select</option>
                                        <option selected="selected" value="us">United States</option>
                                    </select>
                                    <div class="fieldError">

                                    </div>

                                </div>
                                <div class="fieldRow labelLeft">
                                    <label for="city">City</label>
                                    <input name="city" class="noMessageWhenEmpty Skypelogin_Wbr_City" id="city" type="text" autocomplete="off">
                                    <div class="fieldError"></div></div>
                                <div class="fieldRow labelLeft noMargin">
                                    <label for="country">Language*</label>
                                    <select name="lang" class="noMessageWhenEmpty Skypelogin_Wbr_Language" id="lang">
                                        <option value="">Select</option>
                                        <option selected="selected" value="en">English</option>
                                    </select>
                                    <div class="fieldError"></div></div>
                             </div>

                            <div class="formContainer">
                                <div class="fieldRow noMargin">
                                    <label for="skypeName">Skype Name*</label>
                                    <input name="skypeNameHelper" id="skypeNameHelper" type="hidden" value="false"> 
                                    <input name="new_username" class="hasFormat mandatory requires-firstName requires-lastName requires-skypeNameHelper validateOnFocus noMessageWhenEmpty mustBeLtr" id="skypeName" type="text" autocomplete="off"> 
                                    <span class="helpButton topRight" rel="helpBubble-0"></span>
                                    <div class="fieldError"></div>
                                    <div class="fieldDetails"></div>
                                    <p class="formNotice">Note: only choose a name you have a right to use.</p>
                                </div>
                                <div class="fieldRow noMargin">
                                    <div class="specialRow leftRow">
                                        <label for="password">Password*</label> 
                                        <input name="password" class="hasFormat mandatory fillFirst requires-repeatPassword noMessageWhenEmpty" id="password" type="password" autocomplete="off">
                                    </div>
                                    <div class="specialRow rightRow disabled">
                                        <label for="repeatPassword">Repeat password*</label>
                                        <input name="repeat_password" disabled="disabled" class="hasFormat mandatory fillSecond requires-password noMessageWhenEmpty" id="repeatPassword" type="password" autocomplete="off">
                                    </div>
                                    <div class="fieldError clear"></div>
                                    <div class="fieldDetails clear"></div>
                                    <p class="formNotice">Between 6-20 characters, include Latin letters and numbers. Note: no-one else can see your password.</p>
                                </div>
                            </div>


                    </div>
                    <p>
                        <small>Yes, I have read and I accept the <a href="http://www.skype.com/go/tos" target="_blank">Skype Terms of Use</a> and the <a href="http://www.skype.com/go/privacy" target="_blank">Skype Privacy Statement</a></small></p>
                    <div class="fieldRow">
                        <input name="checkOnSubmit" id="checkOnSubmit" type="hidden" value="formError" >
                        <input name="id" type="hidden" value="6270000000023887836" >
                        <input name="partner_id" type="hidden" value="8494fd242840c79b12e7eb62e2b10868" >
                        <input name="application" type="hidden" value="account" > 
                        <input name="return_url" type="hidden" value=""> 
                        <input name="token" type="hidden" value="" > 
                        <input name="intsrc" type="hidden" value="" >
                        <input name="intcmp" type="hidden" value="" >
                        <input name="cm_mmc" type="hidden" value="" >
                        <input name="nu" type="hidden" value="" >
                        <input name="acq" id="acq" type="hidden" >
                        <div id="cookieFlashDiv"><div id="player"></div></div> 
                        <button class="smallButton primaryCta checkOnSubmit" id="signUp" type="submit"> <span>Submit</span></button>
                        <div class="submitSpinner hidden"></div></div>
                    <div>
                        <input name="session_token" type="hidden" value="ea1497b662ee10d0b4fe1b3b7ebf7b3ee34e2771"></form></div></div>

                <div class="cleaner">

                </div>


                <div class="cleaner_h30"></div>

                <div class="section_w940">
                    <div class="section_w450 margin_r_40">

                    </div>

                    <!--div class="section_w450">
                     </div-->
                    <div class="cleaner"></div>
                </div>

            </div> <!-- end of templatemo_content -->
        </div>
            <div id="templatemo_content_bottom"></div>
            <div id="templatemo_footer">  
                Copyright © 2010 <a href="#">CNSI</a> | Development
            </div> <!-- end of footer -->
    </body>
</html>