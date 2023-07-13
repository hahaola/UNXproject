/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class BillOrder {

    private String OID;
    private String accID;
    private double totalBill;
    private String dateOrder;
    private String address;
    private boolean isShip;

    public BillOrder() {
    }

//    public BillOrder(String OID, String accID, double totalBill, String date) {
//        this.OID = OID;
//        this.accID = accID;
//        this.totalBill = totalBill;
//        this.dateOrder = date;
//    }
    public BillOrder(String OID, String accID, double totalBill, String dateOrder, String address, boolean isShip) {
        this.OID = OID;
        this.accID = accID;
        this.totalBill = totalBill;
        this.dateOrder = dateOrder;
        this.address = address;
        this.isShip = isShip;
    }

    public BillOrder(String OID, String accID, double totalBill, String dateOrder, String address) {
        this.OID = OID;
        this.accID = accID;
        this.totalBill = totalBill;
        this.dateOrder = dateOrder;
        this.address = address;
        this.isShip = isShip;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOID() {
        return OID;
    }

    public void setOID(String OID) {
        this.OID = OID;
    }

    public String getAccID() {
        return accID;
    }

    public void setAccID(String accID) {
        this.accID = accID;
    }

    public double getTotalBill() {
        return totalBill;
    }

    public void setTotalBill(double totalBill) {
        this.totalBill = totalBill;
    }

    public String getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(String dateOrder) {
        this.dateOrder = dateOrder;
    }

    public boolean isIsShip() {
        return isShip;
    }

    public void setIsShip(boolean isShip) {
        this.isShip = isShip;
    }

    @Override
    public String toString() {
        return "BillOrder{" + "OID=" + OID + ", accID=" + accID + ", totalBill=" + totalBill + ", dateOrder=" + dateOrder + ", Date Order= " + dateOrder + '}';
    }

}
