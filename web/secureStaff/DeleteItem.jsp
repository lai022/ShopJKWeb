<%-- 
    Document   : DeleteItem
    Created on : 30 Mar 2022, 8:00:17 pm
    Author     : josephineho
--%>
<% if (session.getAttribute("login2") == null || session.getAttribute("login2").equals("")) {
    response.sendRedirect("StaffLogin.html");
   } else {  %>
<%@page import="model.*"%>
<%@page import="java.util.*" %>
<%
    Item item = (Item) session.getAttribute("item");
    List<Category> categoryList = (List<Category>) session.getAttribute("categoryList");
%>
<html>
    <head>
        <title>Delete Item</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <%
            if (item != null) {
        %>
        <div class="container-fluid p-4 mx-auto bg-light text-dark text-center ">
            <h1>Delete Item</h1>
        </div>

        <div class="container-fluid px-5 py-3 mx-auto">
            <a  href="../ViewItem"><button type="button" class="btn btn-outline-primary p-2 mx-auto">Previous</button></a>
        </div>

        <div class="container-fluid mx-auto">
            <form action="../DeleteItemA" method="post" width="100">
                <table class="container table-borderless text-left" width="100">
                    <tr>
                        <td>Item Image</td>
                        <td><img src="../images/<%= item.getItemimg() %>" class="img mx-auto d-block" width="150" height="200" alt="logo of shop jk" id="logo"></td>
                    </tr>
                    <tr>
                        <td>Item ID :</td>
                        <td><input type="text" name="itemid" class="form-control"
                                   value="<%=item.getItemid()%>" disabled></td>
                    </tr>
                    <tr>
                        <td>Item Name :</td>
                        <td><input type="text" name="itemname" class="form-control"
                                   value="<%=item.getItemname()%>" disabled></td>
                    </tr>
                    <tr>
                        <td>Item Description :</td>
                        <td><input type="text" name="itemdesc" class="form-control"
                                   value="<%=item.getItemdesc()%>" disabled></td>
                    </tr>
                    <tr>
                        <td>Item Price (RM) :</td>
                        <td><input type="text" name="itemprice" class="form-control"
                                   value="<%=String.format("%.2f", item.getItemprice())%>" disabled></td>
                    </tr>
                    <tr>
                        <td>Quantity in stock :</td>
                        <td><input type="text" name="qtyinstock" class="form-control"
                                   value="<%= item.getQtyinstock()%>" disabled></td>
                    </tr>
                    <tr>
                        <td>Quantity sold :</td>
                        <td><input type="text" name="qtysold" class="form-control"
                                   value="<%=item.getQtysold()%>" disabled></td>
                    </tr>
                    <tr>
                        <td>Status :</td>
                        <td><input type="text" class="form-control"  name="status" value="A" disabled></td>
                    </tr>
                    <tr>
                        <td>Category :</td>
                        <td><input type="text" class="form-control" name="categoryid" value="<%=item.getCategoryid().getCategoryid()%>" disabled> </td>
                    </tr>

                </table>
                <div class="row mx-auto p-5">
                    <div class="col-5"></div>
                    <div class="col-2">
                        <input type="submit" value="Delete Item" class="btn btn-outline-success ">
                    </div>
                    <div class="col-5"></div>
                </div>
            </form>
        </div>
        <% }%>

    </body>
</html>
<% } %>