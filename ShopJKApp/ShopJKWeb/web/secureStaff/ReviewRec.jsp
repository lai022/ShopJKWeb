<%-- 
    Document   : ReviewRec
    Created on : 2022 Mar 15, 22:52:44
    Author     : Shin Mei
--%>
<% if (session.getAttribute("login2") == null || session.getAttribute("login2").equals("")) {
    response.sendRedirect("StaffLogin.html");
   } else {  %>

<%@page import="java.text.SimpleDateFormat"%>

<%@page import="model.Review, java.util.*" %>
<% List<Review> rList = (List<Review>) session.getAttribute("rList");%>

<!DOCTYPE html>
<html>
    <head>
        <title>Review Record</title>
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
                width: 14%;
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
                color: black;
                text-align: center;
                background-color: lightgreen;
            }


            input[type=submit]:hover{
                cursor: pointer;
            }


            input[type=submit]:disabled  {
                width: 50%;
                color: white;
                text-align: center;
                background-color: gray;
            }


            input[type=submit]:disabled:hover{
                cursor: default;
            }

            input[type=submit].tab {
                width: 33.33%;
                padding: 10px;
                background-color: lightblue;
                display: inline-grid;
            }
            #left-tab{
                float: left;
            }
            #right-tab{
                float:right;
            }

            input[type=submit].tab:hover{
                background-color: lightpink;
            }
            #back-link{
                padding:10px;
                color: white;
                text-decoration: none;
            }
            #back-link:hover{
                cursor: pointer;
                color:#D2797B;
            }
        </style>
        <%@ include file="headers2.jsp" %> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <h4><a href="StaffProfile.jsp" id="back-link" >&#8668;Home</a></h4>
        <h1 style="text-align:center;margin-top: 3%;">Review Record</h1>
        <hr>
        <form action="../StaffReplyReviewCB" method="post" >
            <input type="hidden" name="tab" value=""/>
            <input type="hidden" id="reviewid" name="reviewid" value="0" >
            <input type="submit" name="all" value="all review" class="tab" id="left-tab"/>
        </form>
        <form action="../StaffReplyReviewCB" method="post" >
            <input type="hidden" name="tab" value="replied"/>
            <input type="hidden" id="reviewid" name="reviewid" value="0" >
            <input type="submit" name="replied" value="replied review" class="tab" id="left-tab"/>
        </form>
        <form action="../StaffReplyReviewCB" method="post" >
            <input type="hidden" name="tab" value="pending"/>
            <input type="hidden" id="reviewid" name="reviewid" value="0" >
            <input type="submit" name="pending reply" value="pending review" class="tab" id="right-tab"/>
        </form>



        <table BORDER="1" id="list" class="sortable">
            <thead>
                <tr >
                    <th>Item ID</th>
                    <th>Cust. Review ID</th>
                    <th>Cust. Username</th>
                    <th>Review Date</th>
                    <th>Rating</th>
                    <th>Reply Status</th>
                    <th class="sorttable_nosort" style="cursor: default">Action</th>
                </tr>
            </thead>
            <% SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy"); %>
            <%  for (int i = 0; i < rList.size(); ++i) {%>
            <tr>

                <td> <%=rList.get(i).getItemid().getItemid()%></td>
                <td> <%=rList.get(i).getReviewid()%></td>
                <td> <%=rList.get(i).getCustusername().getCustusername()%></td>
                <td> <%= DATE_FORMAT.format(rList.get(i).getReviewdate())%></td>
                <td> <%=rList.get(i).getRating()%></td>
                <% if ( rList.get(i).getStatus() == 1) { %>
                <td>not replied</td>
                <% } else if (rList.get(i).getStatus() == 2 ) { %>
                <td>replied</td>
                <% }%>
                <td>
                    <form action="../StaffReplyReviewCB" method="post" >
                        <input type="hidden" id="reviewid" name="reviewid" value="<%=rList.get(i).getReviewid()%>" >

                        <% if (rList.get(i).getStatus() == 1 ) { %>
                        <input type="hidden" name="tab" value="next"/>
                        <input type="submit" value="Reply"   />
                        <% }  else if (rList.get(i).getStatus() == 2 ) { %>
                        <input type="hidden" name="tab" value="view"/>
                        <input type="submit" value="View" style="background-color: lightskyblue;" />
                        <% } %>
                    </form>

                </td>
            </tr>
            <% }%>
        </table>

    </body>
</html>
<% } %>
