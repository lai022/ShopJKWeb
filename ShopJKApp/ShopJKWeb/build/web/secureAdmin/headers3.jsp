<%-- 
    Document   : headers3
    Created on : Apr 7, 2022, 1:06:22 AM
    Author     : Ariana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .header {
                overflow: hidden;
                background-color: #f1f1f1;
                padding: 10px 5px;
                position: -webkit-sticky;
                position: sticky;
                top: 0;
            }

            .header a {
                float: left;
                color: black;
                text-align: center;
                padding: 12px;
                text-decoration: none;
                font-size: 18px; 
                line-height: 25px;
                border-radius: 4px;
            }

            .header a:hover {
                background-color: #ddd;
                color: black;
            }

            .header-right {
                float: right;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <div class="header-right">
                <a href="../ProcessAdminList">Maintain Admin & Staff</a>
                <a href="../CustRecC">Customer Record</a>
                <a href="../SalesRecC">Sales Record</a>
                <a href="../TSalesReport">Total Sales Report</a>
                <a href="../TQSReport">Total Quantity Sales Report</a>
                <a href="../CASReport">Customer Account Summary Report</a>
                <a href="../ProcessAdminLogout">Logout</a>
            </div>
        </div>
    </body>
</html>
