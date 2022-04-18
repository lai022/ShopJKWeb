/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.Order;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;
import model.OrderItems;
import model.Orderr;
import model.Review;

/**
 *
 * @author Ariana & Shin Mei
 */
public class ShowOrderHistory extends HttpServlet {

    @PersistenceContext
    private EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            //get username from index.html by using request get parameter
            Customer c = (Customer) session.getAttribute("login");
            System.out.println("Customer username: " + c.getCustusername());
            System.out.println("Order List Size: " + c.getOrderrList().size());

//            String cusername = c.getCustusername();
//
//            //set username into session
//            session.setAttribute("cusername", cusername);
//            //find customer's details by using the username
//            Customer customer = em.find(Customer.class, cusername);
//            System.out.println("Get Customer Order List: " + c.getOrderrList().size());
            List<Orderr> order = new ArrayList<Orderr>();
            List<OrderItems> orderList = new ArrayList<OrderItems>();

            //use for loop, i less then the orderlist size
            for (int i = 0; i < c.getOrderrList().size(); i++) {
                order.add(c.getOrderrList().get(i));
            }

            for (int i = 0; i < order.size(); i++) {
                orderList.add(order.get(i).getOrderItemsList().get(0));
            }

            Query query = em.createNamedQuery("Review.findAll"); 
            List<Review> rList = query.getResultList();

            session.setAttribute("rList", rList);

            //set orderlist into session
            session.setAttribute("orderList", orderList);
            //return to jsp
            response.sendRedirect("secureUser/orderHistory.jsp");

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
