/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import context.DBConnect;
import dao.SkillDao;
import entity.Skill;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
 * @author quock
 */
@WebServlet(name = "SkillController", urlPatterns = {"/SkillController"})
public class SkillController extends HttpServlet {

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

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        switch (action) {
            case "adminSkillList":
        {
            try {
                adminSkillList(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(SkillController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
                break;

            case "adminUpdateSkill":
        {
            try {
                adminUpdateSkill(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(SkillController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
                break;

            case "adminCreateSkill":
                request.getRequestDispatcher("adminCreateSkillNew.jsp").forward(request, response);
                break;
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

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        switch (action) {
            case "adminUpdateSkillAfter":
        {
            try {
                adminUpdateSkillAfter(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(SkillController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
                break;

            case "adminCreateSkillAfter":
        {
            try {
                adminCreateSkillAfter(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(SkillController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
                break;

        }
    }

    // HIỂN THỊ TẤT CẢ CÁC KỸ NĂNG
    public void adminSkillList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        request.setCharacterEncoding("UTF-8");
        DBConnect dBConnect = new DBConnect();
        SkillDao d = new SkillDao(dBConnect);

        List<Skill> all = d.getSkillList();

        request.setAttribute("all", all);
        request.getRequestDispatcher("adminAllSkillNew.jsp").forward(request, response);
    }

    // TÌM KỸ NĂNG THEO ID VÀ CHUYỂN TỚI TRANG UPDATE ĐỂ CẬP NHẬT
    public void adminUpdateSkill(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        request.setCharacterEncoding("UTF-8");
        DBConnect dBConnect = new DBConnect();
        SkillDao d = new SkillDao(dBConnect);

        int id = Integer.parseInt(request.getParameter("skillID"));

        Skill s = d.getSkill(id);

        request.setAttribute("skill", s);
        request.getRequestDispatcher("adminUpdateSkillNew.jsp").forward(request, response);
    }

    // CẬP NHẬT KỸ NĂNG
    public void adminUpdateSkillAfter(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        request.setCharacterEncoding("UTF-8");
        DBConnect dBConnect = new DBConnect();
        SkillDao d = new SkillDao(dBConnect);

        int id = Integer.parseInt(request.getParameter("editID"));
        String skillName = request.getParameter("editSkillName");
        String status = request.getParameter("editStatus");

        d.updateSkill(new Skill(id, skillName, status));

        response.sendRedirect("SkillController?action=adminSkillList");
    }

    // TẠO KỸ NĂNG MỚI
    public void adminCreateSkillAfter(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        request.setCharacterEncoding("UTF-8");
        DBConnect dBConnect = new DBConnect();
        SkillDao d = new SkillDao(dBConnect);

        List<Skill> allSkill = d.getSkillList();
        Skill s = null;
        String skillName = request.getParameter("skillName");
   

        for (Skill o : allSkill) {
            if (skillName.equalsIgnoreCase(o.getName())) {
                s = new Skill(o.getId(), o.getName(), o.getStatus());
                break;
//                request.setAttribute("skillNameExisted", " Tên kỹ năng đã tồn tại");
//                request.getRequestDispatcher("adminCreateSkill.jsp").forward(request, response);
//                break;
            }
        }

        if (s == null) {
            d.createSkill(new Skill(d.getHighestSkillID() + 1, skillName, "Kích hoạt"));
            response.sendRedirect("SkillController?action=adminSkillList");
        } else {
            request.setAttribute("skillNameExisted", " Tên kỹ năng đã tồn tại");
            request.getRequestDispatcher("adminCreateSkillNew.jsp").forward(request, response);
        }

    }

}
