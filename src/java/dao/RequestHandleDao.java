/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBConnect;
import entity.Request_Skill;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Nguyen Van Long
 */
public class RequestHandleDao {

    Connection conn = null;

    DBConnect dbConn = null;

    public RequestHandleDao(DBConnect dbconn) {
        conn = dbconn.con;
        this.dbConn = dbconn;
    }

    public int addRequest(int menteeID, String mess, int status) {
        int n = 0;
        //String sql="insert into request(mentee_id, [message],request_date,[status]) values (?,?,?,?)";
        String sql = "insert into request(mentee_id, [message],[status]) values (?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, menteeID);
            pre.setString(2, mess);
            pre.setInt(3, status);
            n = pre.executeUpdate();
        } catch (Exception e) {
        }
        return n;
    }

    public ArrayList<Request_Skill> getRequestSkillListByRequest(int requestID) {
        ArrayList<Request_Skill> requestSkillList = new ArrayList<>();
        try {
            String query = "SELECT * FROM request_skill where request_id = ? ";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, requestID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                requestSkillList.add(new Request_Skill(rs.getInt(1), rs.getInt(2)));
            }
            return requestSkillList;
        } catch (Exception e) {
        }
        return null;
    }

    public int countRequestByMentor(int mentorID) {

        int num = 0;
        String query = "select count(*) from request WHERE mentor_id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, mentorID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                num = rs.getInt(1);
            }
        } catch (Exception e) {
            
        }

        return num;
    }
    
}
