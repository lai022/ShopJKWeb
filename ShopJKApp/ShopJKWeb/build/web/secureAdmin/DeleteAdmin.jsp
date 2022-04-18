<%-- 
    Document   : DeleteAdmin
    Created on : Mar 29, 2022, 1:45:25 PM
    Author     : Siu Kit
--%>
<% if (session.getAttribute("login3") == null || session.getAttribute("login3").equals("")) {
    response.sendRedirect("AdminLogin.html");
   } else {  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Deleted</title>
        <style>
            #back-btn{
                padding:20px;
                color:white;
                background-color: goldenrod;
                border-radius: 15px;
                font-weight: bold;
                font-size: 19px;
            }

            #back-btn:hover{
                cursor:pointer;
                color:black;
            }
            
            h1{
                color:white;
                text-align: center;
            }

            #container{
                padding: 10px;
                background-color: #4D4D4D;
                display: block;
                width:80%;
                margin: 0 auto;
                border-radius: 15px;
            }
            #back-link{
                display: block;
                padding:10px;
                color: black;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <h4><a href="../ProcessAdminList" id="back-link" >&#8668;Back</a></h4>
        <div id="container" style="text-align: center;margin-top: 100px;">
            <h1>This admin account has been deleted.</h1>
        </div>
    </body>
</html>
<% } %>