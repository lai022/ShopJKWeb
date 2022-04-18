<%-- 
    Document   : AddStaff
    Created on : Mar 12, 2022, 8:28:45 PM
    Author     : Siu Kit
--%>
<% if (session.getAttribute("login3") == null || session.getAttribute("login3").equals("")) {
    response.sendRedirect("AdminLogin.html");
   } else {  %>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, model.*"%>
<jsp:useBean id="registrations" scope="session" class="model.Staff" />
<% DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
           String date = dateFormat.format(registrations.getBirthdate());
               
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Staff</title>
        <style>
        #btn{
                background-color: #4CAF50;
                color: white;
                padding: 10px;
            }

            #btn:hover {
                background-color: #45a049;
                color: black;
                cursor: pointer;
            }
            
            #btn-link{
                text-decoration: none;
                color: white;
            }
            
            #back-link{
                display: block;
                padding:10px;
                color: black;
                text-decoration: none;
            }
            
            input[type=submit], #cancel-btn {
                width: 100%;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type=submit]{
                background-color: #4CAF50;
                color: white;
            }
            #cancel-btn{
                background-color: #fc7f03;
                color: white;
            }


            input[type=submit]:hover {
                background-color: #45a049;
                color: black;
            }

            #cancel-btn:hover {
                background-color: #cc6600;
                color: black;
            }

            table{
                font-family: Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 50%;

            }
            th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: center;
                background-color: #125b80;
                color: white;
            }

            td{
                padding: 15px 20px 15px 20px;
                text-align: center;
                background-color: #f7fdff;
            }

            input[type=text],input[type=tel],input[type=email],input[type=password]{
                width: 100%;
                height: 100%;
                background-color: #e9eff0;
                border-color: white;
            }


            textarea {
                resize: none;
                width: 100%;
                height: 100%;
                background-color: #e9eff0;

            }

            input[type=text]:focus,input[type=tel]:focus,input[type=email]:focus,input[type=password]:focus,textarea:focus{
                outline: 3px solid lightskyblue;   
            }
            
            #customer-tab{
                background-color: lightcoral;
                color:black;

            }

            #staff-tab{
                background-color: lightslategrey;
                color:black;
                text-decoration: none;
            }
            
            #customer-tab:hover,#staff-tab:hover{
                background-color: black;
                cursor: pointer;
                color:white;
            }
            
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
        </style>  
    </head>
    <body>
        <h4><a href="../ProcessStaffList" id="back-link" >&#8668;Back</a></h4>
        <h2 align="center">The new staff account is created successfully</h2>
        <h1 align="center">Staff Registration Details</h1>
        <table border="1" align="center">
            <tr>
                <td>Username :</td>
                <td>${registrations.staffusername}</td>
            </tr>
            <tr>
                <td>Name     :</td>
                <td>${registrations.staffname} </td>
            </tr>
            <tr>
                <td>D.O.B    :</td>
                <td> <%= date %> </td>
            </tr>
            <tr>
                <td>Phone    :</td>
                <td>${registrations.telno} </td>
            </tr>
            <tr>
                <td>Address  :</td>
                <td>${registrations.address} </td>
            </tr>
            <tr>
                <td>Email    :</td>
                <td> ${registrations.email} </td>
            </tr> 
            <tr>
                <td colspan="2">
                    <a href="../secureStaff/StaffLogin.html" id="btn-link"><button style="width:100%" id="btn">Back to Login</button></a>

                </td>
            </tr>    
        </table>
    </body>
</html>
<% } %>