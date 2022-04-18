<%-- 
    Document   : UpdateAdminProfile
    Created on : Mar 29, 2022, 12:16:12 PM
    Author     : Siu Kit
--%>
<% if (session.getAttribute("login3") == null || session.getAttribute("login3").equals("")) {
    response.sendRedirect("AdminLogin.html");
   } else {  %>
<%@page import="javax.crypto.spec.SecretKeySpec"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="java.security.spec.KeySpec"%>
<%@page import="javax.crypto.spec.PBEKeySpec"%>
<%@page import="javax.crypto.SecretKeyFactory"%>
<%@page import="javax.crypto.spec.IvParameterSpec"%>
<%@page import="javax.crypto.Cipher"%>
<%@page import="javax.transaction.UserTransaction"%>
<%@page import="javax.annotation.Resource"%>
<%@page import="javax.persistence.PersistenceContext"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, model.*"%>
<jsp:useBean id="login3" scope="session" class="model.Manager" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Profile information</title>
        <style>
            input[type=submit], #cancel-btn {
                width: 100%;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type=submit]{
                background-color: #4CAF50;
                color: white;
            }
            #cancel-btn{
                background-color: #fc7f03;
                color: white;
            }


            input[type=submit]:hover {
                background-color: #45a049;
                color: black;
            }

            #cancel-btn:hover {
                background-color: #cc6600;
                color: black;
            }

            table{
                font-family: Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 50%;

            }
            th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: center;
                background-color: #125b80;
                color: white;
            }

            td{
                padding: 15px 20px 15px 20px;
                text-align: center;
                background-color: #f7fdff;
            }

            input[type=text],input[type=tel],input[type=email],input[type=password]{
                width: 100%;
                height: 100%;
                border-color: white;
            }


            textarea {
                resize: none;
                width: 100%;
                height: 100%;

            }

            input[type=text]:disabled{
                background-color: white;
            }
            
            input[type=text]:focus,input[type=tel]:focus,input[type=email]:focus,input[type=password]:focus,textarea:focus{
                outline: 3px solid lightskyblue;   
            }
            
            #customer-tab{
                background-color: lightcoral;
                color:black;

            }

            #staff-tab{
                background-color: lightslategrey;
                color:black;
                text-decoration: none;
            }
            
            #customer-tab:hover,#staff-tab:hover{
                background-color: black;
                cursor: pointer;
                color:white;
            }
            
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            
            
            .data-field{
                background-color: #e9eff0;
            }
        </style>
    </head>
    <body>
        <h1 align="center">Profile Information</h1>
        <% DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
           String date = dateFormat.format(login3.getBirthdate());
               
        %>
        
        <%!
            private static final String SECRET_KEY = "key";
            private static final String SALT = "salt";
            @PersistenceContext() EntityManager em;
            @Resource UserTransaction utx;
            static Cipher cipher;
            public static String decrypt(String strToDecrypt) {
                try {
                    byte[] iv = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
                    IvParameterSpec ivspec = new IvParameterSpec(iv);

                    SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
                    KeySpec spec = new PBEKeySpec(SECRET_KEY.toCharArray(), SALT.getBytes(), 65536, 128);
                    SecretKey tmp = factory.generateSecret(spec);
                    SecretKeySpec secretKey = new SecretKeySpec(tmp.getEncoded(), "AES");

                    Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
                    cipher.init(Cipher.DECRYPT_MODE, secretKey, ivspec);
                    return new String(cipher.doFinal(Base64.getDecoder().decode(strToDecrypt)));
                } catch (Exception e) {
                    System.out.println("Error while decrypting: " + e.toString());
                }
                return null;
              }
        
        %>
        
        <%
            String decrypted = decrypt(login3.getPassword());
            
        %>
        <form method="POST" action="../ProcessAdminProfile">
            <table border="1" style="margin-top: 20px;" align="center">
            <thead>
                <tr>
                    <th colspan="2" style="align:center;">Admin Profile</th>                    
                </tr>
            </thead>
            
            <tbody>
                <tr>
                    <td>Username:</td>
                    <td class="data-field"><input type="text" name="updateAdminUserName" value="<%= login3.getManagerusername() %>" readonly></td> 
                </tr>
                
                <tr>
                    <td>Customer Name:</td>
                    <td class="data-field"><input type="text" name="updateAdminName" value="<%= login3.getManagername() %>" required></td> 
                </tr>
                 
                <tr>
                    <td>D.O.B</td>
                    <td class="data-field"><input type="text" name="updateAdminDOB" value="<%= date %>" required></td> 
                </tr>
                
                <tr>
                    <td>Phone Number</td>
                    <td class="data-field"><input type="tel" name="updateAdminPhoneNo" value="<%= login3.getTelno() %>" required></td> 
                </tr>
                
                <tr>
                    <td>Email</td>
                    <td class="data-field"><input type="email" name="updateAdminEmail" value="<%= login3.getEmail() %>" required></td> 
                </tr>
                
                <tr>
                    <td>Address</td>
                    <td class="data-field"><textarea name="updateAdminAddress" rows="5" cols="20" required><%= login3.getAddress()%></textarea></td>
                </tr>
                
                <% if(!login3.getStatus().equals("A")){ %>
                <tr>
                    <td>Status: </td>
                    <td class="data-field">
                        <select name="updateAdminStatus" style="width: 100%;height: 100%;border-color: white;">
                            <option value="A">Active</option>
                            <option value="D" selected>Disable</option>
                        </select>
                    </td>
                </tr>
                <%} else { %>
                <input type="hidden" name="updateAdminStatus" value="A">
                
                <%} %>
                
                 <tr>
                    <td>Password:</td>
                    <td class="data-field"><input type="password" name="updateAdminPwd" value="<%= decrypted %>" required></td>
                </tr>

                <tr>
                    <td>Confirm Password:</td>
                    <td class="data-field"><input type="password" name="updateAdminConfirmPwd" value="<%= decrypted%>" required></td>
                </tr>
                
                <tr>
                    <td><input type="submit" value="Update" style="width:100%"></td>
                    <td ><button type="button" id="cancel-btn" onclick="location.href='MaintainAdmin.jsp' " style="width: 100%; text-decoration:none; color:black">Cancel</button></td>                    
                </tr>
                
                
            </tbody>
            <input type="hidden" name="updateAdminStatus" value="A">
        </form>
    </body>
</html>
<% } %>