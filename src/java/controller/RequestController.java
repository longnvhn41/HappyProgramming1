/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import context.DBConnect;
import dao.InvitationDao;
import dao.RequestDao;
import dao.RequestHandleDao;
import dao.RequestSkillDao;
import dao.SkillDao;
import entity.Request;
import entity.RequestSkill;
import entity.Skill;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nguyen Van Long
 */
@WebServlet(name = "RequestController", urlPatterns = {"/RequestController"})
public class RequestController extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        DBConnect dBConnect = new DBConnect();
        RequestHandleDao dao1 = new RequestHandleDao(dBConnect);
        RequestDao dao = new RequestDao(dBConnect);
        SkillDao Sdao = new SkillDao(dBConnect);
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String service = request.getParameter("service");
            if (service.equals("becomeMentor")) {
                String skill = request.getParameter("skill");
                int id = Integer.parseInt(request.getParameter("id"));
                String mess = "Become Mentor: " + skill;
                int status = 0;
                dao1.addRequest(id, mess, status);
                response.sendRedirect("homepage.jsp");
            }
            if (service.equals("createRequest")) {
                List<Skill> listSkill = Sdao.getSkillList();
                request.setAttribute("listSkill", listSkill);
                request.getRequestDispatcher("menteeCreateRequest.jsp").forward(request, response);
            }
            if (service.equals("createRequestAfter")) {
                HttpSession session = request.getSession();
                User user = (User) session.getAttribute("user");
                int userId = user.getId();
                String title = request.getParameter("title");
                java.util.Date deadline = null;
                try {
                    deadline = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("deadline"));
                } catch (Exception e) {

                }

                float deadlineHour = Float.parseFloat(request.getParameter("deadlineHours"));
                String content = request.getParameter("content");
                //1: Open, 0:closed, 2:Processing, 3:canceled
                int status = 1;

                String[] skill = request.getParameterValues("skill");
                if (skill.length > 3) {
                    List<Skill> listSkill = Sdao.getSkillList();
                    request.setAttribute("listSkill", listSkill);
                    request.setAttribute("title", title);
                    request.setAttribute("deadline", deadline);
                    request.setAttribute("deadlineHour", deadlineHour);
                    request.setAttribute("content", content);
                    request.setAttribute("alertMess1", "Không được chọn quá 3 kỹ năng");
                    request.getRequestDispatcher("menteeCreateRequest.jsp").forward(request, response);
                } else {
                    RequestSkillDao rSDao = new RequestSkillDao(dBConnect);
                    java.util.Date currentDate = new java.util.Date();
                    Request r = new Request(userId, content, title, deadline, currentDate, status, deadlineHour);
                    dao.createRequest(r);
                    int Rid = dao.getMaxRequestId();
                    for (String s : skill) {
                        RequestSkill rs = new RequestSkill(Rid, Integer.parseInt(s));
                        rSDao.createRequestSkill(rs);
                    }
                    response.sendRedirect("UserController?service=mentorByList");
                }
            }
            if (service.equals("updateRequest")) {
                HttpSession ses = request.getSession();
                User user = (User) ses.getAttribute("user");
                int id = Integer.parseInt(request.getParameter("requestId"));
                Request req = dao.getRequestById(id);
                if (user.getId() != req.getMentee_id()) {
                    response.sendRedirect("homepage.login");
                    return;
                }
                List<Skill> listSkill = Sdao.getSkillList();
                List<Skill> listSkillRequest = Sdao.getSkillRequest(id);

                request.setAttribute("requestByMentee", req);
                request.setAttribute("listSkill", listSkill);
                request.setAttribute("listSkillRequest", listSkillRequest);

                request.getRequestDispatcher("menteeUpdateRequest.jsp").forward(request, response);
            }
            if (service.equals("updateRequestAfter")) {
                HttpSession session = request.getSession();
                User user = (User) session.getAttribute("user");
                int requestId = Integer.parseInt(request.getParameter("requestId"));
                Request requestByMentee = dao.getRequestById(requestId);
                List<Skill> listSkill = Sdao.getSkillList();
                List<Skill> listSkillRequest = Sdao.getSkillRequest(requestId);
                String title = request.getParameter("title");
                java.util.Date deadline = null;
                try {
                    deadline = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("deadline"));
                } catch (Exception e) {

                }
                float deadlineHour = Float.parseFloat(request.getParameter("deadlineHours"));
                String content = request.getParameter("content");
                String[] skill = request.getParameterValues("skill");
                if (skill.length > 3) {
                    request.setAttribute("requestByMentee", requestByMentee);
                    request.setAttribute("listSkill", listSkill);
                    request.setAttribute("listSkillRequest", listSkillRequest);
                    request.setAttribute("alertMess1", "Không được chọn quá 3 kỹ năng");
                    request.getRequestDispatcher("menteeUpdateRequest.jsp").forward(request, response);
                } else {
                    RequestSkillDao rSDao = new RequestSkillDao(dBConnect);
                    dao.updateRequestByMentee(requestId, content, 1, deadlineHour, title, deadline, null);
                    request.getRequestDispatcher("homepage.jsp").forward(request, response);
                    rSDao.deleteSkillByRequestId(requestId);
                    for (String s : skill) {
                        RequestSkill rs = new RequestSkill(requestId, Integer.parseInt(s));
                        rSDao.createRequestSkill(rs);
                    }
                    request.getRequestDispatcher("UserController").forward(request, response);
                }
            }
            if (service.equals("statisticRequestAfter")) {
                 HttpSession session = request.getSession();
                User user = (User) session.getAttribute("user");
                int menteeId = user.getId();
                double hours = 0;
                int totalMentor = dao.getMentorNumberById(menteeId);
                List<Request> lists = dao.getListRequestById(menteeId);
                int totalRequest = lists.size();
                for (Request request1 : lists) {
                    if(request1.getStatus() == 0){
                        hours += request1.getDeadlineHour();
                    }
                }
                String sql="select DISTINCT u.id, u.full_name, u.framework, u.email from [user] "
                        + "as u join rating as r on u.id=r.mentor_id ";
                ResultSet rs = dBConnect.getData(sql);
                request.setAttribute("ketQua", rs);
                InvitationDao invi=new InvitationDao(dBConnect);
                int skills=invi.skillsInSystem();
                int menteeCount=invi.menteeInSystem();
                int mentorCount=invi.mentorInSystem();
                request.setAttribute("skills", skills);
                request.setAttribute("mentee", menteeCount);
                request.setAttribute("mentor", mentorCount);
                request.setAttribute("total", totalRequest);
                request.setAttribute("totalMentor", totalMentor);
                request.setAttribute("totalHour", hours);
                request.getRequestDispatcher("menteeDashBoard.jsp").forward(request, response); 

            }

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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RequestController.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RequestController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
