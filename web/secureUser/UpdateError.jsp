<%-- 
    Document   : UpdateError
    Created on : Mar 25, 2022, 9:31:05 PM
    Author     : Siu Kit
--%>
<% if (session.getAttribute("login") == null || session.getAttribute("login").equals("")) {
    response.sendRedirect("../index.html");
   } else {  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="error" scope="session" class="String" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Updating Information</title>
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
        <h1 style="color:white;text-align: center;margin-top: 100px;">Error!</h1>
        <br><br>
        <div id="container" >
            <h3>${fn:replace(error, newLineChar, "<br><br>")}</h3>
            <a href="UpdateCustProfile.jsp"><button id="back-btn">Back</button></a>
        </div>
    </body>
</html>
<% } %>