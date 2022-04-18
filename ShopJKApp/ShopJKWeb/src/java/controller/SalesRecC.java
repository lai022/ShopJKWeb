package controller;

import model.Item;
import java.io.*;
import java.util.List;
import java.util.Map;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class SalesRecC extends HttpServlet {

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
            HttpSession session = request.getSession();
            Query query = em.createNamedQuery("Item.findAll"); //find for all item
            List<Item> sList = query.getResultList();
            session.setAttribute("sList", sList);

            // just in case if the quantity sold is null
            for (int i = 0; i < sList.size(); ++i) {
                if (sList.get(i).getQtysold() == null) {
                    sList.get(i).setQtysold(0);
                }
            }

            response.sendRedirect("secureAdmin/SalesRec.jsp");
        } catch (Exception ex) {
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
