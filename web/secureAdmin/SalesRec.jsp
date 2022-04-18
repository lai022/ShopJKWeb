<%-- 
    Document   : SalesRec
    Created on : 2022 Mar 21, 00:37:24
    Author     : Shin Mei
--%>
<% if (session.getAttribute("login3") == null || session.getAttribute("login3").equals("")) {
    response.sendRedirect("AdminLogin.html");
   } else {  %>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Item, java.util.*" %>
<% List<Item> sList = (List<Item>) session.getAttribute("sList");%>
<% DecimalFormat decimalFormatter = new DecimalFormat("0.00"); %>

<!DOCTYPE html>
<html>
    <head>
        <script src="https://www.kryogenix.org/code/browser/sorttable/sorttable.js"></script>
        <style>
            #list {
                font-family: Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            #list td, #list th {
                border: 1px solid #ddd;
                padding: 8px;
                width: 20%;
            }

            #list tr:nth-child(even){
                background-color: #ebdfdf;
            }

            #list tr:hover {
                background-color: #adadad;
            }

            #list th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: graytext;
                color: white;
            }

            table.sortable th:hover {
                cursor: pointer;
            }

            table.sortable th:not(.sorttable_sorted):not(.sorttable_sorted_reverse):not(.sorttable_nosort):after { 
                content: " \25B4\25BE" 
            }


            .custL-flex{
                display: flex;
                flex-direction: row;
                padding: 10px;
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
            
            input[type=text] {
                width: 50%;
                height: 100%;
                background-color: #e9eff0;
                border-color: white;
                font-size: 14pt;
            }
            
            input[type=submit]{
                font-size: 14pt;
            }

            input[type=text]:focus{
                outline: 3px solid lightskyblue;   
            }
            
            #search-btn{
                padding:3px 5px;
                background-color: #7bdcb5;
                border-radius: 10px;
            }
            
            #search-btn:hover{
                cursor: pointer;
                background-color:#00d084;
            }

        </style>
        <%@ include file="headers3.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sales Record</title>
    </head>
    <body>
        <h1 style="text-align:center;margin-top: 3%;font-weight: bold;">Sales Record</h1>
        <hr>
        <form action="../SearchSales" method="post" style="margin-left: 400px">
                <input type="text" name="itemname" >
                <input type="submit" value="Search Item Name" id="search-btn">
        </form>
        <br><br>
        <%
            if(sList.size() == 0){
        %>
        <h2 style="text-align: center">Sales Record not found</h2>
        <% } else { %>
        <table BORDER="1" id="list" class="sortable">
            <thead>
                <tr >
                    <th>Product ID</th>
                    <th>Name</th>
                    <th>Total Sales (RM)</th>
                    <th>Total Quantity Sales</th>
                </tr>
            </thead>

            <%  for (int i = 0; i < sList.size(); ++i) {%>
            <tr>

                <td> <%=sList.get(i).getItemid()%></td>
                <td> <%=sList.get(i).getItemname()%></td>
                <td> <%= String.format("%.2f", sList.get(i).getTotalSales(sList.get(i).getItemprice(), sList.get(i).getQtysold()))%></td>
                <td> <%=sList.get(i).getQtysold()%></td>

            </tr>
            <% }%>
        </table>
        <% } %>
    </body>
</html>
<% } %>