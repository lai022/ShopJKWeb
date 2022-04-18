/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.sun.tools.javac.util.ArrayUtils;
import model.*;
import java.util.logging.*;
import javax.annotation.Resource;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.transaction.UserTransaction;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author josephineho
 */
public class SearchTrackingNum extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String from = "S";
            String trackingnumo = request.getParameter("trackingnum");
            Integer trackingnum = Integer.parseInt(trackingnumo);

            Query query = em.createNamedQuery("Orderstatus.findAll");
            List<Orderstatus> orderStatusList1 = query.getResultList();

            List<Orderstatus> orderStatusList = new ArrayList<Orderstatus>();
            Orderstatus nulll = new Orderstatus();

            for (int i = 0; i < orderStatusList1.size(); ++i) {
                if (orderStatusList1.get(i).getTrackingnum() == trackingnum) {
                    orderStatusList.add(orderStatusList1.get(i));
                }

            }

            if (orderStatusList.size() == 0) {
                orderStatusList.add(nulll);
            }

            session.setAttribute("from", from);
            session.setAttribute("orderStatusList", orderStatusList);
            response.sendRedirect("secureStaff/orderStatus.jsp");

        } catch (Exception ex) {
            response.sendRedirect("ShowOrderStatusList");
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
