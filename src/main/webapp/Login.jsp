<!DOCTYPE html>
<!--[if lt IE 7]><html lang="en" class=”ie6”><![endif]-->
<!--[if IE 7]><html lang="en" class=”ie7”><![endif]-->
<!--[if IE 8]><html lang="en" class=”ie8”><![endif]-->
<!--[if IE 9]><html lang="en" class=”ie9”><![endif]-->
<!--[if gt IE 9]><html lang="en"><![endif]-->
<!--[if !IE]>--><html lang="en"><!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Grievance || Appeals </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="stylesheet" href="mainmedia.css" type="text/css">

        <script src="js/vendor/modernizr-2.6.1.min.js"></script>
        <script src="js/libs/jquery-1.9.0/jquery.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>
    </head>
    <body class="flag">
        <nav id="scom" class="slimline isNotAuthenticated" data-content-key="authenticationStatus">
            <div class="centerWrapper">
                <div id="templatemo_banner_wrapper">

                    <div id="templatemo_banner">

                        <div id="banner_content" >
                            <table width="100%" border="0"  cellspacing="0">
                                <tr>
                                    <td width="50%"  align="left"><img height="105" src="images/help.png"/></td>
                                    <td width="50%" align="right"><img id="noheight" src="images/home.png"/></td>
                                <tr>
                            </table>


                        </div>
                    </div> <!-- end of templatemo_banner -->

                </div>
            </div>
        </nav>



        <div id="container">

            <div id="content"><div id="tabs">
                    <ul>
                        <li class="active"><a href="https://login.skype.com/login?">Sign in</a> </li>
                        <li><a href="https://login.skype.com/account/signup-form?">Create an account</a></li>
                    </ul>
                </div>
                <div id="mainContainer">
                    <form id="loginForm" action="http://localhost:8080/Grievance_Portal/index.jsp" method="post" autocomplete="off">
                        <label for="username">User Name</label>
                        <input name="username" tabindex="1" id="username" type="text" maxlength="150" value=""> 
                        <label for="password">Password</label>
                        <input name="password" tabindex="2" id="password" type="password" maxlength="256" value="" autocomplete="off"> 
                        <div class="signInContainer">
                            <button tabindex="3" class="smallButton primaryCta" id="signIn" type="submit">
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

        <footer class="slimlineFooter">

            <div class="bottom ">
                <p>Copyright © 2010 <a href="#">grievance</a> | Development</p>
                <div class="centered">
                    <div class="ms-logo"></div>
                </div>
            </div>
        </footer>
    </body>

</html>
