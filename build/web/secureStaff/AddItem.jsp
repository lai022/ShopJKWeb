<%-- 
    Document   : AddItem
    Created on : 26 Mar 2022, 4:44:10 pm
    Author     : josephineho
--%>
<% if (session.getAttribute("login2") == null || session.getAttribute("login2").equals("")) {
    response.sendRedirect("StaffLogin.html");
   } else {  %>
<%@page import="model.*"%>
<%@page import="java.util.*" %>
<%
    List<Category> categoryList = (List) session.getAttribute("categoryList");
%>
<html>
    <head>
        <title>Add New Item</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="container-fluid p-4 mx-auto bg-light text-dark text-center ">
            <h1>Add Item</h1>
        </div>

        <div class="container-fluid px-5 py-3 mx-auto">
            <a  href="../ViewItem"><button type="button" class="btn btn-outline-primary p-2 mx-auto">Previous</button></a>
        </div>

        <div class="container-fluid mx-auto">
            <form  id="additem" action="../AddItemA" method="POST" class="was-validated" enctype="multipart/form-data" width="100">
                <table class="container table-borderless text-left" width="100">
                    <tr>
                        <td>Item image :</td>
                        <td><input type="file" class="form-control" name="itemimg" id="imgimg" required></td>
                    </tr>
                    <tr>
                        <td>Item Name :</td>
                        <td><input type="text" class="form-control" name="itemname" id="itemname" size="50" pattern="/^[A-Za-z\s]{1,50}+$/" placeholder="Characters only.." required></td>
                    </tr>
                    <tr>
                        <td>Item Description :</td>
                        <td><textarea class="form-control" name="itemdesc" id="itemdesc" rows="5"  placeholder="Type the item description here..." required></textarea></td>
                    </tr>
                    <tr>
                        <td>Item Price :</td>
                        <td><input type="number" class="form-control" name="itemprice" id="itemprice" step="0.01" pattern="[0-9]+" placeholder="Numbers only..." required></td>
                    </tr>
                    <tr>
                        <td>Quantity In Stock :</td>
                        <td><input type="number" class="form-control" name="qtyinstock" id="qtyinstock" min="1" max="100" placeholder="Numbers only..." required></td>
                    </tr>
                    <tr>
                        <td>Quantity Sold :</td>
                        <td><input type="text" class="form-control" name="qtysold" id="qtysold" value="0" disabled></td>
                    </tr>
                    <tr>
                        <td>Status :</td>
                        <td><input type="text" class="form-control"  name="status" id="status" value="A" disabled></td>
                    </tr>
                    <tr>
                        <td>Category :</td>
                        <td><select name="categoryid" class="form-select" required>
                                <% for (Category category : categoryList) {%>
                                <option value="<%=category.getCategoryid()%>">
                                    <%=category.getCategorytype()%>
                                    <%}%>
                            </select>
                            <br>
                        </td>
                    </tr>

                </table>
                <div class="row mx-auto p-5">
                    <div class="col-4"></div>
                    <div class="col-4">
                        <input type="submit" value="Add Item" class="btn btn-outline-success">
                    </div>
                    <div class="col-4">
                        <input type="reset" value="Reset" class="btn btn-outline-danger ">
                    </div>
                </div>
            </form>
        </div>


    </body>
</html>
<% } %>
