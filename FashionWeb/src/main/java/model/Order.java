package model;

public class Order {

    private String OID;
    private String pid;
    private int Oquantity;
    private double totalMoney;

    public Order() {
    }

    public Order(String OID, String pid, int Oquantity, double totalMoney) {
        this.OID = OID;
        this.pid = pid;
        this.Oquantity = Oquantity;
        this.totalMoney = totalMoney;
    }

    public String getOID() {
        return OID;
    }

    public void setOID(String OID) {
        this.OID = OID;
    }


    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }


    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public int getOquantity() {
        return Oquantity;
    }

    public void setOquantity(int Oquantity) {
        this.Oquantity = Oquantity;
    }

    @Override
    public String toString() {
        return "Order{" + "OID=" + OID + ", pid=" + pid  + ", Oquantity=" + Oquantity + ", Money= "+ totalMoney + '}';
    }

    
    
}
