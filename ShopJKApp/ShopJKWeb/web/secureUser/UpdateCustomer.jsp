<%-- 
    Document   : UpdateCustomer
    Created on : Mar 25, 2022, 8:55:43 PM
    Author     : Siu Kit
--%>
<% if (session.getAttribute("login") == null || session.getAttribute("login").equals("")) {
    response.sendRedirect("../index.html");
   } else {  %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, model.*"%>
<jsp:useBean id="login" scope="session" class="model.Customer" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Updated</title>
         <style>
            body{
                font-size: 16pt;
            }

            #back-btn{
                padding:5px;
                width: 100%;
                color:black;
                background-color: lightgrey;
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
                text-align: center;
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
        <% DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
           String date = dateFormat.format(login.getBirthdate());
               
        %>
        <div id="container">
        <h2 align="center">Your new account is updated successfully</h2><br><br>
        <h1 align="center">Customer Latest Details</h1>
        <table border="1" align="center" style="margin-top: 20px; height: 400px; width: 450px;  background-color: #7bdcb5; border-color: cornflowerblue">
            <tr>
                <td>Username :</td>
                <td>${login.custusername}</td>
            </tr>
            <tr>
                <td>Name     :</td>
                <td>${login.custname} </td>
            </tr>
            <tr>
                <td>D.O.B    :</td>
                <td> <%= date %> </td>
            </tr>
            <tr>
                <td>Phone    :</td>
                <td>${login.telno} </td>
            </tr>
            <tr>
                <td>Address  :</td>
                <td>${login.address} </td>
            </tr>
            <tr>
                <td>Email    :</td>
                <td> ${login.email} </td>
            </tr> 
            <tr>
                <td>
                    <a href="CustomerProfile.jsp" style="text-decoration: none; color:black"><button id="back-btn">Profile</button></a>
                </td>
                
                <td>
                    <a href="../index.html" style="text-decoration: none; color:black"><button id="back-btn">Login</button></a>
                </td>
            </tr>         
        </table>
        </div>
        
    </body>
</html>
<% } %>