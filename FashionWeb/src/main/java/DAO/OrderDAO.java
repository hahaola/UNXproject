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
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6)
                ));
            }
        } catch (Exception e) {

        }
        return ol;
    }

    public void saveOrder(String OID, String accID, double total, String address) {
        String query = "insert into [dbo].[Order] values (?,?,?, GETDATE(), ?, 0)";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, OID);
            ps.setString(2, accID);
            ps.setDouble(3, total);
            ps.setString(4, address);

            rs = ps.executeQuery();
        } catch (Exception e) {

        }
    }

    public void changeOrderDetail(boolean isShip, String id) {
        String query = "update [dbo].[Order] set isShip = ? where OID = ?";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setBoolean(1, isShip);
            ps.setString(2, id);

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error in change status ship order: " + e.getMessage());
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
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6)
                ));
            }
        } catch (Exception e) {

        }
        return bol;
    }

    public List<Double> getAllOrderChart() {
        List<Double> list = new ArrayList<>();
        String query = "select\n"
                + "	cast(sum(IIF(month([DateOrder]) = 1, total, 0)) as decimal(10,2)) as 'JAN',\n"
                + "                cast(sum(IIF(month([DateOrder]) = 2, total, 0))as decimal(10,2))  as 'FEB',\n"
                + "                cast(sum(IIF(month([DateOrder]) = 3, total, 0))as decimal(10,2))  as 'MAR',\n"
                + "                cast(sum(IIF(month([DateOrder]) = 4, total, 0)) as decimal(10,2)) as 'APR',\n"
                + "                cast(sum(IIF(month([DateOrder]) = 5, total, 0))as decimal(10,2))  as 'MAY',\n"
                + "                cast(sum(IIF(month([DateOrder]) = 6, total, 0))as decimal(10,2))  as 'JUN',\n"
                + "               cast(sum(IIF(month([DateOrder]) = 7, total, 0))as decimal(10,2))  as 'JUL',\n"
                + "                cast(sum(IIF(month([DateOrder]) = 8, total, 0))as decimal(10,2))  as 'AUG',\n"
                + "                cast(sum(IIF(month([DateOrder]) = 9, total, 0))as decimal(10,2))  as 'SEP',\n"
                + "                cast(sum(IIF(month([DateOrder]) = 10, total, 0))as decimal(10,2))  as 'OCT',\n"
                + "                cast(sum(IIF(month([DateOrder]) = 11, total, 0))as decimal(10,2))  as 'NOV',\n"
                + "                cast(sum(IIF(month([DateOrder]) = 12, total, 0))as decimal(10,2))  as 'DEC'\n"
                + "            from [FashionShop].[dbo].[Order]\n"
                + "            where  Cast(CONVERT(datetime2, [DateOrder], 101) as DATE) >=\n"
                + "                  cast(DATEADD(month, 0, '1/1/' + cast(Year(GETDATE()) as varchar)) as date)\n"
                + "              and Cast(CONVERT(datetime2, [DateOrder], 101) as date) <=\n"
                + "                  cast(DATEADD(month, 12, '12/31/' + cast(Year(GETDATE()) as varchar)) as date)\n"
                + "            group by YEAR([DateOrder])";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            int i = 1;
            rs = ps.executeQuery();
            while (rs.next()) {
                while (i <= 12) {
                    list.add(rs.getDouble(i));
                    i++;
                }

            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;

    }
}
