<%-- 
    Document   : headers
    Created on : Apr 6, 2022, 11:46:50 PM
    Author     : HP
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
                z-index: 10;
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
            <a href="../ListItem" class="logo"><img src="../logo.png" alt="logo" width="100px" height="50px"/></a>
            <div class="header-right">
                <a href="../ListItem">Item</a>
                <a href="CustomerProfile.jsp">Profile</a>
                <a href="../ProcessCustomerLogout">Logout</a>
            </div>
        </div>
    </body>
</html>
