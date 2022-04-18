<%-- 
    Document   : orderStatus
    Created on : Mar 24, 2022, 7:21:03 PM
    Author     : Ariana
--%>
<% if (session.getAttribute("login2") == null || session.getAttribute("login2").equals("")) {
    response.sendRedirect("StaffLogin.html");
   } else {  %>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="model.Orderstatus"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Orderstatus> orderStatusList = (List) session.getAttribute("orderStatusList");

    String from = (String) session.getAttribute("from");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Order Status</title>
        <script src="https://www.kryogenix.org/code/browser/sorttable/sorttable.js"></script>
        <style>
            h3{
                text-align:center;
                margin-top: 3%;
            }
            h4{
                text-align: left;
            }
            tr, td{
                padding: 5px;
                text-align: center;
                font-size: 15pt;
                width:25%;
            }
            table{
                border-radius: 10px;
                border: 2px solid whitesmoke;
                width: 100%;
            }
            thead{
                background-color: #99beef;
            }
            tr:nth-child(even) {
                background-color:#99beef;
            }
            
            th{
                background-color: #6699ff;
            }

            tr:nth-child(odd) {
                background-color: #d9e3f0;
            }
            
            tr:hover {
                background-color: #adadad;
            }

            table.sortable th:hover {
                cursor: pointer;
            }

            table.sortable th:not(.sorttable_sorted):not(.sorttable_sorted_reverse):not(.sorttable_nosort):after { 
                content: " \25B4\25BE" 
            }
            table.sortable th:hover {
                cursor: pointer;
            }

            table.sortable th:not(.sorttable_sorted):not(.sorttable_sorted_reverse):not(.sorttable_nosort):after { 
                content: " \25B4\25BE" 
            }

            input[type=text] {
                width: 50%;
                height: 100%;
                background-color: #e9eff0;
                border-color: white;
                font-size: 14pt;
                padding: 5px;
            }

            input[type=text]:focus{
                outline: 3px solid lightskyblue;   
            }
            
            input[type=submit]{
                background-color: transparent;
                color: black;
                border-radius: 5px;
            }
            
            input[type=submit]:hover {
                background-color: grey;
                color: white;
            }

            #search-btn{
                padding:3px 5px;
                background-color: #7bdcb5;
                border-radius: 10px;
                font-size: 14pt;
                padding: 5px;
            }

            #search-btn:hover{
                cursor: pointer;
                background-color:#00d084;
            }

            #center{
                text-align: center;
            }
        </style>
        <%@ include file="headers2.jsp" %> 
    </head>
    <body>
        <h1 style="text-align:center;margin-top: 3%;font-weight: bold;">Customer Order Status</h1><br>
        <form action="../SearchTrackingNum" method="post" id="center">
            <input type="text" name="trackingnum">
            &nbsp;
            <input type="submit" value="Search Tracking Number" id="search-btn">
        </form>
        <br>
        <%
            if(orderStatusList.get(0).getTrackingnum()!=null){
        %>
        <table class="sortable">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Tracking Number</th>
                    <th>Status</th>
                    <th class="sorttable_nosort" >Action</th>
                </tr>
            </thead>
            <tbody>
                <% for (int i = 0; i < orderStatusList.size(); i++) { %>
                <tr>
                    <td><form action="../ShowOrderDetails"><input type="hidden" name="orderid" value="<%= orderStatusList.get(i).getOrderid().getOrderid()%>"><input type="submit" value="<%= orderStatusList.get(i).getOrderid().getOrderid()%>"></form></td>
                    <td><%= orderStatusList.get(i).getTrackingnum()%></td>
                    <td>
                        <form action="../UpdateOrderStatus">
                            <input type="hidden" name="trackingNo" value="<%= orderStatusList.get(i).getTrackingnum()%>"/>
                            <% if((orderStatusList.get(i).getStatus()).equals("Delivered")){ %>
                                <select id="status" name="status" style="padding: 5px; font-size: 14pt; border-radius: 10px; background-color: #a6baf6" disabled>
                                    <option value="To Pack">To Pack</option>
                                <option value="To Ship" >To Ship</option>
                                <option value="Shipped">Shipped</option>
                                <option value="Delivered" selected>Delivered</option>
                                </select>
                                <td><input type="submit" value="Confirm" style="padding: 5px; font-size: 14pt; border-radius: 10px; background-color: transparent; color: grey" disabled></td>
                            <% } else {%>
                            <select id="status" name="status" style="padding: 5px; font-size: 14pt; border-radius: 10px; background-color: #a6baf6">
                                <%
                                    if ((orderStatusList.get(i).getStatus()).equals("To Pack")) {
                                %> 
                                <option value="To Pack" selected>To Pack</option>
                                <option value="To Ship">To Ship</option>
                                <option value="Shipped">Shipped</option>
                                <option value="Delivered">Delivered</option>
                                <%
                                } else if ((orderStatusList.get(i).getStatus()).equals("To Ship")) {
                                %>
                                <option value="To Pack">To Pack</option>
                                <option value="To Ship" selected>To Ship</option>
                                <option value="Shipped">Shipped</option>
                                <option value="Delivered">Delivered</option>
                                <%
                                } else if ((orderStatusList.get(i).getStatus()).equals("Shipped")) {
                                %>
                                <option value="To Pack">To Pack</option>
                                <option value="To Ship" >To Ship</option>
                                <option value="Shipped" selected>Shipped</option>
                                <option value="Delivered">Delivered</option>
                                <%
                                }
                                %>
                            </select>
                            
                            <td><input type="submit" value="Confirm" style="padding: 5px; font-size: 14pt; border-radius: 10px; background-color: #a6baf6"></td>
                        <% } %>
                        </form>
                    </td>
                </tr>
                <% }%>
            </tbody>
        </table>
        <%  } else {
                if (from.equals("S")) {
        %>
        <h2 style="text-align: center">Tracking number not found</h2>
        <% } else { %>
        <h2 style="text-align: center">No Order Found Yet</h2>
        <% }
        }
        %>
    </body>
</html>
<% } %>