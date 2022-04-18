<%-- 
    Document   : LogoutCustomer
    Created on : Mar 26, 2022, 7:50:55 AM
    Author     : Siu Kit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logged Out</title>
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
            
            button{
                border-radius: 8px;
                padding: 10px 10px 10px 10px;
                background-color: #fc7f03;
                color: white;
            }
            
            button:hover{
                background-color: #cc6600;
                color: black;
            }
            
        </style>
    </head>
    <body>
        <h1 style="text-align: center;margin-top: 100px;">You had logged out.</h1>
        <div id="container" >
            <h3>Thank you for using and trusting our services.</h3><br>
            <h3>Wish you have a nice day!</h3>
            <br><br>
            <a href="../index.html" style="text-decoration:none; color:black"><button id="back-btn">Back to Login</button></a>
        </div>
    </body>
</html>