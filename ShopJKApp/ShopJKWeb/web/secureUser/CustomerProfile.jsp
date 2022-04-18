<%-- 
    Document   : CustomerProfile
    Created on : Mar 21, 2022, 9:58:07 PM
    Author     : Siu Kit
--%>
<% if (session.getAttribute("login") == null || session.getAttribute("login").equals("")) {
    response.sendRedirect("../index.html");
   } else {  %>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, model.*"%>
<jsp:useBean id="login" scope="session" class="model.Customer" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Profile</title>
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
            
            button{
                border-radius: 8px;
                padding: 10px 10px 10px 10px;
                background-color: green;
                color: white;
            }
            
            button:hover{
                background-color: #45a049;
                color: black;
            }

        </style>
        <%@ include file="headers.jsp" %> 
    </head>
    <body>
        <h1 align="center">Viewing Profile</h1>
        
        <% DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
           String date = dateFormat.format(login.getBirthdate());
               
        %>
        <table border="1" style="margin-bottom: 20px" align="center">
            <thead>
                <tr>
                    <th colspan="4" style="align:center; background-color:darkblue">Customer Profile</th>                    
                </tr>
            </thead>
            
            <tbody>
                <tr>
                    <td colspan="2">Username:</td>
                    <td colspan="2">${login.custusername}</td> 
                </tr>
                
                <tr>
                    <td colspan="2">Customer Name:</td>
                    <td colspan="2">${login.custname}</td> 
                </tr>
                 
                <tr>
                    <td colspan="2">D.O.B</td>
                    <td colspan="2"><%= date %></td> 
                </tr>
                
                <tr>
                    <td colspan="2">Phone Number</td>
                    <td colspan="2">${login.telno}</td> 
                </tr>
                
                <tr>
                    <td colspan="2">Email</td>
                    <td colspan="2">${login.email}</td> 
                </tr>
                
                <tr>
                    <td colspan="2">Address</td>
                    <td colspan="2">${login.address}</td>
                </tr>
                
                <tr>
                    <td><a href="../ShowOrderHistory" style="text-decoration:none; color:black"><button>Order History</button></a></td>
                    <td><a href="UpdateCustProfile.jsp" style="text-decoration:none; color:black"><button>Update Profile</button></a></td>
                    <td><a href="DeleteCustAccount.jsp" style="text-decoration:none; color:black"><button>Delete Account</button></a></td>
                    <td><a href="../ListItem" style="text-decoration:none; color:black"><button>Back to Home</button></a></td>
                    
                </tr>
                
                
            </tbody>
        </table>
                
        
    </body>
</html>
<% } %>
