/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package context;
//class này quản lý các kết nối đến cơ sở dữ liệu

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen Van Long
 */
public class DBConnect {

    //class này quản lý các kết nối đến cơ sở dữ liệu
    public Connection con = null;//cho bằng null để tránh ngoại lệ

    public DBConnect(String URL, String username, String pass) throws SQLException {
        //để kết nối đến cơ sở dữ liệu
        try {
            //get driver
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            con = DriverManager.getConnection(URL, username, pass);
            System.out.println("Connected");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public DBConnect() throws SQLException {
        this("jdbc:sqlserver://localhost:1433;databaseName=HappyProgramming1", "sa", "1234567");

    }

    public ResultSet getData(String sql) {
        ResultSet rs = null;
        try {

            Statement state = con.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            rs = state.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public static void main(String[] args) throws SQLException {
        new DBConnect();
    }
}
