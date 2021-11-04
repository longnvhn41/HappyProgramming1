/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBConnect;
import static dao.SkillDao.conn;
import entity.RequestSkill;
import entity.Skill;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author GHC
 */
public class RequestSkillDao {

    static Connection conn;

    DBConnect dbConn = null;

    public RequestSkillDao(DBConnect dbconn) {
        conn = dbconn.con;
        this.dbConn = dbconn;
    }
    static Connection con;
    static PreparedStatement ps;
    static ResultSet rs;
//----------------------------------------------------------------------RequestSkill----------------------------------------------------------

    public void createRequestSkill(RequestSkill rSkill) {
        String query = "insert into request_skill values (?,?)";

        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, rSkill.getRequest_id());
            ps.setInt(2, rSkill.getSkill_id());
            ps.executeUpdate();

            try {
                rs.close();
            } catch (Exception e) {
            }
            try {
                ps.close();
            } catch (Exception e) {
            }
            try {
                con.close();
            } catch (Exception e) {
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void deleteSkillByRequestId(int requestId){
        String query = "DELETE FROM request_skill WHERE request_id = ?";

        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, requestId);
            ps.executeUpdate();

            try {
                rs.close();
            } catch (Exception e) {
            }
            try {
                ps.close();
            } catch (Exception e) {
            }
            try {
                con.close();
            } catch (Exception e) {
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
