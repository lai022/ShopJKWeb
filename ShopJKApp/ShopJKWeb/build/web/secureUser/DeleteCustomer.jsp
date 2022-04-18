<%-- 
    Document   : DeleteCustomer
    Created on : Mar 26, 2022, 11:04:37 PM
    Author     : Siu Kit
--%>
<% if (session.getAttribute("login") == null || session.getAttribute("login").equals("")) {
    response.sendRedirect("../index.html");
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
            a{
                text-decoration: none;
                display: block;
                text-align: center;
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
            }
            
            #email{
                color:lightcyan;
            }
            
            #email:hover{
                color:lightseagreen;
            }
        </style>
    </head>
    <body>
        <h1 style="text-align: center;margin-top: 100px;">Your account had been deleted successfully.</h1>
        <div id="container" >
            <h3>We are so sorry that you had decided to delete your account.</h3>
            <h3>If there is any inconvenience caused while using the website or have any suggestions,</h3>
            <h3> please kindly send an email to <br><br><a href = "mailto: shopjk@gmail.com" id="email">shopjk@gmail.com</a><br> to let us serve you better in the future.</h3>
            <br><br>
            <a href="../index.html"><button id="back-btn">Back to Login</button></a>
        </div>
    </body>
</html>
<% } %>
