<%-- 
    Document   : DeleteAdminAccount
    Created on : Mar 29, 2022, 1:46:02 PM
    Author     : Siu Kit
--%>
<% if (session.getAttribute("login3") == null || session.getAttribute("login3").equals("")) {
    response.sendRedirect("AdminLogin.html");
   } else {  %>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, model.*"%>
<jsp:useBean id="login3" scope="session" class="model.Manager" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Account</title>
        <style>
            input[type=submit], #cancel-btn {
                width: 100%;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            #submit-btn{
                background-color: green;
                color: white;
            }
            #cancel-btn{
                background-color: #fc7f03;
                color: white;
            }


            #submit-btn:hover {
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

            input[type=text],input[type=tel],input[type=email],input[type=password],input:read-only {
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
          
            
            
        </style>
    </head>
    <body>
        <h1 align="center">Deleting Account</h1>
        <h2 align="center">Are you sure you want to delete it? Once deleted, this action cannot be undone</h2>
        <% DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
           String date = dateFormat.format(login3.getBirthdate());
               
        %>
        
        <form action="../ProcessDeleteAdmin" method="POST" >
            <table border="1" align="center">
                <thead>
                    <tr>
                        <th colspan="2" style="align:center">Admin Profile</th>                    
                    </tr>
                </thead>

               <tr>
                    <td>Username:</td>
                    <td><%= login3.getManagerusername() %><input type="hidden" name="deleteManagerUserName" value="<%= login3.getManagerusername() %>"></td> 
                </tr>
                
                <tr>
                    <td>Customer Name:</td>
                    <td>${login3.managername}</td> 
                </tr>
                 
                <tr>
                    <td>D.O.B</td>
                    <td><%= date %></td> 
                </tr>
                
                <tr>
                    <td>Phone Number</td>
                    <td>${login3.telno}</td> 
                </tr>
                
                <tr>
                    <td>Email</td>
                    <td>${login3.email}</td> 
                </tr>
                
                <tr>
                    <td>Address</td>
                    <td>${login3.address}</td>
                </tr>
                    <tr>
                        <td><input type="submit" id="submit-btn" value="Delete" style="width: 100%"></td>
                        <td><button type="button" id="cancel-btn" onclick="location.href='AdminProfile.jsp' " style="width: 100%; text-decoration:none; color:black">Cancel</button></td>
                    </tr>


                </tbody>
            </table>    
        </form>
    </body>
</html>
<% } %>