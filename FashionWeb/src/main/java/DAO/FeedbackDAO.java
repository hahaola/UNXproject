/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import connect.DBUtils;
import java.util.*;
import java.sql.*;
import model.*;

public class FeedbackDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Feedback> getFeedbackPagination(String product_id, int offset) {
        List<Feedback> fl = new ArrayList<>();
        String query = "select * from Feedback where Product_id = ? order by CreateAt DESC OFFSET ? rows FETCH NEXT 3 ROWS ONLY";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, product_id);
            ps.setInt(2, offset);
            rs = ps.executeQuery();
            while (rs.next()) {
                fl.add(new Feedback(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6)
                ));
            }
        } catch (Exception e) {
            System.out.println("Error in get feedback: " + e.getMessage());
        }
        return fl;
    }

    public List<Feedback> getFeedbackProduct(String product_id) {
        List<Feedback> fl = new ArrayList<>();
        String query = "select * from Feedback where Product_id = ?";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, product_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                fl.add(new Feedback(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6)
                ));
            }
        } catch (Exception e) {
            System.out.println("Error in get all feedback: " + e.getMessage());
        }
        return fl;
    }

    public void addFeedback(Feedback feedback) {
        String query = "insert into Feedback values(?,?,?,?, GETDATE())";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, feedback.getAccID());
            ps.setString(2, feedback.getProduct_id());
            ps.setString(3, feedback.getComment());
            ps.setInt(4, feedback.getRating());

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error in add feedback: " + e.getMessage());
        }
    }
}
