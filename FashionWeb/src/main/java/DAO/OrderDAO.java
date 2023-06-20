package DAO;

import connect.DBUtils;
import java.util.*;
import java.sql.*;
import model.*;

public class OrderDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Order> getAllDetailOrder() {
        List<Order> ol = new ArrayList<>();
        String query = "select * from [dbo].[OrderDetail]";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                ol.add(new Order(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getDouble(4)
                ));
            }
        } catch (Exception e) {

        }
        return ol;
    }

    public void saveDetailOrder(String OID, String pid, int Oquantity, double total) {
        String query = "insert into [dbo].[OrderDetail] values (?,?,?,?)";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, OID);
            ps.setString(2, pid);
            ps.setInt(3, Oquantity);
            ps.setDouble(4, total);

            rs = ps.executeQuery();
        } catch (Exception e) {

        }
    }

    public List<BillOrder> getAllOrder() {
        List<BillOrder> ol = new ArrayList<>();
        String query = "select * from [dbo].[Order]";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                ol.add(new BillOrder(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getString(4)
                ));
            }
        } catch (Exception e) {

        }
        return ol;
    }

    public void saveOrder(String OID, String accID, double total) {
        String query = "insert into [dbo].[Order] values (?,?,?, GETDATE())";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, OID);
            ps.setString(2, accID);
            ps.setDouble(3, total);

            rs = ps.executeQuery();
        } catch (Exception e) {

        }
    }

    public List<Order> getOrderByDOID(String id) {
        List<Order> ol = new ArrayList<>();
        String query = "select * from [dbo].[OrderDetail] where DOID = ?";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                ol.add(new Order(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getDouble(4)
                ));
            }
        } catch (Exception e) {

        }
        return ol;
    }

    public List<BillOrder> getBillOrderByAccID(String id) {
        List<BillOrder> bol = new ArrayList<>();
        String query = "select * from [dbo].[Order] where accID = ?";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                bol.add(new BillOrder(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getString(4)
                ));
            }
        } catch (Exception e) {

        }
        return bol;
    }
}
