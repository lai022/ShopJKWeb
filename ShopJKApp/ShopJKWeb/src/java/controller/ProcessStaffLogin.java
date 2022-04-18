/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import model.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.spec.KeySpec;
import java.util.Base64;
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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author ASUS
 */
@WebServlet(urlPatterns = {"/ProcessStaffLogin2"})
public class ProcessStaffLogin extends HttpServlet {
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
            String staffusername = request.getParameter("staffId");
            String password = request.getParameter("staffPassword");
            HttpSession session = request.getSession();
            String error = "";
            int yes = 0; // 1 = valid active account
            Query query  = em.createNamedQuery("Staff.findAll");
            Staff s = em.find(Staff.class, staffusername);
            List<Staff> sList = query.getResultList();
            
            String decrypted = "";
            String gStatus = "";
         
            
            for(int i=0; i<sList.size(); i++){
                
                if(staffusername.equals(sList.get(i).getStaffusername())){
                    decrypted = ProcessStaffLogin.decrypt(sList.get(i).getPassword()); 
                    gStatus = sList.get(i).getStatus();
                    yes =1;
                    break;
                   
                }
                
                
                else if(sList.size()-1 == i){
                    error += "Wrong username\n";
                    break;  
                }
            }
            
            if(yes == 1){
                if(!password.equals(decrypted)){
                   error += "Incorrect password\n"; 
                }

                if(!gStatus.equals("A")){
                   error += "This account maybe deleted\n"; 
                }
            }
            
            if(error.equals("")){
                session.setAttribute("login2", s);
                response.sendRedirect("secureStaff/StaffProfile.jsp");
            }else{
                session.setAttribute("error", error);
                response.sendRedirect("secureStaff/LoginError2.jsp"); 
            }
                
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }
    
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