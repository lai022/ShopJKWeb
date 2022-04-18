<%-- 
    Document   : UpdateItem
    Created on : 30 Mar 2022, 8:00:17 pm
    Author     : josephineho
--%>
<% if (session.getAttribute("login2") == null || session.getAttribute("login2").equals("")) {
    response.sendRedirect("StaffLogin.html");
   } else {  %>
<%@page import="model.*"%>
<%@page import="java.util.*" %>
<%
    Item itemList = (Item) session.getAttribute("itemList");
    List<Category> categoryList = (List<Category>) session.getAttribute("categoryList");
%>
<html>

    <head>
        <title>Update Item - <%=itemList.getItemname()%></title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>

    <body>
        <%
            Item item = (Item) session.getAttribute("itemList");
            if (item != null) {
        %>
        <div class="container-fluid p-5 mx-auto bg-light text-dark text-center">
            <h1>Update Item</h1>
        </div>

        <div class="container-fluid p-5 mx-auto">
            <a  href="../ViewItem"><button type="button" class="btn btn-outline-primary p-2 mx-auto">Previous</button></a>
        </div>

        <div class="container-fluid mx-auto">
            <form action="../UpdateItemA" class="was-validated" enctype="MULTIPART/FORM-DATA"  width="100">
                <table class=" container table-borderless text-left" width="100">
                    <tr>
                       <td>Saved Image :</td>
                       <td><img src="../images/<%=itemList.getItemimg() %>" alt="img" class="img mx-auto d-block" width="150" height="200" ><input type="hidden" name="itemimg" value="<%=itemList.getItemimg() %>"></td>
                    </tr>
                    <tr>
                        <td>Item ID :</td>
                        <td><input type="text" name="itemid" class="form-control"
                                   value="<%=itemList.getItemid()%>" readonly></td>
                    </tr>
                    <tr>
                        <td>Item Name :</td>
                        <td><input type="text" name="itemname" class="form-control"
                                   value="<%=itemList.getItemname()%>" ></td>
                    </tr>
                    <tr>
                        <td>Item Description :</td>
                        <td><input type="text" name="itemdesc" class="form-control"
                                   value="<%=itemList.getItemdesc()%>" ></td>
                    </tr>
                    <tr>
                        <td>Item Price (RM) :</td>
                        <td><input type="number" name="itemprice" class="form-control" step="0.01"
                                   value="<%=String.format("%.2f", itemList.getItemprice())%>" ></td>
                    </tr>
                    <tr>
                        <td>Quantity in stock :</td>
                        <td><input type="number" name="qtyinstock" class="form-control" min="1" max="100"
                                   value="<%= itemList.getQtyinstock()%>" ></td>
                    </tr>
                    <tr>
                        <td>Quantity sold :</td>
                        <td><input type="text" name="qtysold" class="form-control"
                                   value="<%=itemList.getQtysold()%>" readonly></td>
                    </tr>
                    <tr>
                        <td>Status :</td>
                        <td>
                            <select name="status" class="form-select">
                                <option value="A"> 
                                    Available
                                </option>
                                <option value="D"> 
                                    Not Available
                                </option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Category :</td>
                        <td><select name="categoryid"  class="form-select" value="<%=itemList.getCategoryid()%>">
                                <% for (int i = 0; i < categoryList.size(); i++) {
                                        if (categoryList.get(i).getCategoryid().equals(itemList.getCategoryid().getCategoryid())) {
                                %>
                                <option value="<%= categoryList.get(i).getCategoryid()%>" selected> 
                                    <%=categoryList.get(i).getCategorytype()%>
                                </option>
                                <%} else%>
                                <option value="<%= categoryList.get(i).getCategoryid()%>"> 
                                    <%=categoryList.get(i).getCategorytype()%>
                                </option>
                                <%}%>
                            </select>
                        </td>
                    </tr>

                </table>

                <div class="row mx-auto p-5">
                    <div class="col-4"></div>
                    <div class="col-4">
                        <input type="submit" value="Update Item" class="btn btn-outline-success ">
                    </div>
                    <div class="col-4">
                        <input type="reset" value="Reset" class="btn btn-outline-danger ">
                    </div>
                </div>
            </form>
        </div>
        <% }%>

    </body>
</html>
<% } %>