/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import model.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.security.spec.KeySpec;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author Siu Kit
 */
public class ProcessRegisterStaff extends HttpServlet {
    private static final String SECRET_KEY = "key";
    private static final String SALT = "salt";
    @PersistenceContext() EntityManager em;
    @Resource UserTransaction utx;
    static Cipher cipher;  

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try{
            String username = request.getParameter("newStaffID");
            String name = request.getParameter("newStaffName");
            String dob = request.getParameter("newStaffDOB");
            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dob);
            String phone = request.getParameter("newStaffPhoneNo");
            String email = request.getParameter("newStaffEmail");
            String address = request.getParameter("newStaffAddress");
            String password = request.getParameter("newStaffPwd");
            String confirmPassword = request.getParameter("newConfirmStaffPwd");
            String status = request.getParameter("newStaffStatus");
            String error = "";
            int digit = 0;
            int pwd = 0;
            HttpSession session = request.getSession();
            
             Query query = em.createNamedQuery("Staff.findAll");
            List<Staff> sList = query.getResultList();
            int yes = 0;
            for(int i =0; i < sList.size(); i++){
                if(username.equals(sList.get(i).getStaffusername())){
                    yes = 1; //if = 1 , this customer already exist
                    break;
                }
                    
            }
            
            for(int i = 0; i< name.length();i++){
                char ch = name.charAt(i);
                if(Character.isDigit(ch)){
                    digit = 1; 
                }
            }
            
            if(!password.equals(confirmPassword)){
                pwd = 1; //if =1, password is different
            }
            
           
            if(pwd == 0 && yes == 0 && digit == 0){
                String encrypted = ProcessRegisterStaff.encrypt(password);
                Staff s = new Staff(username, name , date ,phone,address,email, encrypted, status);
                utx.begin();                
                em.persist(s);
                utx.commit();
                session.setAttribute("registrations",s);
                response.sendRedirect("secureAdmin/AddStaff.jsp");
            
            }else{
                if(yes == 1){
                    error += "This username is already created inside the database. Please try another username\n";
                   
                }
                
                if(digit == 1){
                    error += "The name should not have digit inside\n";
                    
                }
                
                if(pwd == 1){
                    error += "The password and confirm password should be the same\n";
                    
                }
                
                session.setAttribute("error", error);
                response.sendRedirect("secureAdmin/AddError2.jsp");
                
            }
            
            
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }
    
    public static String encrypt(String strToEncrypt) {
        try {
            byte[] iv = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            IvParameterSpec ivspec = new IvParameterSpec(iv);

            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
            KeySpec spec = new PBEKeySpec(SECRET_KEY.toCharArray(), SALT.getBytes(), 65536, 128);
            SecretKey tmp = factory.generateSecret(spec);
            SecretKeySpec secretKey = new SecretKeySpec(tmp.getEncoded(), "AES");

            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE, secretKey, ivspec);
            return Base64.getEncoder()
                .encodeToString(cipher.doFinal(strToEncrypt.getBytes(StandardCharsets.UTF_8)));
        } catch (Exception e) {
          System.out.println("Error while encrypting: " + e.toString());
        }
        return null;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}