<%-- 
    Document   : AddCustomer
    Created on : Mar 10, 2022, 7:48:32 AM
    Author     : Siu Kit
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, model.*"%>
<jsp:useBean id="registration" scope="session" class="model.Customer" />
<% DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
           String date = dateFormat.format(registration.getBirthdate());
               
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Created</title>
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

            .data-field{
                background-color: #e9eff0;
            }
        </style>   
    </head>
    <body>
        <h1 align="center">Your new account is created successfully</h1><br><br>
        <h3 align="center">Customer Registration Details</h3>
        <table border="1" align="center">
            <tr>
                <td>Username :</td>
                <td class="data-field">${registration.custusername}</td>
            </tr>
            <tr>
                <td>Name     :</td>
                <td class="data-field">${registration.custname} </td>
            </tr>
            <tr>
                <td>D.O.B    :</td>
                <td class="data-field"> <%= date %> </td>
            </tr>
            <tr>
                <td>Phone    :</td>
                <td class="data-field">${registration.telno} </td>
            </tr>
            <tr>
                <td>Address  :</td>
                <td class="data-field">${registration.address} </td>
            </tr>
            <tr>
                <td>Email    :</td>
                <td class="data-field"> ${registration.email} </td>
            </tr> 
            <tr>
                <td colspan="2">
                    <a href="../index.html" id="btn-link"><button style="width:100%" id="btn">Back to Login</button></a>
                </td>
            </tr>         
        </table>
        
        
    </body>
</html>