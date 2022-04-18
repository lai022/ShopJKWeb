/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author Shin Mei
 */

import model.*;
import java.io.*;
import java.util.List;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

public class InsertReviewA extends HttpServlet {
    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String custusername = request.getParameter("custusername");
            Integer itemid =  Integer.parseInt(request.getParameter("itemid"));
            Integer orderid = Integer.parseInt(request.getParameter("orderid"));
            
            Item item = em.find(Item.class, itemid);
            Orderr order = em.find(Orderr.class, orderid);
            Customer customer =em.find(Customer.class,custusername);
            
            Integer rating = Integer.parseInt(request.getParameter("rating"));
            String custcomment = request.getParameter("custcomment");
            String reviewdate2 = request.getParameter("reviewdate");
            Date reviewdate = new SimpleDateFormat("dd-MM-yyyy").parse(reviewdate2);
            Integer status = 1; //cust reply

            Review review = new Review(rating,custcomment, reviewdate,status, customer, item,order);
            
            utx.begin();
            em.persist(review);
            utx.commit();
            HttpSession session = request.getSession();
            
            response.sendRedirect("ShowOrderHistory");
                
            
            
            
        }   
        catch (Exception ex) {
        }
    }

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
        processRequest(request, response);
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