/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Wishlist {
    private int id;
    private String product_id;
    private String accoun_id;
    private String dateAdd;

    public Wishlist() {
    }

    public Wishlist(int id, String product_id, String accoun_id, String dateAdd) {
        this.id = id;
        this.product_id = product_id;
        this.accoun_id = accoun_id;
        this.dateAdd = dateAdd;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getAccoun_id() {
        return accoun_id;
    }

    public void setAccoun_id(String accoun_id) {
        this.accoun_id = accoun_id;
    }

    public String getDateAdd() {
        return dateAdd;
    }

    public void setDateAdd(String dateAdd) {
        this.dateAdd = dateAdd;
    }

    @Override
    public String toString() {
        return "Wishlist{" + "id=" + id + ", product_id=" + product_id + ", accoun_id=" + accoun_id + ", dateAdd=" + dateAdd + '}';
    }
    
    
}
