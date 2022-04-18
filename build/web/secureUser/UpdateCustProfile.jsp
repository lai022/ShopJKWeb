<%-- 
    Document   : UpdateCustProfile
    Created on : Mar 25, 2022, 4:02:55 PM
    Author     : Siu Kit
--%>
<% if (session.getAttribute("login") == null || session.getAttribute("login").equals("")) {
    response.sendRedirect("../index.html");
   } else {  %>
<%@page import="javax.transaction.UserTransaction"%>
<%@page import="javax.annotation.Resource"%>
<%@page import="javax.persistence.PersistenceContext"%>
<%@page import="java.security.spec.KeySpec"%>
<%@page import="javax.crypto.spec.SecretKeySpec"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="javax.crypto.spec.PBEKeySpec"%>
<%@page import="javax.crypto.SecretKeyFactory"%>
<%@page import="javax.crypto.spec.IvParameterSpec"%>
<%@page import="javax.crypto.Cipher"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, model.*"%>
<jsp:useBean id="login" scope="session" class="model.Customer" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Profile Information</title>
        <style>
            input[type=submit], #cancel-btn {
                width: 100%;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            #submit-btn{
                background-color: green;
                color: white;
            }
            #cancel-btn{
                background-color: #fc7f03;
                color: white;
            }


            #submit-btn:hover {
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

            input[type=text],input[type=tel],input[type=email],input[type=password],input:read-only {
                width: 100%;
                height: 100%;
                background-color: white;
                border-color: white;
            }


            textarea {
                resize: none;
                width: 100%;
                height: 100%;
                background-color: white;

            }

            input[type=text]:focus,input[type=tel]:focus,input[type=email]:focus,input[type=password]:focus,textarea:focus{
                outline: 3px solid lightskyblue;   
            }
          
            .data-field{
                background-color: #e9eff0;
            }
        </style>
    </head>
    <body>
        <h1 align="center">Update Profile Information</h1>
        <% DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
           String date = dateFormat.format(login.getBirthdate());
               
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
            String decrypted = decrypt(login.getPassword());
            
        %>
        <form method="POST" action="../ProcessCustomerProfile">
            <table border="1" align="center">
            <thead>
                <tr>
                    <th colspan="2" style="align:center">Customer Profile</th>                    
                </tr>
            </thead>
            
            <tbody>
                <tr>
                    <td>Username:</td>
                    <td class="data-field"><input type=text" name="updateCustUserName" value="<%= login.getCustusername() %>" readonly></td> 
                </tr>
                
                <tr>
                    <td>Customer Name:</td>
                    <td class="data-field"><input type="text" name="updateCustName" value="<%= login.getCustname() %>" required></td> 
                </tr>
                 
                <tr>
                    <td>D.O.B</td>
                    <td class="data-field"><input type="text" name="updateDOB" value="<%= date %>" required></td> 
                </tr>
                
                <tr>
                    <td>Phone Number</td>
                    <td class="data-field"><input type="tel" name="updatePhoneNo" value="<%= login.getTelno() %>" required></td> 
                </tr>
                
                <tr>
                    <td>Email</td>
                    <td class="data-field"><input type="email" name="updateEmail" value="<%= login.getEmail() %>" required></td> 
                </tr>
                
                <tr>
                    <td>Address</td>
                    <td class="data-field"><textarea name="updateAddress" rows="6" cols="20" required><%= login.getAddress()%></textarea></td>
                </tr>
                
                 <tr>
                    <td>Password:</td>
                    <td class="data-field"><input type="password" name="updatePwd" value="<%= decrypted%>" required></td>
                </tr>

                <tr>
                    <td>Confirm Password:</td>
                    <td class="data-field"><input type="password" name="updateConfirmPwd" value="<%= decrypted%>" required></td>
                </tr>
                
                <tr>
                    <td><input id="submit-btn" type="submit" value="Update" style="width:100%"></td>
                    <td><button id="cancel-btn" type="button" onclick="location.href='CustomerProfile.jsp' " style="width: 100%; text-decoration:none; color:black">Cancel</button></td>                    
                </tr>
                
                
            </tbody>
            <input type="hidden" name="updateCustStatus" value="A">
        </form>
    </body>
</html>
<% } %>