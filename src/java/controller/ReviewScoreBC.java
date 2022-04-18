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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.*;

/**
 *
 * @author Shin Mei
 */
public class ReviewScoreBC extends HttpServlet {

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

        HttpSession session = request.getSession();
        System.out.println("Im in");

        //uncomment later
        Integer itemid = Integer.parseInt(request.getParameter("itemid"));

        System.out.println("itemid :" + itemid);
//  Integer itemid = 1;//testing only

        Item item = em.find(Item.class, itemid);
        System.out.println("item :  " + item);
        List<Review> rList = new ArrayList<Review>();
        for (int i = 0; i < item.getReviewList().size(); ++i) {
            if (item.getReviewList().get(i).getRating() == 5) {
                rList.add(item.getReviewList().get(i));
            }
        }
        for (int i = 0; i < item.getReviewList().size(); ++i) {
            if (item.getReviewList().get(i).getRating() == 4) {
                rList.add(item.getReviewList().get(i));
            }
        }
        for (int i = 0; i < item.getReviewList().size(); ++i) {
            if (item.getReviewList().get(i).getRating() == 3) {
                rList.add(item.getReviewList().get(i));
            }
        }
        for (int i = 0; i < item.getReviewList().size(); ++i) {
            if (item.getReviewList().get(i).getRating() == 2) {
                rList.add(item.getReviewList().get(i));
            }
        }
        for (int i = 0; i < item.getReviewList().size(); ++i) {
            if (item.getReviewList().get(i).getRating() == 1) {
                rList.add(item.getReviewList().get(i));
            }
        }

        Query query = em.createNamedQuery("StaffReview.findAll"); 
        List<StaffReview> temp = query.getResultList();
        List<StaffReview> rvList = new ArrayList<StaffReview>();
        StaffReview nulll = new StaffReview();
        if (temp.size() != 0) {
            for (int i = 0; i < rList.size(); ++i) {
                for (int a = 0; a < temp.size(); ++a) {
                    if (item.getReviewList().get(i).getReviewid() == temp.get(a).getReviewid().getReviewid()) {
                        rvList.add(temp.get(a));
                        break;
                    } else if (a == temp.size() - 1) {
                        rvList.add(nulll);
                    }
                }
            }
        } else {
            rvList.add(nulll);
        }

        ArrayList<Integer> star = new ArrayList<Integer>();
        ArrayList<Float> stara = new ArrayList<Float>();

        //count for average
        Integer star1 = 0;
        Integer star2 = 0;
        Integer star3 = 0;
        Integer star4 = 0;
        Integer star5 = 0;
        Integer ratingCount = 0;

        for (int i = 0; i < item.getReviewList().size(); ++i) {
            if (item.getReviewList().get(i).getRating() == 1) {
                star1 = star1 + 1;
            }
            if (item.getReviewList().get(i).getRating() == 2) {
                star2 = star2 + 1;
            }
            if (item.getReviewList().get(i).getRating() == 3) {
                star3 = star3 + 1;
            }
            if (item.getReviewList().get(i).getRating() == 4) {
                star4 = star4 + 1;
            }
            if (item.getReviewList().get(i).getRating() == 5) {
                star5 = star5 + 1;
            }
            ratingCount = ratingCount + item.getReviewList().get(i).getRating();
        }

        star.add(star1);
        star.add(star2);
        star.add(star3);
        star.add(star4);
        star.add(star5);

        float average = (float) ratingCount / (float) item.getReviewList().size();
        stara.add((float) star.get(0) / (float) item.getReviewList().size() * 100);
        stara.add((float) star.get(1) / (float) item.getReviewList().size() * 100);
        stara.add((float) star.get(2) / (float) item.getReviewList().size() * 100);
        stara.add((float) star.get(3) / (float) item.getReviewList().size() * 100);
        stara.add((float) star.get(4) / (float) item.getReviewList().size() * 100);

        session.setAttribute("item", item);
        session.setAttribute("star", star);
        session.setAttribute("stara", stara);
        session.setAttribute("average", average);

        session.setAttribute("rList", rList);
        session.setAttribute("rvList", rvList);

        System.out.println(average);
        System.out.println(item);

        response.sendRedirect("secureUser/ReviewScoreB.jsp");

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
