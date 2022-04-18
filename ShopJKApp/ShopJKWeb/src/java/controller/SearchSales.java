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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author josephineho
 */
public class SearchSales extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String itemname = request.getParameter("itemname");

            Query itemQuery = em.createNamedQuery("Item.findAll");

            List<Item> itemList1 = itemQuery.getResultList();
            List<Item> sList = new ArrayList<Item>();
            Item nulll = new Item();
            String[] strArray = new String[itemList1.size()];
            for (int i = 0; i < itemList1.size(); ++i) {
                strArray[i] = itemList1.get(i).getItemname();
            }
            
            for (int i = 0; i < itemList1.size(); ++i) {
                if(strArray[i].toLowerCase().contains(itemname.toLowerCase())){
                    sList.add(itemList1.get(i));
                }

            }

            session.setAttribute("sList", sList);
            response.sendRedirect("secureAdmin/SalesRec.jsp");

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
