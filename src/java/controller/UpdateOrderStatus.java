/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
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
import model.Customer;
import model.OrderItems;
import model.Orderr;
import model.Orderstatus;

/**
 *
 * @author Ariana
 */
public class UpdateOrderStatus extends HttpServlet{
    @PersistenceContext
    private EntityManager em;
    
    @Resource 
    private UserTransaction utx;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            //get tracking num
            Integer trackingNum = Integer.parseInt(request.getParameter("trackingNo"));
            //get latest updated status
            String status = request.getParameter("status");
            //find other variable by using trackingnum
            Orderstatus orderS = em.find(Orderstatus.class, trackingNum);
            Date date = orderS.getStatusdate();
            Orderr orderid = orderS.getOrderid();
            orderS.setStatus(status);
            
            
            //perform update task
            utx.begin();
            em.merge(orderS);
            utx.commit();
            
            //get order status all
            Query query = em.createNamedQuery("Orderstatus.findAll");
            //store in list
            List<Orderstatus> orderStatusList = query.getResultList();
            
            //set into session
            session.setAttribute("orderStatusList", orderStatusList);
            //return to jsp
            response.sendRedirect("secureStaff/orderStatus.jsp");
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

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
