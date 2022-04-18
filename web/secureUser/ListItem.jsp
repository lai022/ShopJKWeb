<%-- 
    Document   : ListItem
    Created on : 28 Mar 2022, 3:37:59 pm
    Author     : josephineho
--%>
<%@page import="java.util.List"%>
<%@page import="model.*"%>
<% if (session.getAttribute("login") == null || session.getAttribute("login").equals("")) {
        response.sendRedirect("../index.html");
%> 
<% } else {  %>
<!-- retrieve session object, itemList -->
<%
    List<Item> itemList = (List) session.getAttribute("itemList");
    List<Category> categoryList = (List) session.getAttribute("categoryList");

%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Product Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <%@ include file="headers.jsp" %> 
        <style>

            input[type=text] {
                width: 50%;
                height: 100%;
                background-color: #e9eff0;
                border-color: white;
            }

            input[type=text]:focus{
                outline: 3px solid lightskyblue;   
            }

            #search{
                margin-left: 370px !important;
                font-size: 14pt !important;
            }

            #search-btn{
                padding:0px 5px;
                background-color: #7bdcb5;
                border-radius: 10px;
            }

            #search-btn:hover{
                cursor: pointer;
                background-color:#00d084;
            }
            #itemD{
                width: 60% !important;
            }
            .clearfix {
                overflow: auto !important;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid p-5 mx-auto bg-light text-dark text-center ">
            <h1>View All Items </h1>
        </div>

        <!-- Display items -->
        <div class="container mx-auto text-body">
            <div class="row" id="search">
                <form action="../SearchItem" method="post">
                    <div class="input-group mb-3">
                        <input type="text" name="itemname" style="padding: 5px !important">
                        &nbsp;&nbsp;
                        <input type="submit" value="Search Item" id="search-btn" style="padding: 5px !important">
                    </div>
                </form>
            </div>
            <% if (itemList.size() == 0) { %>
            <h4 style="text-align: center">No such Item found. Please insert product name to find for an item.</h4>
            <% } else {%>

            <div class="row container-fluid p-5">
                <% for (int i = 0; i < itemList.size(); i++) {
                        if (itemList.get(i).getStatus().equals("A")) {
                %>
                <div class="card bg-light col-4 mx-auto p-2 my-4" style="width:250px !important" id="itemD">
                    <form action="../ItemDetails" method="post" >
                        <img class="card-img-top img-responsive mx-auto" src="../images/<%= itemList.get(i).getItemimg()%>" alt="Card image">
                        <div class="card-body">
                            <p class="mx-auto d-block"><%= itemList.get(i).getItemid()%></p>
                            <p class="mx-auto"><%= itemList.get(i).getItemname()%></p>
                            <input class="mx-auto" type="hidden" name="itemid" value="<%= itemList.get(i).getItemid()%>">
                            <input class="mx-auto btn btn-outline-info" type="submit" value="View Details" >
                        </div>
                    </form>
                </div>
                <% }
                    }%>
            </div>


        </div>
        <% }%>
    </div>
</body>
</html>
<% }%>