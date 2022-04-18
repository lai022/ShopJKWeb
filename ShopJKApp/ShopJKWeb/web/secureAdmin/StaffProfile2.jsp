<%-- 
    Document   : StaffProfile2
    Created on : Mar 29, 2022, 9:10:34 PM
    Author     : Siu Kit
--%>
<% if (session.getAttribute("login3") == null || session.getAttribute("login3").equals("")) {
    response.sendRedirect("AdminLogin.html");
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
            .btn{
                background-color: black;
                color: white;
                padding:10px;
                border-radius: 15px;
            }

            .btn:hover {
                background-color: white;
                color: black;
                cursor: pointer;
            }
            .data-field{
                background-color: #e9eff0;
            }
            #back-link{
                display: block;
                padding:10px;
                color: black;
                text-decoration: none;
            }
        </style>
        <title>Staff Information</title>
    </head>
    <body>
        <h4><a href="../ProcessStaffList" id="back-link" >&#8668;Back</a></h4>
        <h1 align="center">Profile Information</h1>
        
        <% DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
           String date = dateFormat.format(login2.getBirthdate());
        
        
        %>
        
        <table border="1" style="margin-bottom: 20px" align="center">
            <thead>
                <tr>
                    <th colspan="2" style="align:center">Staff Profile</th>                    
                </tr>
            </thead>
            
            <tbody>
                <tr>
                    <td>Username:</td>
                    <td class="data-field">${login2.staffusername}</td> 
                </tr>
                
                <tr>
                    <td>Customer Name:</td>
                    <td class="data-field">${login2.staffname}</td> 
                </tr>
                 
                <tr>
                    <td>D.O.B</td>
                    <td class="data-field"><%= date %></td> 
                </tr>
                
                <tr>
                    <td>Phone Number</td>
                    <td class="data-field">${login2.telno}</td> 
                </tr>
                
                <tr>
                    <td>Email</td>
                    <td class="data-field">${login2.email}</td> 
                </tr>
                
                <tr>
                    <td>Address</td>
                    <td class="data-field">${login2.address}</td>
                </tr>
                
                <% if(login2.getStatus().equals("A")){ %>
                <tr>
                    <td><a href="UpdateStaffProfile2.jsp" style="text-decoration:none; color:black;"><button class="btn">Update Profile</button></a></td>
                    <td><a href="DeleteStaffAccount.jsp" style="text-decoration:none; color:black;"><button class="btn">Delete Account</button></a></td>
                </tr>
                <%} else { %>
                <tr>
                    <td colspan="2"><a href="UpdateStaffProfile2.jsp" style="text-decoration:none; color:black"><button class="btn">Update Profile</button></a></td>                                        
                </tr>
                
                <% } %>
                
                
            </tbody>
        </table>
        
    </body>
</html>
<% } %>