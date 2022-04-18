<%-- 
    Document   : StaffProfile
    Created on : Mar 21, 2022, 11:22:38 PM
    Author     : Siu Kit
--%>
<% if (session.getAttribute("login2") == null || session.getAttribute("login2").equals("")) {
    response.sendRedirect("StaffLogin.html");
   } else {  %>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, model.*"%>
<jsp:useBean id="login2" scope="session" class="model.Staff" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Profile</title>
        <style>
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
            
            button{
                width:100%;
            }
            
            button{
                padding: 10px 10px 10px 10px;
                background-color: green;
                color: white;
            }
            
            button:hover{
                background-color: #45a049;
                color: black;
            }
            
        </style>
        <%@ include file="headers2.jsp" %> 
    </head>
    <body>
        <h1 align="center">Staff Profile</h1>
        
        <% DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
           String date = dateFormat.format(login2.getBirthdate());
        
        
        %>
        
        <table border="1" style="margin-bottom: 20px" align="center">
            <thead>
                <tr>
                    <th colspan="2" style="align:center; background-color: darkblue">Staff Profile</th>                    
                </tr>
            </thead>
            
            <tbody>
                <tr>
                    <td>Username:</td>
                    <td>${login2.staffusername}</td> 
                </tr>
                
                <tr>
                    <td>Customer Name:</td>
                    <td>${login2.staffname}</td> 
                </tr>
                 
                <tr>
                    <td>D.O.B</td>
                    <td><%= date %></td> 
                </tr>
                
                <tr>
                    <td>Phone Number</td>
                    <td>${login2.telno}</td> 
                </tr>
                
                <tr>
                    <td>Email</td>
                    <td>${login2.email}</td> 
                </tr>
                
                <tr>
                    <td>Address</td>
                    <td>${login2.address}</td>
                </tr>
                
                <tr>
                    <td colspan="2"><a href="UpdateStaffProfile.jsp" style="text-decoration:none; color:black"><button>Update Profile</button></a></td>
                    
                </tr>
                
                
            </tbody>
        </table>
        
        
    </body>
</html>
<% }%>