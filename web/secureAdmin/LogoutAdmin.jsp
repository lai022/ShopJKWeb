<%-- 
    Document   : LogoutAdmin
    Created on : Mar 28, 2022, 9:48:31 PM
    Author     : Siu Kit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
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
            
        </style>
    </head>
    <body>
        <h1 style="text-align: center;margin-top: 100px;">You have logged out!</h1>
        <div id="container" >
            <h3>Wish you have a nice day!</h3>
            <br><br>
            <a href="AdminLogin.html" > <button id="back-btn">Back to Login</button></a>
        </div>
    </body>
</html>
