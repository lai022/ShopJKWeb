<%-- 
    Document   : ItemDetails
    Created on : 5 Apr 2022, 4:58:20 pm
    Author     : josephineho
--%>

<% if (session.getAttribute("login") == null || session.getAttribute("login").equals("")) {
    response.sendRedirect("../index.html");
   } else {  %>
<%@page import="java.util.List"%>
<%@page import="model.*" %>
<%@page import="java.text.DecimalFormat"%>
<% OrderItems orderItemsList = (OrderItems) session.getAttribute("orderItemsList");%>
<% float tax = (Float) session.getAttribute("tax");%>
<% float totalsum = (Float) session.getAttribute("totalsum");%>
<% DecimalFormat decimalFormatter = new DecimalFormat("0.00");%>


<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js%22%3E"></script>
    </head>
    <body>
        <div class="container-fluid p-5 mx-auto bg-light text-dark text-center ">
            <h1>Payment</h1>
        </div>

        <!--<p class="float-start p-5"><a class="page-link text-center container center" href="ListItem">Go Back</a></p> -->
        <div class="container p-5 mx-auto">
            <div class="row ">
                <p > Deliver Address: <%= orderItemsList.getOrderid().getReceiverid().getReceiveraddress()%></p>
            </div>
            <div class="row">  
                <p >Order ID: <%=orderItemsList.getOrderid().getOrderid()%></p>
            </div>
        </div>

        <div class="container text-center p-5 mx-auto">
            <div class="row">
                <table class="container table p-5 mx-auto text-dark" width="80" >
                    <tr>
                        <th>Item Name:</th>
                        <th>Quantity:</th>
                        <th>Price Per Unit(RM):</th>
                        <th>Total Price(RM):</th>
                    </tr>
                    <tr>
                        <td><%= orderItemsList.getItemid().getItemname()%></td>
                        <td><%= orderItemsList.getQty()%></td>
                        <td><%= String.format("%.2f", orderItemsList.getItemid().getItemprice())%></td>
                        <td><%= String.format("%.2f", orderItemsList.getPrice())%></td>
                    </tr>
                </table>
            </div>
            <span class="border-bottom border-4 border-dark"></span>
            <div class="container-fluid text-left p-5 mx-auto">
                <div class="row ">
                    <div class="col-8"></div>
                    <div class="col-4">
                        <h3 class="small text-left">Tax(RM): <%= String.format("%.2f",tax)%></h3> 
                    </div>
                </div>
                <div class="row">
                    <div class="col-8"></div>
                    <div class="col-4">
                        <h3 class="small text-left">Total Amount(RM): <%= String.format("%.2f",totalsum)%></h3> 
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid text-center p-5 mx-auto">
            <div class="row">
                <div class="col">
                    <h3>Payment Method :</h3>
                </div>
            </div>
            <div clas="row mx-auto">
                <form action="../PaymentA" method="post">
                    <div class="col-4">
                        <div class="form-check">
                            <input type="radio" class="form-check-input" id="radio1" name="optradio" value="option1" Checked>Debit/Credit Card
                            <label class="form-check-label" for="radio1"></label>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="form-check">
                            <input type="radio" class="form-check-input" id="radio2" name="optradio" value="option2">Online Banking
                            <label class="form-check-label" for="radio2"></label>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="form-check">
                            <input type="radio" class="form-check-input" id="radio3" name="optradio" value="option3">Cash On Delivery
                            <label class="form-check-label"></label>
                        </div>
                    </div>
                    <input class="mx-auto" type="hidden" name="orderid" value="<%= orderItemsList.getOrderid().getOrderid()%>">
                    <input class="mx-auto" type="hidden" name="subtotal" value="<%= orderItemsList.getPrice()%>">
                    <input class="mx-auto" type="hidden" name="tax" value="<%= tax%>">
                    <input class="mx-auto" type="hidden" name="totalamount" value="<%= totalsum%>">

                    <input type="submit" class="btn btn-primary mt-3" onclick="message()" value="Continue">
                </form>
            </div>
        </div>

        <script>
            function message() {
                alert("Payment successfully!! Thank you for your ordering!!");
            }
        </script>
    </body>
</html>
<% } %>