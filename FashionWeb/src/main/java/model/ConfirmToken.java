/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class ConfirmToken {
    private int id;
    private String token;
    private String createAt;
    private String expireAt;
    private String confirmAt;
    private String accID;

    public ConfirmToken() {
    }

    public ConfirmToken(int id, String token, String createAt, String expireAt, String confirmAt, String accID) {
        this.id = id;
        this.token = token;
        this.createAt = createAt;
        this.expireAt = expireAt;
        this.confirmAt = confirmAt;
        this.accID = accID;
    }

    public ConfirmToken(String token, String createAt, String expireAt, String confirmAt, String accID) {
        this.token = token;
        this.createAt = createAt;
        this.expireAt = expireAt;
        this.confirmAt = confirmAt;
        this.accID = accID;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public String getExpireAt() {
        return expireAt;
    }

    public void setExpireAt(String expireAt) {
        this.expireAt = expireAt;
    }

    public String getConfirmAt() {
        return confirmAt;
    }

    public void setConfirmAt(String confirmAt) {
        this.confirmAt = confirmAt;
    }

    public String getAccID() {
        return accID;
    }

    public void setAccID(String accID) {
        this.accID = accID;
    }

    @Override
    public String toString() {
        return "ConfirmToken{" + "id=" + id + ", token=" + token + ", createAt=" + createAt + ", expireAt=" + expireAt + ", confirmAt=" + confirmAt + ", accID=" + accID + '}';
    }
    
    
}
