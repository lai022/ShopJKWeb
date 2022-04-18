/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.*;
import java.io.*;
import java.util.List;
import java.util.logging.*;
import javax.annotation.Resource;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import javax.transaction.UserTransaction;

/**
 *
 * @author josephineho
 */
public class UpdateItemA extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Integer itemid = Integer.parseInt(request.getParameter("itemid"));
            System.out.println("Item ID: "+itemid);
            String itemname = request.getParameter("itemname");
            System.out.println("Item Name: "+itemname);
            float itemprice = Float.parseFloat(request.getParameter("itemprice"));
            System.out.println("Item Price: "+itemprice);
            String itemdesc = request.getParameter("itemdesc");
            System.out.println("itemdesc: "+ itemdesc);
            int qtyinstock = Integer.parseInt(request.getParameter("qtyinstock"));
            System.out.println("qtyinstock: "+qtyinstock);
            int qtysold = Integer.parseInt(request.getParameter("qtysold"));
            System.out.println("qtysold: "+qtysold);
            String status = request.getParameter("status");
            System.out.println("status: "+status);
            Integer categoryid = Integer.parseInt(request.getParameter("categoryid"));
            System.out.println("Category id: "+categoryid);

            Category category = em.find(Category.class, categoryid);
            System.out.println("Category: "+category);
            
            String fileName = request.getParameter("itemimg");
            Item item = new Item(itemid,itemname, itemdesc, itemprice, qtyinstock, qtysold, status, fileName, category);

            utx.begin();
            em.merge(item);
            utx.commit();
         
            response.sendRedirect("ViewItem");
        } catch (Exception ex) {
 
            response.sendRedirect("secureStaff/ErrorPage.jsp");
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