<%-- 
    Document   : MonSales
    Created on : 5 Apr 2022, 1:03:16 pm
    Author     : jasontieo
--%>
<% if (session.getAttribute("login3") == null || session.getAttribute("login3").equals("")) {
    response.sendRedirect("AdminLogin.html");
   } else {  %>
<%@page import="model.Customer"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Item, java.util.*" %>
<% List<Customer> sList = (List<Customer>) session.getAttribute("sList");%>
<%int active = ((Integer) session.getAttribute("active")).intValue();%>
<%int delete = ((Integer) session.getAttribute("delete")).intValue();%>
<%int total = ((Integer) session.getAttribute("total")).intValue();%>
<%float dActive = ((Float) session.getAttribute("dActive")).floatValue();%>
<%float dDelete = ((Float) session.getAttribute("dDelete")).floatValue();%>
<% DecimalFormat decimalFormatter = new DecimalFormat("0.00");%>

<!DOCTYPE html>
<html>
    <head>
        <script src="https://www.kryogenix.org/code/browser/sorttable/sorttable.js"></script>
        <style>
            #pieInfo {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
            }

            #my-pie-chart-container {
                display: flex;
                align-items: center;
            }

            .piechart {
                margin-top: 550px;
                display: block;
                position: absolute;
                width: 400px;
                height: 400px;
                border-radius: 50%;
                background-image: conic-gradient(
                    lightblue <%=dActive%>deg,
                    orange 0 <%=dDelete%>deg);
            }

            .piechart {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            #legenda {
                margin-top: 20px;
                margin-left: 20px;
                background-color: white;
                padding: 5px;
            }

            .entry {
                display: flex;
                align-items: center;
            }

            .entry-color {
                height: 10px;
                width: 10px;
            }

            .entry-text {
                margin-left: 5px;
            }

            #color-lightblue {
                background-color: lightblue;
            }

            #color-orange {
                background-color: orange;
            }
        </style>
        <%@ include file="headers3.jsp" %>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Account Summary Report</title>
    </head>
    <body>
        <h1 style="text-align:center;margin-top: 3%;">Customer Account Summary Report</h1>
        <div id="pieInfo">
            <div id="my-pie-chart-container"></div>
            <div class="piechart"></div>

            <div id="legenda">
                <div class="entry">
                    <div id="color-lightblue" class="entry-color"></div>
                    <div class="entry-text">Active Accounts-<%=active%></div>
                </div>
                <div class="entry">
                    <div id="color-orange" class="entry-color"></div>
                    <div class="entry-text">Delete Accounts-<%=delete%></div>
                </div><br>
                Total Account Created = <%=total%>
            </div>
        </div>
    </body>
</html>
<% } %>