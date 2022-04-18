<%-- 
    Document   : ViewItem
    Created on : 30 Mar 2022, 8:00:17 pm
    Author     : josephineho
--%>
<% if (session.getAttribute("login2") == null || session.getAttribute("login2").equals("")) {
        response.sendRedirect("StaffLogin.html");
    } else {  %>
<%@page import="java.util.List"%>
<%@page import="model.*"%>

<!-- retrieve session object, itemList -->
<%
    List<Item> itemList = (List) session.getAttribute("itemList");
    List<Category> categoryList = (List) session.getAttribute("categoryList");
%>
<html>
    <head>
        <title>Item List</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <%@ include file="headers2.jsp" %> 
    </head>
    <body>
        <style>

            th {
                cursor:pointer;
                position: -webkit-sticky; /* Safari */
                position: sticky;
                top: 70;
            }
        </style>
        <div class=" container-fluid text-dark text-center p-2 m-5 ">
            <h1>View All Items </h1>
        </div>

        <div class="container-fluid px-5">
            <a href="../AddItemB"><button type="button" class="btn btn-outline-primary p-2 mx-auto" value="AddItem">Add New Item</button></a>

        </div>
        <!-- Display items -->
        <div class="container-fluid p-5 mx-auto">
            <table class="table table-hover table-responsive container-fluid text-center text-dark align-middle" id="itemTable" width="100">
                <tr class="table-primary p-2">
                    <th onclick="sortTable(0)">Item ID <i class="fa fa-sort"></th>
                    <th onclick="sortTable(1)">Item Name <i class="fa fa-sort"></th>
                    <th onclick="sortTable(2)">Item Description <i class="fa fa-sort"></tH>
                    <th onclick="sortTable(3)">Item Price (RM) <i class="fa fa-sort"></th>
                    <th onclick="sortTable(4)">Quantity in Stock <i class="fa fa-sort"></th>
                    <th onclick="sortTable(5)">Quantity Sold <i class="fa fa-sort"></th>
                    <th onclick="sortTable(6)">Category <i class="fa fa-sort"></th>
                    <th onclick="sortTable(7)">Status <i class="fa fa-sort"></th>
                    <th>Action</th>
                </tr>
                <% for (Item item : itemList) {%>
                <tr>
                    <td><%= item.getItemid()%></td>
                    <td><%= item.getItemname()%></td>
                    <td><%= item.getItemdesc()%> </td>
                    <td><%= String.format("%.2f", item.getItemprice())%></td>
                    <td><%= item.getQtyinstock()%></td>
                    <td><%= item.getQtysold()%></td>
                    <td><%= item.getCategoryid().getCategorytype()%></td>
                    <td><%= item.getStatus()%></td>
                    <td>
                        <% if ((item.getStatus()).equals("A")) {%>
                        <form action="../UpdateItemB" >
                            <input type="hidden" name="itemid" value="<%= item.getItemid()%>">
                            <input type="submit" class="btn btn-outline-success p-2 m-2" value="Update">
                        </form>
                        <form action="../DeleteItemB">
                            <input type="hidden" name="itemid" value="<%= item.getItemid()%>">
                            <input type="submit" class="btn btn-outline-danger p-2 m-2" value="Delete">
                        </form>
                        <%} else {%>
                        <form action="../UpdateItemB" >
                            <input type="hidden" name="itemid" value="<%= item.getItemid()%>">
                            <input type="submit" class="btn btn-outline-success p-2 m-2" value="Update">
                        </form>
                        <p>Item Deleted!</p>
                        <%}%>
                    </td>
                </tr>
                <% }%>
            </table>

        </div>

        <script>
            function sortTable(n) {
                var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
                table = document.getElementById("itemTable");
                switching = true;
                //Set the sorting direction to ascending:
                dir = "asc";
                /*Make a loop that will continue until
                 no switching has been done:*/
                while (switching) {
                    //start by saying: no switching is done:
                    switching = false;
                    rows = table.rows;
                    /*Loop through all table rows (except the
                     first, which contains table headers):*/
                    for (i = 1; i < (rows.length - 1); i++) {
                        //start by saying there should be no switching:
                        shouldSwitch = false;
                        /*Get the two elements you want to compare,
                         one from current row and one from the next:*/
                        x = rows[i].getElementsByTagName("TD")[n];
                        y = rows[i + 1].getElementsByTagName("TD")[n];
                        /*check if the two rows should switch place,
                         based on the direction, asc or desc:*/
                        if (dir == "asc") {
                            if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                                //if so, mark as a switch and break the loop:
                                shouldSwitch = true;
                                break;
                            }
                        } else if (dir == "desc") {
                            if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                                //if so, mark as a switch and break the loop:
                                shouldSwitch = true;
                                break;
                            }
                        }
                    }
                    if (shouldSwitch) {
                        /*If a switch has been marked, make the switch
                         and mark that a switch has been done:*/
                        rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                        switching = true;
                        //Each time a switch is done, increase this count by 1:
                        switchcount++;
                    } else {
                        /*If no switching has been done AND the direction is "asc",
                         set the direction to "desc" and run the while loop again.*/
                        if (switchcount == 0 && dir == "asc") {
                            dir = "desc";
                            switching = true;
                        }
                    }
                }
            }
        </script>
    </body>
</html>
<% }%>