/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import context.DBConnect;
import dao.RatingDAO;
import dao.UserDao;
import entity.Rating;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tri
 */
@WebServlet(name = "RateMentorController", urlPatterns = {"/RateMentor"})
public class RateMentorController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            DBConnect dBConnect = new DBConnect();
            UserDao ud = new UserDao(dBConnect);
            RatingDAO rd = new RatingDAO(dBConnect);

            if (request.getParameter("mentorId") == null) {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

            //check logged in & permission
            User user = new User();
            boolean hasPermisson = false;

            if (request.getSession().getAttribute("user") != null) {
                user = (User) request.getSession().getAttribute("user");
                if (user.getRole() == 1) {
                    hasPermisson = true;
                }
                request.setAttribute("user", user);
            }
            request.setAttribute("hasPermission", hasPermisson);

            //Get mentor info
            int mentorId = Integer.parseInt(request.getParameter("mentorId"));
            User mentor = ud.getUserById(mentorId);
            request.setAttribute("mentor", mentor);

            //Check if current user has rated this mentor
            boolean hasRated = false;
            ArrayList<Rating> ratings = rd.getRatingOfMentor(mentorId);
            request.setAttribute("ratings", ratings);
            if (hasPermisson) {
                for (Rating r : ratings) {
                    if (r.getMenteeId() == user.getId()) {
                        hasRated = true;
                        request.setAttribute("currentUserRating", r);
                    }
                }
            }
            request.setAttribute("hasRated", hasRated);

            int averageStars = rd.getAverageRating(mentorId);

            request.setAttribute("averageStars", averageStars);
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            request.getRequestDispatcher("rateMentor.jsp").forward(request, response);
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
        try {
            DBConnect dBConnect = new DBConnect();
            UserDao ud = new UserDao(dBConnect);
            RatingDAO rd = new RatingDAO(dBConnect);

            if (request.getParameter("mentorId") == null) {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

            //check logged in & permission
            User user = new User();
            boolean hasPermisson = false;

            if (request.getSession().getAttribute("user") != null) {
                user = (User) request.getSession().getAttribute("user");
                if (user.getRole() == 1) {
                    hasPermisson = true;
                }
                request.setAttribute("user", user);
            }
            request.setAttribute("hasPermission", hasPermisson);

            //Get mentor info
            int mentorId = Integer.parseInt(request.getParameter("mentorId"));
            User mentor = ud.getUserById(mentorId);
            request.setAttribute("mentor", mentor);

            //Check if current user has rated this mentor
            boolean hasRated = false;
            ArrayList<Rating> ratings = rd.getRatingOfMentor(mentorId);
            request.setAttribute("ratings", ratings);
            Rating currentUserRating = new Rating();
            if (hasPermisson) {
                for (Rating r : ratings) {
                    if (r.getMenteeId() == user.getId()) {
                        hasRated = true;
                        currentUserRating = r;
                        request.setAttribute("currentUserRating", r);
                    }
                }
            }
            request.setAttribute("hasRated", hasRated);

            //Actions
            if (request.getParameter("action") != null) {
                String action = request.getParameter("action");
                switch (action) {
                    case "addRating":
                        if (hasRated || !hasPermisson) {
                            break;
                        }
                        int addRate = Integer.parseInt(request.getParameter("stars"));
                        String addComment = request.getParameter("yourComment");
                        rd.addRating(user.getId(), mentorId, addRate, addComment);
                        break;
                    case "editRating":
                        if (!hasRated || !hasPermisson) {
                            break;
                        }
                        int editId = currentUserRating.getId();
                        int editRate = Integer.parseInt(request.getParameter("stars"));
                        String editComment = request.getParameter("yourComment");
                        rd.updateRating(editId, editRate, editComment);
                        break;
                    case "deleteRating":
                        if (!hasRated || !hasPermisson) {
                            break;
                        }
                        rd.deleteRating(currentUserRating.getId());
                        break;
                    default:
                        break;
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
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
