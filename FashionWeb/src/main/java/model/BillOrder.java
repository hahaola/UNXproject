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

    public BillOrder() {
    }

    public BillOrder(String OID, String accID, double totalBill, String date) {
        this.OID = OID;
        this.accID = accID;
        this.totalBill = totalBill;
        this.dateOrder = date;
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

    @Override
    public String toString() {
        return "BillOrder{" + "OID=" + OID  + ", accID=" + accID + ", totalBill=" + totalBill + ", dateOrder=" + dateOrder + ", Date Order= " + dateOrder +'}';
    }
    
    
}
