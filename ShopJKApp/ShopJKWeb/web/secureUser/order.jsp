<%-- 
    Document   : order
    Created on : Mar 24, 2022, 7:20:38 PM
    Author     : Ariana
--%>
<% if (session.getAttribute("login") == null || session.getAttribute("login").equals("")) {
    response.sendRedirect("../index.html");
   } else {  %>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Orderr"%>
<%@page import="model.Item"%>
<%
    String cusername = (String) session.getAttribute("cusername");
    List<Item> selectedList = (List) session.getAttribute("selectedItem");
    System.out.println("Print username at order.jsp: " + cusername);
%>
<% DecimalFormat decimalFormatter = new DecimalFormat("0.00");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order</title>
        <style>
            h4{
                text-align: left;
            }
            tr, td{
                padding: 10px;
                text-align: center;
                font-size: 15pt;
            }
            table{
                margin-top: 200px;
                border: 2px solid whitesmoke;
                width: 100%;
            }
            th, td{
                background-color: antiquewhite;
            }
            .Receiver{
                margin-top: 20px;
                padding: 10px;
                float: left;
                padding-left: 20px;
                background-color: #fae0c5;
                margin-bottom: 25px;
                border-radius: 30px;
                border: 2px solid whitesmoke;
            }
            #cancel_btn:hover{
                background-color:lightgray; 
                color: black;
                border-color: black;
                border-style: outset;
            }
            #cancel_btn{
                float:left; 
                margin-left: 530px; 
                padding: 10px; 
                font-size: 15pt; 
                border-radius: 20px; 
                background-color: #facbcb
            }
            #btn{
                float:right; 
                margin-right:330px; 
                padding: 10px; 
                font-size: 15pt; 
                border-radius: 20px; 
                background-color: #d4fdc7
            }
            btn:hover{
                background-color:lightgray; 
                color: black;
                border-color: black;
                border-style: outset;
            }
        </style>
    </head>
    <body>
        <h1 style="text-align:center;margin-top: 3%;">Order</h1>
        <form action="../InsertOrderList" method="post">
            <div>
                <div class="Receiver">
                    Receiver Name: <input type="text" name="rname" size="80" 
                                          style="margin-left: 70px; margin-bottom: 5px; background-color: #ebd3bc; 
                                          border: #d5b392 3px solid; font-size: 16pt; border-radius: 10px" required><br>
                    Receiver Contact Number: <input type="tel" size="80" name="rphoneno" 
                                                    style="margin-left: 1px; margin-bottom: 5px; background-color: #ebd3bc;
                                                    border: #d5b392 3px solid; font-size: 16pt; border-radius: 10px" required><br>
                    Receiver Address: <input type="text" size="80" name="raddress" 
                                             style=" margin-left:56px; margin-bottom: 5px; background-color: #ebd3bc;
                                             border: #d5b392 3px solid; font-size: 16pt; border-radius: 10px" required><br>
                </div>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>Item Category</th>
                        <th>Item Name</th>
                        <th>Price Per Unit(RM)</th>
                        <th>Quantity</th>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%= selectedList.get(0).getCategoryid().getCategorytype()%></td>
                        <td><%= selectedList.get(0).getItemname()%></td>
                        <td><%= String.format("%.2f",selectedList.get(0).getItemprice())%></td>
                        <td><input type="number" name="qty" min="1" max="100" value="1" required></td>
                    </tr>

                </tbody>
            </table>

            <p> 
                <button onclick="history.back()" id="cancel_btn">Cancel</button>

                <input type="hidden" name="username" value="<%= cusername%>">
                <input type="hidden" name="itemid" value="<%= selectedList.get(0).getItemid()%>">
                <input type="hidden" name="itemPrice" value="<%= selectedList.get(0).getItemprice()%>">
                <input type="submit" name="payment_btn" value="Payment" id="btn"/>
            </p>

        </form>
    </body>
</html>
<% } %>