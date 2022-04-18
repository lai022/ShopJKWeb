/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;
import model.Item;

/**
 *
 * @author HP
 */
public class ShowOrderList extends HttpServlet {

    @PersistenceContext
    private EntityManager em;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Customer cust = (Customer)session.getAttribute("login");
            String cusername = cust.getCustusername();
            System.out.println("Cusername: "+cusername);
            //get itemid
            Integer itemid = Integer.parseInt(request.getParameter("itemid"));
            
            Query query = em.createNamedQuery("Item.findByItemid",Item.class).setParameter("itemid", itemid);
            List<Item> selectedItem = query.getResultList();
            
            //store item in item list
            
            session.setAttribute("cusername", cusername);
            session.setAttribute("selectedItem", selectedItem);
            response.sendRedirect("secureUser/order.jsp");
        } catch (Exception ex) {
            throw ex;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
