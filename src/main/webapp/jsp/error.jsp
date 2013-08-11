<%-- 
    Document   : error
    Created on : Aug 11, 2013, 2:54:23 PM
    Author     : sabbani
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>ERROR Page</title>

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
        
        <script type="text/javascript">
            /*$(document).ready(function()
            {
               var msg = '${ERR_MSG}';
                 //var msg = "Registration Not Success!";
               if(msg != null && msg != "")
                   $("#username").value=msg;
                alert(msg);
            }
            );*/
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
            <div id="content">
                <div id="mainContainer">
                        <div class="signInContainer">
                            <label id="errorMsg" style="color: red; font-size: 30px; "><c:out value="${ERR_MSG}"></c:out> </label>
                        </div>
                </div>
               
            </div>
        </div>
			
</div> <!-- end of templatemo_content -->
<div id="templatemo_content_bottom"></div>
<div id="templatemo_footer">
        Copyright © 2010 <a href="grievanceDetails">Grievance</a> | Development
</div> <!-- end of footer -->
</body>
</html>
