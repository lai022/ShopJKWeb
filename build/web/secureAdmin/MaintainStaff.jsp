<%-- 
    Document   : MaintainStaff
    Created on : Mar 29, 2022, 2:21:28 PM
    Author     : Siu Kit
--%>
<% if (session.getAttribute("login3") == null || session.getAttribute("login3").equals("")) {
    response.sendRedirect("AdminLogin.html");
   } else {  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, model.*"%>
<% List<Staff> sList = (List) session.getAttribute("sList");%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://www.kryogenix.org/code/browser/sorttable/sorttable.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Maintain Staff</title>
        <style>


            th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: center;
                background-color: graytext;
                color: white;
                border: 1px solid #ddd;
            }

            td{
                padding: 8px;
                text-align: center;
                background-color: #f7fdff;
                width: 25%;
                border: 1px solid #ddd;
            }

            table.sortable th:hover{
                cursor:pointer;
            }

            table.sortable th:not(.sorttable_sorted):not(.sorttable_sorted_reverse):not(.sorttable_nosort):after { 
                content: " \25B4\25BE" 
            }

            #table1{
                width:100%;
                margin-top: 20px;
                text-align: center;
                font-weight: bold;
                border-collapse: collapse;

            }

            #table2{
                width:100%;      
                border-collapse: collapse;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #90ee90;
            }

            .btn{
                background-color: #00d084;
                color: black;
                width: 100%;
                padding:10px;
                border-radius: 15px;
            }

            .btn:hover{
                background-color: #45a049;
                color: black;
                cursor:pointer;
            }

            .btn-v{
                background-color: #ebdfdf;
                width: 100%;
                padding:10px;
                border-radius: 15px;
            }

            .btn-v:hover{
                background-color: #faaa92;
                color: black;
                cursor:pointer;
            }

        </style>
        <%@ include file="headers3.jsp" %>
    </head>
    <body>

        <table id="table1" border="1" align="center" >
            <tbody>
                <tr>
                    <td><a href="../ProcessAdminList" style="color:black;text-decoration: none;">Admin</a></td>
                    <td style="background-color:#959b99">Staff</td>                
                </tr>
                <tr>
                    <td colspan="2"><a href="RegisterStaff.html"><button class="btn" style="width:100%">Add Staff</button></a></td>
                </tr>                
            </tbody>            
        </table>

        <table id="table2" border="1" class="sortable" style="text-align:center; margin-bottom:20px" align="center">    
            <thead>
                <tr>
                    <th>No</th>
                    <th>Username</th>
                    <th>Name</th>                    
                    <th class="sorttable_nosort" style="cursor:default">Action</th>
                </tr>            
            </thead>

            <tbody>
                <% for (int i = 0; i < sList.size(); i++) {%>
                <tr>
                    <td><%= (i + 1)%>
                    <td><%= sList.get(i).getStaffusername()%></td>
                    <td><%= sList.get(i).getStaffname()%></td>
                    <td>
                        <form action="../FindStaffProfile" method="POST">
                            <input type="hidden" id="staffusername" name="staffusername" value="<%= sList.get(i).getStaffusername()%>">
                            <input type="submit" class="btn-v" value="View" style="width:100%">                        
                        </form>

                    </td>
                </tr>                

                <% }%>

            </tbody>


        </table>

    </body>
</html>
<% } %>