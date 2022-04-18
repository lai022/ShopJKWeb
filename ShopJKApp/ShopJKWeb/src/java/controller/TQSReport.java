/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import model.Item;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import model.Category;

/**
 *
 * @author jasontieo
 */
public class TQSReport extends HttpServlet {

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
            Query query = em.createNamedQuery("Item.findAll"); //find for all item
            List<Item> sList = query.getResultList();

            Query query1 = em.createNamedQuery("Category.findAll"); //find for all item
            List<Category> cList = query1.getResultList();
            System.out.println("getCategory:"+cList.size());

            
            // just in case if the quantity sold is null
            System.out.println("Try to get qty");
            for (int i = 0; i < sList.size(); ++i) {
                if (sList.get(i).getQtysold() == null) {
                    sList.get(i).setQtysold(0);
                }
            }
            List<Integer> cQty = new ArrayList<>();
            int qty = 0;
            
            for (int i = 0; i < cList.size(); i++) {
                qty = 0;
                System.out.println("getCategoryTotalSales:"+cList.get(i).getCategorytype());
                
                for (int n = 0; n < sList.size(); n++) {
                    if ((sList.get(n).getCategoryid().getCategoryid()).equals(cList.get(i).getCategoryid())) {
                        qty += sList.get(n).getQtysold();
                        System.out.println(sList.get(n).getQtysold() +" ");
                    }
                    System.out.println("=");
                }
                System.out.println("Category: "+ cList.get(i).getCategorytype());
                System.out.println("Total: " + qty);
                cQty.add(qty);
            }
            System.out.println("cQty: "+cQty.size());

                session.setAttribute("cList", cList);
                session.setAttribute("cQty", cQty);
                System.out.println("OK");
                response.sendRedirect("secureAdmin/TQSReport.jsp");
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
