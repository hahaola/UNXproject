/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import connect.DBUtils;
import java.util.*;
import java.sql.*;
import model.Account;
import model.Role;

public class LoginDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<Account> getAllAcc() {
        ArrayList<Account> al = new ArrayList<>();
        String query = "select * from account";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                al.add(new Account(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBoolean(7)
                ));
            }
        } catch (Exception e) {

        }

        return al;
    }

    public Account checkLogin(String user, String pass) {
        String query = "select * from account where Username=? and Pass=?";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBoolean(7)
                );
            }

        } catch (Exception e) {

        }
        return null;
    }

    public void NewAcc(String id, String usernamme, String password, String fullname, String email, String roleId, boolean isStatus) {
        String query = "insert into account values (?,?, ?, ?,?,?,?)";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.setString(2, usernamme);
            ps.setString(3, password);
            ps.setString(4, fullname);
            ps.setString(5, email);
            ps.setString(6, roleId);
            ps.setBoolean(7, isStatus);

            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public Account getInfoAccByUsername(String username) {
        String query = "select * from account where Username=?";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBoolean(7));
            }

        } catch (Exception e) {

        }
        return null;
    }

    public Account getInfoAccByEmail(String email) {
        String query = "select * from account where Email=?";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBoolean(7));
            }

        } catch (Exception e) {

        }
        return null;
    }

    public Account getInfoAccByID(String id) {
        String query = "select * from account where accID=?";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBoolean(7));
            }

        } catch (Exception e) {

        }
        return null;
    }

    public void updateAcc(String id, String usernamme, String password, String fullname, String email, String roleId, boolean isStatus) {
        String query = "update account set Username = ?, Pass= ?, Fullname= ?, RoleID= ?, StatusAcc= ?, Email = ?  where accID= ?";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, usernamme);
            ps.setString(2, password);
            ps.setString(3, fullname);
            ps.setString(4, roleId);
            ps.setString(7, id);
            ps.setBoolean(5, isStatus);
            ps.setString(6, email);

            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public ArrayList<Role> getAllRole() {
        ArrayList<Role> rl = new ArrayList<>();
        String query = "select * from roleDetail";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                rl.add(new Role(
                        rs.getString(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {

        }
        return rl;
    }
}
