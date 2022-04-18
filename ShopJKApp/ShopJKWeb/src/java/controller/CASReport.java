/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import model.Customer;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

/**
 *
 * @author jasontieo
 */
public class CASReport extends HttpServlet {

    @PersistenceContext
    private EntityManager em;

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

        try {
            System.out.println("I'm in");
            HttpSession session = request.getSession();
            Query query = em.createNamedQuery("Customer.findAll"); //find for all item
            List<Customer> sList = query.getResultList();

            
                    
            // just in case if the quantity sold is null
            System.out.println("Try to get qty");
            int active = 0;
            int delete = 0;
            int total = 0;
            float dActive;
            float dDelete;
            for (int i = 0; i < sList.size(); ++i) {
                if (sList.get(i).getStatus() .equals ("A")) {
                    active++;
                }
                else if (sList.get(i).getStatus() .equals ("D")) {
                    delete++;
                }
            }
            total = active + delete;
            dActive = (float)active/(float)total * 360.0f;
            dDelete = (float)delete/(float)total * 360.0f;

                session.setAttribute("sList", sList);
                session.setAttribute("active", active);
                session.setAttribute("delete", delete);
                session.setAttribute("dActive", dActive);
                session.setAttribute("dDelete", dDelete);
                session.setAttribute("total", total);
                System.out.println("OK");
                response.sendRedirect("secureAdmin/CASReport.jsp");
            }catch (Exception ex) {
        }

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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>
    }
