<%-- 
    Document   : DeleteStaff
    Created on : Mar 30, 2022, 12:45:07 AM
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

            h3{
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
                margin-top: 100px;
            }


            #email:hover{
                color:lightseagreen;
            }
            #back-link{
                display: absolute;
                padding:10px;
                color: black;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
          <h4><a href="../ProcessStaffList" id="back-link" >&#8668;Back</a></h4>
        <div id="container">
            <h1 style="color:white;text-align: center;">This staff account has been deleted. </h1>
        </div>

    </body>
</html>
<% } %>