<%-- 
    Document   : StaffViewReview
    Created on : 2022 Mar 24, 13:36:36
    Author     : Shin Mei
--%>
<% if (session.getAttribute("login2") == null || session.getAttribute("login2").equals("")) {
    response.sendRedirect("StaffLogin.html");
   } else {  %>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.text.SimpleDateFormat"%>

<%@page import="model.*, java.util.*" %>
<% Review review = (Review) session.getAttribute("review");%>
<% List<StaffReview> rvList = (List<StaffReview>) session.getAttribute("rvList");%>


<!DOCTYPE html>
<html>
    <head>
        <title>Comments and Rating</title>
        <style>
            textarea {
                resize: none;
            }

            #border2 {
                border-style: inset;
                padding: 35px;
                width: 700px;
                background-color:#D9E3F0;
                border-radius: 15px;
            }

            #border1 {
                display: flex;
                justify-content: center;
            }

            #title {
                text-align: center;
                font-weight: bold;
            }
            h2{
                font-weight: bold;
            }

            #submitbtn{
                float: right;
                display: inline-block;
                padding: 15px;
                background-color:  lightskyblue;

            }
            #submitbtn:hover{
                cursor: pointer;
                background-color: lightsteelblue;
            }

            #staff-box{
                border-style: inset;
                background-color: #DFDFDF;
                border-radius: 15px;
                padding:10px 0px;
            }

            #back-link{
                padding:10px;
                color: black;
                text-decoration: none;
            }
            #back-link:hover{
                cursor: pointer;
                color:#D2797B;
            }

        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <a href="../ReviewRecC" id="back-link">&#8668; Back</a>
        <div><h1 id="title">Comments and Rating for <%= review.getItemid().getItemname()%></h1></div>
        <div id="border1">

            <div id="border2">
                <h4><%= review.getCustusername().getCustusername()%></h4>
                <% SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");%>
                <h4><%= DATE_FORMAT.format(review.getReviewdate())%></h4>

                <div>
                    <div class="ratingDisplay">
                        <%  for (int i = 0; i < review.getRating(); ++i) {  %>
                        <img src="star.png" width="35px" height="35px" alt="alt"/>
                        <% }%>

                    </div>
                </div>
                <textarea cols="90" name="commentText" rows="5" maxlength="100" placeholder="<%= review.getCustcomment()%>" disabled></textarea>
                <br><br>

                <h4>Staff Reply</h4>
                <div id="staff-box">
                    <% for (int i = 0; i < rvList.size(); ++i) {%> 
                    <div class="staff-box">
                        <h4><%= DATE_FORMAT.format(rvList.get(i).getSreviewdate())%></h4>
                        <textarea cols="90" name="commentText" rows="5" maxlength="100" placeholder="<%= rvList.get(i).getScomment()%>" disabled></textarea>
                    </div>
                    <% }%>
                </div>
            </div>

        </div>

    </body>
</html>
<% } %>