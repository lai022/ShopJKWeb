/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Review;

/**
 *
 * @author Shin Mei
 */

import model.Customer;
import java.io.*;
import java.util.List;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import model.StaffReview;



public class StaffReplyReviewCB extends HttpServlet {
    @PersistenceContext
    private EntityManager em;
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            HttpSession session = request.getSession();

            String tab = request.getParameter("tab");
            Integer reviewid = Integer.parseInt(request.getParameter("reviewid"));

            if (tab.equals("") || tab == null) {
                response.sendRedirect("ReviewRecC");

            } else if (tab.equals("replied")) {
                Integer status = 2;//staff replied
                Query query = em.createNamedQuery("Review.findByStatus",Review.class).setParameter("status", status);
                List<Review> rList = query.getResultList();
                session.setAttribute("rList", rList);
                response.sendRedirect("secureStaff/ReviewRec.jsp");

            } else if (tab.equals("pending")) {
                Integer status = 1; //customer reply
                Query query = em.createNamedQuery("Review.findByStatus",Review.class).setParameter("status", status);
                List<Review> rList = query.getResultList();
                session.setAttribute("rList", rList);
                response.sendRedirect("secureStaff/ReviewRec.jsp");
                
            } else if (tab.equals("next")) {
                Review review = em.find(Review.class, reviewid); 
                session.setAttribute("review", review);
                response.sendRedirect("secureStaff/StaffReplyReview.jsp");
                
                
            }else if (tab.equals("view")) {
                Review review = em.find(Review.class, reviewid); 
                session.setAttribute("review", review);
                Query query = em.createNamedQuery("StaffReview.findByReviewid",StaffReview.class).setParameter("reviewid", review);
                List<StaffReview> rvList = query.getResultList();
                session.setAttribute("rvList", rvList);
                
                response.sendRedirect("secureStaff/StaffViewReview.jsp");//-->new one
            }

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
        Integer reviewid =  Integer.parseInt(request.getParameter("reviewid"));
        HttpSession session = request.getSession();
        
        Review review = em.find(Review.class, reviewid); // SELECT S FROM SUBJECT S => select * from subject;
          
            session.setAttribute("review", review);
            response.sendRedirect("StaffReplyComment.jsp");
        
        
        
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