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
import java.io.InputStream;
import java.io.Serializable;
import javax.servlet.annotation.MultipartConfig;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;

@MultipartConfig(location="C:\\Users\\HP\\Documents\\NetBeansProjects\\ShopJKWeb\\web\\images")
/**
 *
 * @author josephineho
 */
public class AddItemA extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            //Integer itemid = Integer.parseInt(request.getParameter("itemid"));
            String itemname = request.getParameter("itemname");
            System.out.println("Item Name: " + itemname);
            String itemdesc = request.getParameter("itemdesc");
            System.out.println("Item Desc" + itemdesc);
            float itemprice = Float.parseFloat(request.getParameter("itemprice"));
            System.out.println("Item Price: " + itemprice);
            int qtyinstock = Integer.parseInt(request.getParameter("qtyinstock"));
            System.out.println("Qty In Stock: " + qtyinstock);
            int qtysold = 0;
            System.out.println("Qty sold: " + qtysold);
            Integer categoryid = Integer.parseInt(request.getParameter("categoryid"));
            System.out.println("Category ID: " + categoryid);
            String status = "A";
            System.out.println("Status: " + status);

            Category category = em.find(Category.class, categoryid);
            System.out.println("Category: " + category);
            
            PrintWriter out = response.getWriter();

            Part part = request.getPart("itemimg");
            String fileName = part.getSubmittedFileName();

            part.write(fileName);

            response.getWriter().print("The image uploaded sucessfully.");
        

        Item item = new Item(itemname, itemdesc, itemprice, qtyinstock, qtysold, status, fileName, category);
        System.out.println("Item: " + item);

        utx.begin();
        em.persist(item);
        utx.commit();

        response.sendRedirect("ViewItem");
    }
    catch (Exception ex

    
        ) {
            
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