<%-- 
    Document   : MonSales
    Created on : 5 Apr 2022, 1:03:16 pm
    Author     : jasontieo
--%>
<% if (session.getAttribute("login3") == null || session.getAttribute("login3").equals("")) {
    response.sendRedirect("AdminLogin.html");
   } else {  %>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Category, java.util.*" %>
<% List<Category> cList = (List<Category>) session.getAttribute("cList");%>
<% float totalSales=(Float) session.getAttribute("name");%>
<% List<Float> cTotal = (List<Float>) session.getAttribute("cTotal");%>
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
        </style>
        <%@ include file="headers3.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Total Sales Report</title>
    </head>
    <body>
        <h1 style="text-align:center;margin-top: 3%;">Total Sales Report</h1>
           
    <table BORDER="1" id="list" class="sortable">
        <thead>
            <tr>
                <th>Category</th>
                <th>Total Sales (RM)</th>
            </tr>
        </thead>
            <% for (int i=0; i < cList.size(); i++) { %>
            <tr>
                <td><%=cList.get(i).getCategorytype() %></td>
                <td><%=String.format("%.2f", cTotal.get(i))%></td>
            </tr>
            <%  } %>
        
        
        <tr>
            <td>Total</td>
            <td> <%=String.format("%.2f", totalSales)%></td>
        </tr>
     </table>
    </body>
</html>
<% } %>