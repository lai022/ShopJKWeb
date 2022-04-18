<%-- 
    Document   : CustRatingAndCommScore
    Created on : 2022 Mar 16, 21:00:49
    Author     : Shin Mei
--%>
<% if (session.getAttribute("login") == null || session.getAttribute("login").equals("")) {
    response.sendRedirect("../index.html");
   } else {  %>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*, java.util.*" %>
<% Item item = (Item) session.getAttribute("item");%>
<% ArrayList<StaffReview> rvList = (ArrayList<StaffReview>) session.getAttribute("rvList");%>
<% ArrayList<Review> rList = (ArrayList<Review>) session.getAttribute("rList");%>

<% ArrayList<Integer> star = (ArrayList<Integer>) session.getAttribute("star");%>
<% ArrayList<Float> stara = (ArrayList<Float>) session.getAttribute("stara");%>
<!DOCTYPE html>
<html>
    <head>
        <title>Comments and Rating for <%= item.getItemdesc()%></title>
        <style>
            * {
                box-sizing: border-box;
            }


            .heading {
                font-size: 25px;
                margin-right: 25px;
            }

            .fa {
                font-size: 25px;
            }

            .checked {
                color: orange;
            }

            .side {
                float: left;
                width: 10%;
                margin-top:5px;
            }

            .middle {
                margin-top:10px;
                float: left;
                width: 80%;
            }

            .right {
                text-align: left;
            }

            .row:after {
                content: "";
                display: table;
                clear: both;
            }

            .bar-container {
                width: 100%;
                background-color: #f1f1f1;
                text-align: center;
                color: white;
            }

            .bar-5 {width: <%= stara.get(4)%>%; height: 18px; background-color: #40ff00;}
            .bar-4 {width: <%= stara.get(3)%>%; height: 18px; background-color: #bfff00;}
            .bar-3 {width: <%= stara.get(2)%>%; height: 18px; background-color: #ffff00;}
            .bar-2 {width: <%= stara.get(1)%>%; height: 18px; background-color: #ffbf00;}
            .bar-1 {width: <%= stara.get(0)%>%; height: 18px; background-color: #ff8000;}

            /* Responsive layout - make the columns stack on top of each other instead of next to each other */
            @media (max-width: 1000px) {
                .side, .middle {
                    width: 100%;
                }
                .right {
                    display: none;
                }
            }

            #RandCBorder {
                border-style: inset;
                border-radius: 2%;
                padding: 35px;
                width: 1000px;
                background-color:hsla(360, 12%, 63%, 0.30);
                margin: 0 auto; 

                padding: 20px;
            }

            .custRandCbox{
                margin-top:30px;
                height:500px; 
                overflow-y:scroll; 
                overflow-x: hidden;
                width: 100%;
                display:block;
                border-style: inset;
                border-color: black;
            }

            textarea {
                resize: none;

            }
            .dup-comment{
                padding-left: 10px;
                border-style: outset;
                border-color: #9E9B9A;
                border-width: 1px;
                background-color: snow;
                margin: 10px;
            }


            .title-rv{

                display: inline-grid;
                float:left;

            }
            .comment-container {
                padding:10px;
            }
            .commentA {
                width:100%;
                min-height: 80px;
            }

            #back-btn{
                margin-top:15px;
                padding:10px 20px;
                background-color:#FFD700;
                border-radius:15px;
            }

            #back-btn:hover{
                color:white;
                background-color: black;
                cursor:pointer;
            }
        </style>
    </head>
    <body>
        <div ><input type=button value="&#8668;Back" onCLick="history.back()" id="back-btn"></div>
        <div id="RandCBorder">
            <h1 style='text-align:center;'>Ratings and Comment for <%= item.getItemdesc()%></h1>
            <% if (session.getAttribute("average") != null) {
                    float average = ((Float) session.getAttribute("average")).floatValue();
                    DecimalFormat averageFormatter = new DecimalFormat("0.00");
                    average = Float.parseFloat(averageFormatter.format(average));
            %>
            <p style='text-align:center;'><b><%= average%></b> average rating based on <b><%= item.getReviewList().size()%></b> reviews.</p>
                    <% } else {%>
            <p style='text-align:center;'><b>No</b> average rating based on <b><%= item.getReviewList().size()%></b> reviews.</p>
            <% } %>
            <hr>
            <div class="title-rv" style="width:10%;"><p >Rating</p></div>
            <div class="title-rv" style="width:10%;"><p >Total</p></div>
            <div class="title-rv" style="width:80%; text-align: center;"><p>Percentage</p></div>

            <div class="row">
                <% for (int i = 4;
                            i >= 0; --i) {%>
                <div class="side">
                    <div><%=i + 1%> star</div>
                </div>
                <div class="side right">
                    <div>[<%= star.get(i)%>]</div>
                </div>
                <div class="middle">
                    <div class="bar-container">
                        <div class="bar-<%= i + 1%>"></div>
                    </div>
                </div>

                <% }%>
            </div>
            <div class="custRandCbox">
                <% SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy"); %>
                <%  for (int i = 0;
                            i < rList.size();
                            ++i) {%>

                <div class="dup-comment">
                    <p>
                        &nbsp;&nbsp;<%= rList.get(i).getCustusername().getCustusername()%>&nbsp;&nbsp;&nbsp;&nbsp;[
                        <%= DATE_FORMAT.format(rList.get(i).getReviewdate())%> ]
                    </p>

                    <div class="ratingDisplay">
                        <%  for (int a = 0; a < rList.get(i).getRating(); ++a) {  %>
                        <img src="star.png" width="30px" height="30px" alt="alt"/>
                        <% }%>
                    </div>
                    <div class="comment-container"> 
                        <textarea class="commentA" name="commentText"  maxlength="100" placeholder="<%= rList.get(i).getCustcomment()%>" disabled></textarea>
                    </div>

                    <!-- staff review -->
                    <% if (rvList.get(i).getSreviewid() != null) {%>
                    <p style="text-align: right;padding-right: 30px;">[<%= DATE_FORMAT.format(rvList.get(i).getSreviewdate())%>]&nbsp;&nbsp;&nbsp;&nbsp;Staff reply :&nbsp;&nbsp;</p>
                    <div class="comment-container"> 
                        <textarea class="commentA" name="commentText" maxlength="100" placeholder="<%= rvList.get(i).getScomment()%>" disabled></textarea>
                    </div>
                    <% } %>
                </div>
                <% }%>
            </div>
        </div>



    </body>
</html>
<% } %>