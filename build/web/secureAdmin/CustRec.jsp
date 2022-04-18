<%-- 
    Document   : CustList
    Created on : 2022 Mar 15, 22:52:44
    Author     : Shin Mei
--%>
<% if (session.getAttribute("login3") == null || session.getAttribute("login3").equals("")) {
    response.sendRedirect("AdminLogin.html");
   } else {  %>

<%@ page import="java.sql.*" %>

<%@page import="model.Customer, java.util.*" %>
<% List<Customer> custList = (List<Customer>) session.getAttribute("custList");%>
<% String deletedCust = (String) session.getAttribute("deletedcust");%>

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

            #addCust-button {
                text-decoration: none;
                text-align: center;
                padding: 20px;
                margin: 0px 20px 0px 0px;
                width:20%;
                background-color: lightgreen;
                color: black;
            }


            input[type=submit]  {
                width: 50%;
                color: white;
                text-align: center;
                background-color: lightcoral;
            }


            input[type=submit]:hover{
                cursor: pointer;

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
        </style>
        <%@ include file="headers3.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Record</title>
    </head>
    <body>
        <h1 style="text-align:center;margin-top: 3%;">Customer Record</h1>
        <hr>

        <% if (deletedCust != null) { %>

        <div><p>One record had been deleted</p></div>

        <% }%>

        <table BORDER="1" id="list" class="sortable">
            <thead>
                <tr >
                    <th>Username</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone No</th>
                    <th class="sorttable_nosort" style="cursor: default">Action</th>
                </tr>
            </thead>
            <%  for (int i = 0; i < custList.size(); ++i) {%>
            <tr>

                <td> <%=custList.get(i).getCustusername()%></td>
                <td> <%=custList.get(i).getCustname()%></td>
                <td> <%=custList.get(i).getEmail()%></td>
                <td> <%=custList.get(i).getTelno()%></td>
                <td>
                    <form action="../DeleteCustRecC" method="post" onsubmit="return window.confirm('Are you sure you want to delete this customer <%=custList.get(i).getCustname()%>\'s record')">
                        <input type="hidden" id="dcustusername" name="dcustusername" value="<%=custList.get(i).getCustname() %>" >
                        <input type="submit" value="Delete"  />
                    </form>

                </td>
            </tr>
            <% }%>
        </table>

    </body>
</html>
<% } %>