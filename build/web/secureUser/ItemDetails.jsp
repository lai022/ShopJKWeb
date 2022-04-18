<%-- 
    Document   : ItemDetails
    Created on : 5 Apr 2022, 4:58:20 pm
    Author     : josephineho
--%>
<% if (session.getAttribute("login") == null || session.getAttribute("login").equals("")) {
    response.sendRedirect("../index.html");
   } else {  %>

<%@page import="java.util.List"%>
<%@page  import="model.Item" %>
<% Item item = (Item) session.getAttribute("item");%>
<%int comment = ((Integer) session.getAttribute("comment")).intValue();%>
<html>
    <head>
        <title>Product Details - <%=item.getItemname()%></title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <p class="float-start ms-2 mt-2"><a class="page-link text-center container center btn btn-outline-info" href="../ListItem">Go Back</a></p>
        <div class="container-fluid p-5 mx-auto bg-light text-dark text-center ">
            <h1><%=item.getItemname()%></h1>
        </div>
        
        <div class="container-fluid text-center p-5 mx-auto card">
            <img class="mx-auto img-responsive" src="../images/<%= item.getItemimg() %>" width="150" height="200" alt="Item Img">
            <div class="card-body mx-auto">
                <h4 class="card-title"><%= item.getItemname()%></h4>
                <p class="card-text"><%= item.getItemdesc()%></p>
                <h5 class="card-text">RM <%= String.format("%.2f", item.getItemprice())%></h5>
                <p class="card-text">Quantity in stock :&nbsp;<%= item.getQtyinstock()%></p>
                <p class="card-text">Quantity sold :&nbsp;<%= item.getQtysold()%></p>
                <p class="card-text"><%= item.getCategoryid().getCategoryid()%>-<%= item.getCategoryid().getCategorytype()%></p> 
                <% if ((item.getStatus()).equals("A")) {%>
                <p class="card-text"><%= item.getStatus()%>-Available</p>
                <%} else {%>
                <p class="card-text"><%= item.getStatus()%>-Not Available</p>
                <%}%>
                <form action="../ShowOrderList">
                    <input type="hidden" name="itemid" value="<%= item.getItemid()%>">
                    <input type="submit" value="Buy Now" class="btn btn-outline-info">
                </form>
            </div>
        </div>
        <% if (comment == 1) {%>
            <form action="../ReviewScoreBC" class="page-link text-center container center">
                <input type="hidden" name="itemid" value="<%= item.getItemid()%>">
                <input type="submit" class="btn btn-outline-info" value="View Rating and Comment">
            </form>
        <% }%>
    </body>
</html>
<% } %>