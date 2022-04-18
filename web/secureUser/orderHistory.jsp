<%-- 
    Document   : orderHistory
    Created on : Mar 25, 2022, 12:01:25 AM
    Author     : Ariana & Shin Mei
--%>
<% if (session.getAttribute("login") == null || session.getAttribute("login").equals("")) {
    response.sendRedirect("../index.html");
   } else {  %>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="model.Orderr"%>
<%@page import="model.OrderItems"%>
<%@page import="model.Review"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<OrderItems> orderList = (List) session.getAttribute("orderList");
    String cusername = (String) session.getAttribute("cusername");
    List<Review> rList = (List<Review>) session.getAttribute("rList");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order History</title>
        <style>
            body{
                background-color: white;
            }
            
            h4{
                text-align: left;
            }
            tr, td{
                text-align: center;
                font-size: 15pt;
            }
            table{
                border: 2px solid;
                width: 100%;
            }
            th, td{
                background-color: antiquewhite;
            }
            .details-tab{
                padding-left: 20px; 
                padding-top: 10px; 
                padding-bottom: 10px; 
                background-color: #4D2A19;
                color: white;
                border-style: outset;
                border-radius: 15px;
                    
            }
            .container{
                padding: 10px; 
                background-color: #E5DBB3; 
                margin: 15px;
                border-style: outset;
                border-radius: 15px;
                
            }
            
            pre{
               font-weight: bold;
            }
            
            .display-status{
                padding: 3px 10px 3px 10px; 
                margin-bottom: 5px; 
                float: right; 
                text-align: center; 
                background-color:#4D2A19; 
                color: white;
                cursor: default;
                border-radius:  5px;
            }
            
            .rate-btn{
                padding-left: 45px; 
                padding-right: 45px; 
                padding-top: 5px; 
                padding-bottom: 5px; 
                margin-bottom: 5px; 
                float: right; 
                text-align: center; 
                border: white; 
                background-color:#2D8647; 
                color: white;
                border-radius:  5px;
                cursor: pointer;
            }
            .rate-btn:hover{
                background-color:#B3E5C2; 
                color: black;
                border-color: black;
                border-style: outset;
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
            }
        </style>
    </head>
    <body>
        <h4><a href="CustomerProfile.jsp" id="back-link" >&#8668;Back</a></h4>
        <h1 style="text-align: center">Order History</h1>
        <%
            int nreply=0;
            int yreply=0;
            if(orderList.size()!=0){
            for (int i = 0; i < orderList.size(); i++) {
            nreply=0;yreply=0;
        %>
        <div class="container">
            <form action="../InsertReviewB" method="post">
            <div  class="details-tab">
                Purchased product: <%= orderList.get(i).getOrderid().getOrderItemsList().get(0).getItemid().getItemname()%><br><br>
                Quantity purchased: <%= orderList.get(i).getOrderid().getOrderItemsList().get(0).getQty()%>
            </div>
            <% DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                        String date = dateFormat.format(orderList.get(i).getOrderid().getOrderdate());

                    %>
                <pre>Order ID: <%= orderList.get(i).getOrderid().getOrderid()%> &#9; &#9; &#9; &#9; &#9; Tracking Number: <%= orderList.get(i).getOrderid().getOrderstatusList().get(0).getTrackingnum()%> &#9; &#9; &#9; &#9; &#9; Order Date: <%= date %> &#9; &#9; &#9; &#9; &#9; &#9; Order Total: <%= String.format("%.2f",orderList.get(i).getOrderid().getPaymentList().get(0).getTotalamount()) %></pre>
            <% for(int a =0;a<rList.size();++a){ %>
                    
                    <% if(rList.get(a).getOrderid().getOrderid() == orderList.get(i).getOrderid().getOrderid()) { %>
                       <% yreply=1; %>
                     <% } %>
            <% } %>
            <% if((orderList.get(i).getOrderid().getOrderstatusList().get(0).getStatus()).equals("Delivered") && yreply==0 ){ %>
                    
                     <input type="submit" value="Rate" class="rate-btn"><br><br>
                    <input type="hidden" value="<%= orderList.get(i).getOrderid().getOrderItemsList().get(0).getItemid().getItemid() %>" name="itemid">
                    <input type="hidden" value="<%= orderList.get(i).getOrderid().getOrderid() %>" name="orderid">
                    <input type="hidden" value="<%= cusername %>" name="custusername">
                   
                <% } %>
                <input type="text" size="10" id="order_status" name="order_status" value="<%= orderList.get(i).getOrderid().getOrderstatusList().get(0).getStatus() %>" class="display-status" readonly><br>
                
            </form>
        </div>
        <% } } else { %>
            
        <h3 style="text-align: center">You have not order any item yet. Visit <a href="../ListItem" style="color: black; font-size: 16pt">Item</a> to purchase for your first order now. </h3>
           
        <% } %>
        
    </body>
</html>
<% } %>