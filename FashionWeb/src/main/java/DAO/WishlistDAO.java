/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import connect.DBUtils;
import java.util.*;
import java.sql.*;
import model.*;

public class WishlistDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Wishlist> getAllWishlist() {
        List<Wishlist> wl = new ArrayList<>();
        String query = "select * from [dbo].[Wishlist_detail]";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                wl.add(new Wishlist(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(4),
                        rs.getString(3)
                ));
            }
        } catch (Exception e) {
            System.out.println("Error in get all wishlist: " + e.getMessage());
        }
        return wl;
    }

    public List<Wishlist> getAllWishlistByAccID(String accID) {
        List<Wishlist> wl = new ArrayList<>();
        String query = "select * from [dbo].[Wishlist_detail] where accID = ?";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, accID);
            rs = ps.executeQuery();
            while (rs.next()) {
                wl.add(new Wishlist(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(4),
                        rs.getString(3)
                ));
            }
        } catch (Exception e) {
            System.out.println("Error in get all wishlist: " + e.getMessage());
        }
        return wl;
    }

    public void addToWishlist(String product_id, String account_id) {
        String query = "insert into [dbo].[Wishlist_detail] values(?,GETDATE(),?)";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, product_id);
            ps.setString(2, account_id);

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error in add wishlist: " + e.getMessage());
        }
    }

    public void removeFromWishlist(String id) {
        String query = "Delete from [dbo].[Wishlist_detail] where Wishlist_Id = ?";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error in remove wishlist: " + e.getMessage());
        }
    }
}
