package controller;

import model.Customer;
import java.io.*;
import java.util.List;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class CustRecC extends HttpServlet {
    @PersistenceContext
    private EntityManager em;
    

   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try{
            HttpSession session = request.getSession();
            String status = "A";
            Query query = em.createNamedQuery("Customer.findByStatus", Customer.class).setParameter("status", status);
            List<Customer> custList = query.getResultList();
            session.setAttribute("custList", custList);
            response.sendRedirect("secureAdmin/CustRec.jsp");
            
        }catch (Exception ex){
        }
        
        
        
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
