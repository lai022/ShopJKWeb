<%-- 
    Document   : CustRatingAndComm
    Created on : 2022 Mar 16, 11:37:16
    Author     : Shin Mei
--%>
<% if (session.getAttribute("login") == null || session.getAttribute("login").equals("")) {
    response.sendRedirect("../index.html");
   } else {  %>
<%@page import="java.time.LocalDate"%>
<%@page import="model.*, java.util.*" %>

<% Customer customer = (Customer) session.getAttribute("customer");%>
<% Item item = (Item) session.getAttribute("item");%>
<% Orderr order= (Orderr) session.getAttribute("order");%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>


<!DOCTYPE html>
<html>
    <head>
        <title>Comments and Rating</title>
        <style>
            .hide {
                display: none;
            }

            .clear {
                float: none;
                clear: both;
            }

            .rating {
                width: 170px;
                unicode-bidi: bidi-override;
                direction: rtl;
                text-align: center;
                position: relative;
            }

            .rating > label {
                float: right;
                display: inline;
                padding: 0;
                margin: 0;
                position: relative;
                width: 1.1em;
                cursor: pointer;
                color: #000;
                font-size: 30px;
            }

            .rating > label:hover,
            .rating > label:hover ~ label,
            .rating > input.radio-btn:checked ~ label {
                color: transparent;
            }

            .rating > label:hover:before,
            .rating > label:hover ~ label:before,
            .rating > input.radio-btn:checked ~ label:before,
            .rating > input.radio-btn:checked ~ label:before {
                content: "\2605";
                position: absolute;
                left: 0;
                color: #FFD700;
            }


            #border2 {
                border-style: inset;
                padding: 40px;
                width: 700px;
                background-color: #eaf2fd;
                border-radius: 15px;

            }

            #border1 {
                display: flex;
                justify-content: center;
            }

            #title {
                text-align: center;
            }
            h2{
                font-weight: bold;
            }

            #submitbtn{
                float: right;
                display: inline-block;
                padding: 15px;
                background-color:  lightskyblue;
                border-radius: 15px;

            }
            #submitbtn:hover{
                cursor: pointer;
                background-color: lightsteelblue;
            }
            #back-link{
                padding:10px;
                text-decoration: none;
                color:black;
            }
            #back-link:hover{
                cursor: pointer;
                color:#D2797B;
            }
            

            textarea {
                resize: none;
                width: 100%;
                height: 100%;
                background-color: #e9eff0;
                resize: none;
            }

            textarea:focus{
                outline: 3px solid lightskyblue;   
            }

        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <a href="../ShowOrderHistory" id="back-link" ><&#8668; Back</a>
        <div><h1 id="title">Comments and Rating for <%= item.getItemname()%></h1></div>
        <div id="border1">

            <div id="border2">
                <h4><%=customer.getCustusername()%></h4>


                <form action="../InsertReviewA" method="POST">
                    <div>
                        <div class="rating">
                            <input id="5star" name="rating" type="radio" value="5" class="radio-btn hide" required />
                            <label for="5star" title="5star">✰</label>
                            <input id="4star" name="rating" type="radio" value="4" class="radio-btn hide" />
                            <label for="4star" title="4star">✰</label>
                            <input id="3star" name="rating" type="radio" value="3" class="radio-btn hide" />
                            <label for="3star" title="3star">✰</label>
                            <input id="2star" name="rating" type="radio" value="2" class="radio-btn hide" />
                            <label for="2star" title="2star">✰</label>
                            <input id="1star" name="rating" type="radio" value="1" class="radio-btn hide" />
                            <label for="1star"title="1star" >✰</label>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <textarea cols="92" name="custcomment" rows="5" maxlength="100" placeholder="Place your comment here ... ..." title="Type here" required></textarea>
                    <%DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-uuuu");
                            LocalDate localDate = LocalDate.now();%>
                    <input type="hidden" id="reviewdate" name="reviewdate" value="<%=dtf.format(localDate)%>"  >
                    <input type="hidden" id="custusername" name="custusername" value="<%=customer.getCustusername()%>"  >
                    <input type="hidden" id="itemid" name="itemid" value="<%=item.getItemid()%>"  >
                    <input type="hidden" id="orderid" name="orderid" value="<%= order.getOrderid() %>"  >
                    <br><br>
                    <input id="submitbtn" type="submit" value="Post">
                </form>
            </div>
        </div>
    </body>
</html>
<% } %>