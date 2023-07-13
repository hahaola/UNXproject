/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


public class Feedback {
    private int id;
    private String accID;
    private String product_id;
    private String comment;
    private int rating;
    private String createAt;

    public Feedback(int id, String accID, String product_id, String comment, int rating, String createAt) {
        this.id = id;
        this.accID = accID;
        this.product_id = product_id;
        this.comment = comment;
        this.rating = rating;
        this.createAt = createAt;
    }

    public Feedback(String accID, String product_id, String comment, int rating) {
        this.accID = accID;
        this.product_id = product_id;
        this.comment = comment;
        this.rating = rating;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccID() {
        return accID;
    }

    public void setAccID(String accID) {
        this.accID = accID;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    @Override
    public String toString() {
        return "Feedback{" + "id=" + id + ", accID=" + accID + ", product_id=" + product_id + ", comment=" + comment + ", rating=" + rating + ", createAt=" + createAt + '}';
    }
    
    
}
