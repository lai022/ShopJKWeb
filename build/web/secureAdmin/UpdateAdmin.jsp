<%-- 
    Document   : UpdateAdmin
    Created on : Mar 29, 2022, 12:35:24 PM
    Author     : Siu Kit
--%>
<% if (session.getAttribute("login3") == null || session.getAttribute("login3").equals("")) {
    response.sendRedirect("AdminLogin.html");
   } else {  %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, model.*"%>
<jsp:useBean id="admin" scope="session" class="model.Manager" />
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
           String date = dateFormat.format(admin.getBirthdate());
               
        %>
        <div id="container">
        <h1 align="center">This account is updated successfully</h1><br><br>
        <h3 align="center">Admin Latest Details</h3>
        <table border="1" align="center" style="margin-top: 20px; height: 400px; width: 450px;  background-color: #7bdcb5; border-color: cornflowerblue">
            <tr>
                <td>Username :</td>
                <td>${admin.managerusername}</td>
            </tr>
            <tr>
                <td>Name     :</td>
                <td>${admin.managername} </td>
            </tr>
            <tr>
                <td>D.O.B    :</td>
                <td> <%= date %> </td>
            </tr>
            <tr>
                <td>Phone    :</td>
                <td>${admin.telno} </td>
            </tr>
            <tr>
                <td>Address  :</td>
                <td>${admin.address} </td>
            </tr>
            <tr>
                <td>Email    :</td>
                <td> ${admin.email} </td>
            </tr> 
            <tr>
                <td>
                    <a href="MaintainAdmin.jsp" style="text-decoration: none; color:black"><button id="back-btn">Back</button></a>
                </td>
                
                <td>
                    <a href="AdminLogin.html" style="text-decoration: none; color:black"><button id="back-btn">Back to Login</button></a>
                </td>
            </tr>         
        </table>
        </div>
        
    </body>
</html>
<% } %>