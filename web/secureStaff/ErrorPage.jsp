<%-- 
    Document   : ErrorPage
    Created on : 10 Apr 2022, 11:34:40 pm
    Author     : josephineho
--%>
<% if (session.getAttribute("login2") == null || session.getAttribute("login2").equals("")) {
    response.sendRedirect("StaffLogin.html");
   } else {  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Error</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="container-fluid p-5 mx-auto">
            <button type="button" onclick="history.back()" class="btn btn-outline-primary p-2 mx-auto">Previous</button>
        </div>

        <div class="container-fluid p-5 mx-auto">
            <div class="border border-3 border-warning bg-light">
                <div class="row text-dark text-center  p-5 mx-auto">
                    <h1 class="text-danger">Something Went Wrong!</h1>
                    <h5> Please try to refresh the webpage or reopen the browser. Thank you!</h5>
                </div>
            </div>
        </div>
    </body>
</html>
<% } %>
