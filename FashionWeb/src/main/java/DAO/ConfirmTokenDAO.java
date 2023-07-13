/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import connect.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.*;

public class ConfirmTokenDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public ConfirmToken findByToken(String token) {
        String query = "Select * from [ConfirmToken] where [Token] = ?";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, token);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new ConfirmToken(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)
                );
            }
        } catch (Exception e) {

        }
        return null;
    }

    public ConfirmToken findConfirmTokenByAccount(String id) {
        String query = "Select * from [ConfirmToken] where accID = ?";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new ConfirmToken(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)
                );
            }
        } catch (Exception e) {

        }
        return null;
    }

    public void saveConfirmToken(ConfirmToken tkn) {
        String query = "insert into [ConfirmToken] values(?,?,?,?,?)";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, tkn.getToken());
            ps.setString(2, tkn.getCreateAt());
            ps.setString(3, tkn.getExpireAt());
            ps.setString(4, tkn.getConfirmAt());
            ps.setString(5, tkn.getAccID());
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("Error in saving token " + e.getMessage());
        }
    }

    public void updateConfirmToken(String token, String ConfirmAt) {
        String query = "update [ConfirmToken] set ConfirmAt = ? where Token = ?";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, ConfirmAt);
            ps.setString(2, token);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }
}
