<%-- 
    Document   : StaffReplyComment
    Created on : 2022 Mar 16, 12:07:23
    Author     : Shin Mei
--%>
<% if (session.getAttribute("login2") == null || session.getAttribute("login2").equals("")) {
    response.sendRedirect("StaffLogin.html");
   } else {  %>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.text.SimpleDateFormat"%>

<%@page import="model.Review, java.util.*" %>
<% Review review = (Review) session.getAttribute("review");%>
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
                margin-top: 10px;
                background-color:  lightskyblue;
                border-radius: 15px;
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
            textarea{
                resize:none;
                background-color:#e9eff0; 
            }

            textarea:focus{
                outline: 3px solid lightskyblue;   
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
                <textarea cols="92" name="commentText" rows="5" maxlength="100" placeholder="<%= review.getCustcomment()%>" disabled></textarea>
                <br><br>
                <form action="../StaffReplyReviewCA" method="POST">
                    <input type="hidden" id="creviewid" name="creviewid" value="<%= review.getReviewid()%>" readonly="readonly" >
                    <%DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-uuuu");%>
                    <input type="hidden" id="reviewdate" name="reviewdate" value="<%=dtf.format(LocalDate.now())%>" readonly="readonly" >
                    <textarea cols="92" name="mcomment" rows="5" maxlength="100" placeholder="Place your reply here ... ..." title="Type here" required></textarea>
                    <input id="submitbtn" type="submit" value="Post">
                </form>
            </div>

        </div>

    </body>
</html>
<% } %>