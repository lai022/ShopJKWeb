<%-- 
    Document   : OrderDetails
    Created on : Apr 13, 2022, 12:48:49 AM
    Author     : Ariana
--%>
<% if (session.getAttribute("login2") == null || session.getAttribute("login2").equals("")) {
    response.sendRedirect("StaffLogin.html");
   } else {  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Orderr"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<% 
    Orderr order = (Orderr)session.getAttribute("order");
%>
<% DecimalFormat decimalFormatter = new DecimalFormat("0.00"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Details</title>
        <style>
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
            #back-link{
                display: block;
                padding:10px;
                color: black;
                text-decoration: none;
            }
            #back-link:hover{
                cursor: pointer;
                color:#D2797B;
            }s
        </style>
    </head>
    <body>
        <h4><a href="orderStatus.jsp" id="back-link" >&#8668;Back</a></h4>
        <h1 align="center">Number <%= order.getOrderid() %> Order Details</h1>
        <table border="2" style="margin-bottom: 20px" align="center">
            <thead>
                <tr>
                    <th>Type</th>
                    <th>Detail</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Order ID</td>
                    <td><%= order.getOrderid() %></td>
                </tr>
                <tr>
                    <td>Tracking Number</td>
                    <td><%= order.getOrderstatusList().get(0).getTrackingnum() %></td>
                </tr>
                <tr>
                    <% DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                        String date = dateFormat.format(order.getOrderdate());

                    %>
                    <td>Order Date</td>
                    <td><%= date %></td>
                </tr>
                <tr>
                    <td>Username</td>
                    <td><%= order.getCustusername().getCustusername() %></td>
                </tr>
                <tr>
                    <td>Receiver Name</td>
                    <td><%= order.getReceiverid().getReceivername() %></td>
                </tr>
                <tr>
                    <td>Receiver Phone</td>
                    <td><%= order.getReceiverid().getReceiverphone() %></td>
                </tr>
                <tr>
                    <td>Receiver Address</td>
                    <td><%= order.getReceiverid().getReceiveraddress() %></td>
                </tr>
                <tr>
                    <td>Order Item</td>
                    <td><%= order.getOrderItemsList().get(0).getItemid().getItemid() %> <%= order.getOrderItemsList().get(0).getItemid().getItemname() %></td>
                </tr>
                <tr>
                    <td>Quantity Purchased</td>
                    <td><%= order.getOrderItemsList().get(0).getQty() %></td>
                </tr>
                <tr>
                    <td>Order Subtotal</td>
                    <td>RM <%= String.format("%.2f",order.getPaymentList().get(0).getSubtotal()) %></td>
                </tr>
                <tr>
                    <td>Tax Charged</td>
                    <td>RM <%= String.format("%.2f",order.getPaymentList().get(0).getTax()) %></td>
                </tr>
                <tr>
                    <td>Order Total</td>
                    <td>RM <%= String.format("%.2f",order.getPaymentList().get(0).getTotalamount()) %></td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
<% } %>
