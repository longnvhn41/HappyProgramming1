/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import context.DBConnect;
import dao.InvitationDao;
import dao.RatingDAO;
import dao.SkillDao;
import dao.UserDao;
import entity.Invitation;
import entity.Skill;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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
@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {

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
        request.setAttribute("mess", "");
        response.setContentType("text/html;charset=UTF-8");
        DBConnect dBConnect = new DBConnect();
        UserDao d = new UserDao(dBConnect);
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String service = request.getParameter("service");
            ServletContext sc = getServletContext();
            if (service == null) {
                service = "logout";
            }
            if (service.equals("Signup")) {
                HttpSession session = request.getSession();
                String name = request.getParameter("fullname");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String account = request.getParameter("username");
                String pass = request.getParameter("password");
                String rpass = request.getParameter("rpassword");
                String dob = request.getParameter("birthday");
                int gender = Integer.parseInt(request.getParameter("gender"));
                String address = request.getParameter("address");
                int role = 1;
                String ava = null;
                User user = new User(name, account, pass, email, phone, dob, gender, address, role);
                session.setAttribute("user", user);
                User u1 = d.checkExitsEmail(email);
                if (u1 == null) {
                    User u = d.checkUserExitsAccount(account);
                    if (u == null) {
                        if (!pass.equals(rpass)) {
                            request.setAttribute("mess", "The Password you entered did not match, please try again!");
                            request.getRequestDispatcher("signup.jsp").forward(request, response);
                        } else {
                            String userfrom = "longnvhn41@gmail.com";
                            String passfrom = "nguyenvanlong98";
                            String code = "http://localhost:8080/HappyProgramming/login.jsp";
                            String subject = "Welcome to Happy Programming";
                            String message = ("Registered successfully. Welcome to Happy Programming: " + code);
                            UserDao.send(email, subject, message, userfrom, passfrom);
                            request.setAttribute("thongBao", "Successful registration, welcome to the system.");
                            d.addUser(name, account, pass, email, phone, dob, gender, address, role, ava);
                            request.getRequestDispatcher("login.jsp").forward(request, response);
                        }
                    } else {
                        request.setAttribute("alert", "Account already exists!");
                        request.getRequestDispatcher("signup.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("alert1", "Email already exists!");
                    request.getRequestDispatcher("signup.jsp").forward(request, response);
                }

            }
//            
            if (service.equals("logout")) {
                HttpSession session = request.getSession();
                session.invalidate();
                response.sendRedirect("HomeP.jsp");
            }
            if (service.equals("userProfile")) {
                String account = request.getParameter("user");
                User u = d.showUserProfile(account);
                HttpSession session = request.getSession();
                session.setAttribute("u", u);
                response.sendRedirect("showUser.jsp");
            }
            if (service.equals("update")) {
                int id = Integer.parseInt(request.getParameter("id"));
                String sql = "select * from [User] where id=" + id;
                ResultSet rs = dBConnect.getData(sql);
                try {
                    if (rs.next()) {
                        User us = new User(rs.getInt(1), rs.getString(2), rs.getString(3),
                                rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                                rs.getInt(8), rs.getString(9));
                        request.setAttribute("us", us);
                        request.setAttribute("title", "Update User");
                        RequestDispatcher dis = request.getRequestDispatcher("/updateUser.jsp");
                        dis.forward(request, response);
                    }
                } catch (Exception e) {
                }
            }
            if (service.equals("updated")) {
                String id = request.getParameter("id");
                String name = request.getParameter("name");
                String acc = request.getParameter("acc");
                String password = request.getParameter("pass");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String dob = request.getParameter("dob");
                String sex = request.getParameter("sex");
                String address = request.getParameter("address");
                d.updateUser(id, name, acc, password, email, phone, dob, sex, address);
                request.setAttribute("thongbao", "Update successful. Please log in again!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            if (service.equals("change_password")) {
                String oldPassword = request.getParameter("old_password");
                HttpSession session = request.getSession();
                User u = (User) session.getAttribute("user");
                if (!oldPassword.equals(u.getPassword())) {
                    request.setAttribute("thongbao", "Old Password incorrect");
                    request.getRequestDispatcher("changePass.jsp").forward(request, response);
                }

                String password = request.getParameter("password");
                UserDao dao = new UserDao(dBConnect);
                if (dao.changePass(u.getAccount(), password)) {
                    request.setAttribute("thongbao", "Change Password Success");
                } else {
                    request.setAttribute("thongbao", "Change Password False");
                }
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            if (service.equals("becomeMentor")) {
                SkillDao dao = new SkillDao(dBConnect);
                List<Skill> list = dao.getSkillList();
                request.setAttribute("list", list);
                request.getRequestDispatcher("userProfile.jsp").forward(request, response);
            }
            if (service.equals("addRequestMentor")) {
                int userid = Integer.parseInt(request.getParameter("id"));
                int sid = Integer.parseInt(request.getParameter("nameSkill"));
                Skill skill = d.nameSkill(sid);
                String nameSkill = skill.getName();
                d.updateFramework(nameSkill, userid);
                String intro = request.getParameter("introduce");
                int status = 0;
                int role = 3;
                d.changeRoleforUser(role, userid);
                d.addRequestMentor(userid, sid, intro, status);
                response.sendRedirect("homepage.jsp");

            }

            if (service.equals("displayMentee_mentor")) {

                String sql = "select rm.id, u.full_name, u.email, u.phone, u.address, skill.[name], "
                        + "rm.introduce, u.role from [user] as u join request_mentor_skill as rm on "
                        + "u.id=rm.userid join skill on skill.id=rm.skillid where role=3";
                ResultSet rs = dBConnect.getData(sql);
                request.setAttribute("ketQua", rs);
                request.getRequestDispatcher("mentee_Mentor.jsp").forward(request, response);
            }
            if (service.equals("handleMentor")) {
                String email = request.getParameter("email");
                d.updateRole(email);
                int id = d.getMaxRequest_BecomeMentorId();
                d.deleteRequestBecomeMentor(id);
                request.getRequestDispatcher("UserController?service=displayMentee_mentor").forward(request, response);
            }
            if (service.equals("handleMentor2")) {
                String email = request.getParameter("email");
                d.updateRole2(email);
                String userfrom = "longnvhn41@gmail.com";
                String passfrom = "nguyenvanlong98";
                String code = "http://localhost:8080/HappyProgramming/HomeP.jsp";
                String subject = "Message from Happy Programming!";
                String message = ("You are refused to become a teacher of the system. Thank you for your interest in Happy Programming. " + code);
                UserDao.send(email, subject, message, userfrom, passfrom);
                int id = d.getMaxRequest_BecomeMentorId();
                d.deleteRequestBecomeMentor(id);
                request.getRequestDispatcher("UserController?service=displayMentee_mentor").forward(request, response);

            }
            if (service.equals("mentorByList")) {
                InvitationDao invi = new InvitationDao(dBConnect);
                int requestID = invi.maxRequestID();
                String sql = "select u.id, u.full_name, u.email, u.phone,cv.description from [user] as u join cv on u.id=cv.[user_id] join cv_skill as cvs on cv.id=cvs.cv_id join skill as s on cvs.skill_id=s.id\n"
                        + "join request_skill as rs on s.id=rs.skill_id join request on request.id=rs.request_id where u.role=0 and cvs.skill_id=rs.skill_id and request.id=" + requestID + "";
                ResultSet rs = dBConnect.getData(sql);
                request.setAttribute("ketQua", rs);
                request.setAttribute("ID", requestID);
                request.getRequestDispatcher("mentorBySkill.jsp").forward(request, response);
            }           
            if (service.equals("addInvitation")) {
                int requestId = Integer.parseInt(request.getParameter("requestID"));
                int mentorID = Integer.parseInt(request.getParameter("mentorID"));
                InvitationDao dao = new InvitationDao(dBConnect);
                String status = "Processing";
                Invitation invitation = new Invitation(requestId, mentorID, status);
                try {
                    dao.createInvitation(invitation);
                } catch (Exception ex) {
                    Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
                }
                response.sendRedirect("UserController?service=mentorByList");
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
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
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
