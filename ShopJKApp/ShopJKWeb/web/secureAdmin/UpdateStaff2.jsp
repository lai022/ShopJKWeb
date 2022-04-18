<%-- 
    Document   : UpdateStaff2
    Created on : Mar 30, 2022, 12:22:19 AM
    Author     : Siu Kit
--%>
<% if (session.getAttribute("login3") == null || session.getAttribute("login3").equals("")) {
    response.sendRedirect("AdminLogin.html");
   } else {  %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, model.*"%>
<jsp:useBean id="login2" scope="session" class="model.Staff" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
           String date = dateFormat.format(login2.getBirthdate());
               
        %>
        <div id="container">
        <h1 align="center">Your new account is updated successfully</h1><br><br>
        <h3 align="center">Staff Latest Details</h3>
        <table border="1" align="center" style="margin-top: 20px; height: 400px; width: 450px;  background-color: #7bdcb5; border-color: cornflowerblue">
            <tr>
                <td>Username :</td>
                <td>${login2.staffusername}</td>
            </tr>
            <tr>
                <td>Name     :</td>
                <td>${login2.staffname} </td>
            </tr>
            <tr>
                <td>D.O.B    :</td>
                <td> <%= date %> </td>
            </tr>
            <tr>
                <td>Phone    :</td>
                <td>${login2.telno} </td>
            </tr>
            <tr>
                <td>Address  :</td>
                <td>${login2.address} </td>
            </tr>
            <tr>
                <td>Email    :</td>
                <td> ${login2.email} </td>
            </tr> 
            <tr>
                <td><a href="MaintainStaff.jsp" style="text-decoration: none; color:black; width:100%"><button id="back-btn">Back</button></a></td>
                
                <td>
                    <a href="secureStaff/StaffLogin.html" style="text-decoration: none; color:black"><button id="back-btn">Back to Login</button></a>
                </td>
            </tr>         
        </table>
        </div>
    </body>
</html>
<% } %>