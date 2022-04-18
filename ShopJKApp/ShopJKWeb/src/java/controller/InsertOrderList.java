/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
import model.Customer;
import model.Item;
import model.OrderItems;
import model.Orderr;
import model.Orderstatus;
import model.Receiver;

/**
 *
 * @author HP
 */
public class InsertOrderList extends HttpServlet {

    @PersistenceContext
    private EntityManager em;

    @Resource
    private UserTransaction utx;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            //get parameter
            String name = (String) request.getParameter("rname");
            System.out.println("name: "+name);
            String phone = (String) request.getParameter("rphoneno");
            System.out.println("Phone: "+phone);
            String address = (String) request.getParameter("raddress");
            System.out.println("Address: "+address);
//            float totalSum = Float.parseFloat(request.getParameter("totalSum"));
//            System.out.println("Total Sum: "+totalSum);
//            float tax = Float.parseFloat(request.getParameter("tax"));
//            System.out.println("Tax: "+tax);
            DecimalFormat decimalFormatter = new DecimalFormat("0.00");

            Integer qty = Integer.parseInt(request.getParameter("qty"));
            System.out.println("Qty: "+qty);
            float price = Float.parseFloat(request.getParameter("itemPrice"));
            System.out.println("IPrice: "+price);
            
            
            
            float total = price * qty;
            float totalSum = total * 1.1f;
            float tax = totalSum - total;
            
            //set in session
            session.setAttribute("totalSum", totalSum);
            session.setAttribute("tax", tax);
            Integer itemid = Integer.parseInt(request.getParameter("itemid"));
            System.out.println("Item id: "+itemid);
            String username = (String) request.getParameter("username");
            System.out.println("username: "+username);
            
            //Customer
            Customer customer = em.find(Customer.class, username);
            System.out.println("Customer: "+customer);

            //set new qty in item
            Item item = em.find(Item.class, itemid);
            System.out.println(item.getQtyinstock());
            Integer qtyInStock = item.getQtyinstock();
            qtyInStock = qtyInStock - 1;
            System.out.println(qtyInStock);
            item.setQtyinstock(qtyInStock);
            System.out.println(item.getQtysold());
            Integer qtySold = item.getQtysold();
            qtySold = qtySold + 1;
            System.out.println(qtySold);
            item.setQtysold(qtySold);
            
            try {
                utx.begin();
                //update item quantity & sold quantity
                em.merge(item);
                System.out.println("Successful update item");
                utx.commit();
            } catch (Exception ex) {
                throw ex;
            }
            //insert receiver
            //set receiver
            Query query = em.createNamedQuery("Receiver.findByCustusername", Receiver.class).setParameter("custusername", customer);
            List<Receiver> q = query.getResultList();
            System.out.println("Receiver size: "+q.size());
            //if q not 0
            try {
                utx.begin();
                if (q.size() != 0) {
                    //get details
                    Integer getReceiverID = q.get(0).getReceiverid();
                    String getName = q.get(0).getReceivername();
                    String getPhone = q.get(0).getReceiverphone();
                    String getAddress = q.get(0).getReceiveraddress();

                    //compare details if not same, update
                    if ((!getName.equals(name)) || (!getPhone.equals(phone)) || (!getAddress.equals(address))) {
                        System.out.println("Update receiver record");
                        Receiver receiver = new Receiver(getReceiverID, name, phone, address, customer);
                        em.merge(receiver);
                    } else {
                        System.out.println("Same records retrieve");
                    }
                    //else if it is 0, insert
                } else {
                    System.out.println("First time insert receiver record");
                    Receiver receiver = new Receiver(name, phone, address, customer);
                    em.persist(receiver);
                }
                utx.commit();
            } catch (Exception ex) {
                throw ex;
            }

            //insert orderr
            Query query2 = em.createNamedQuery("Receiver.findByCustusername", Receiver.class).setParameter("custusername", customer);
            List<Receiver> q2 = query2.getResultList();
            System.out.println("Get receiver name: "+q2.get(0).getReceivername());
            //move data into constructor
            Receiver r2 = new Receiver(q2.get(0).getReceiverid(), q2.get(0).getReceivername(), q2.get(0).getReceiverphone(), q2.get(0).getReceiveraddress(), q2.get(0).getCustusername());
            //get local date in format
            LocalDate date = LocalDate.now();
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy");
            Date formatDate = java.sql.Date.valueOf(date);
            System.out.println("Format date: "+formatDate);
            //move data into constructor
            Orderr order = new Orderr(formatDate, r2, customer);

            try {
                utx.begin();
                em.persist(order);
                utx.commit();
                System.out.println("Successful insert order record");
            } catch (Exception ex) {
                throw ex;
            }

            //insert orderItem
            //find by using custusername
            Query query3 = em.createNamedQuery("Orderr.findByCustusername", Orderr.class).setParameter("custusername", customer);
            List<Orderr> q3 = query3.getResultList();
            //get list size
            int n = q3.size();
            //minus 1 so can get the orderid at the place
            n--;
            Integer orderid = q3.get(n).getOrderid();
            System.out.println("Get order id b4 insert order item: "+q3.get(n).getOrderid());
            //get orderid class
            Orderr o = em.find(Orderr.class, orderid);
            System.out.println("Get order"+o);
            //move data in constructor
            OrderItems orderItems = new OrderItems(o, item, qty, total);
            try {
                utx.begin();
                em.persist(orderItems);
                utx.commit();
                System.out.println("Successful add orderItems");
            } catch (Exception ex) {
                throw ex;
            }

            //insert orderStatus
            String status = "To Pack";
            //move data into constructor
            Orderstatus os = new Orderstatus(status, formatDate, o);

            try {
                utx.begin();
                em.persist(os);
                utx.commit();
                System.out.println("Successful add orderStatus");
            } catch (Exception ex) {
                throw ex;
            }
            
            Query query4 = em.createNamedQuery("OrderItems.findByOrderid", OrderItems.class).setParameter("orderid", o);
            List<OrderItems> q4 = query4.getResultList();
            Integer getorderitemsid = q4.get(0).getOrderItemsid();
            System.out.println("Get Order ID at order items: " + getorderitemsid);
            OrderItems oi = em.find(OrderItems.class, getorderitemsid);
            System.out.println("Get Order Item: " + oi);
            session.setAttribute("orderItemsList", oi);
            session.setAttribute("tax", tax);
            session.setAttribute("totalsum", totalSum);
            //response
            response.sendRedirect("secureUser/Payment.jsp");
        } catch (Exception ex) {
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
