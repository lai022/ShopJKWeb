/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.*;
import javax.annotation.Resource;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.transaction.UserTransaction;
import java.io.IOException;

/**
 *
 * @author josephineho
 */
public class PaymentA extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();

            Float subtotal = Float.parseFloat(request.getParameter("subtotal"));
            System.out.println(subtotal);
            Float tax = Float.parseFloat(request.getParameter("tax"));
            System.out.println(tax);
            Float totalamount = Float.parseFloat(request.getParameter("totalamount"));
            System.out.println(totalamount);
            Integer orderid = Integer.parseInt(request.getParameter("orderid"));
            System.out.println(orderid);
            Orderr orderr = em.find(Orderr.class, orderid);
            System.out.println(orderr);
            Payment payment = new Payment(subtotal, tax, totalamount, orderr);

            utx.begin();
            em.persist(payment);
            utx.commit();

            response.sendRedirect("ListItem");

        } catch (Exception ex) {

        }

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
