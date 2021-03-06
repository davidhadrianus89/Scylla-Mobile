package com.scyllamobile.model;
// Generated Jun 8, 2017 5:46:44 AM by Hibernate Tools 4.3.1



/**
 * TUser generated by hbm2java
 */
public class TUser  implements java.io.Serializable {


     private String userId;
     private String userGroup;
     private String userPassword;
     private String email;
     private String telepon;
     private String statusActive;
     private String statusLogin;
     private String nama;
     private String roles;

    public TUser() {
    }

	
    public TUser(String userId) {
        this.userId = userId;
    }
    public TUser(String userId, String userGroup, String userPassword, String email, String telepon, String statusActive, String statusLogin, String nama, String roles) {
       this.userId = userId;
       this.userGroup = userGroup;
       this.userPassword = userPassword;
       this.email = email;
       this.telepon = telepon;
       this.statusActive = statusActive;
       this.statusLogin = statusLogin;
       this.nama = nama;
       this.roles = roles;
    }
   
    public String getUserId() {
        return this.userId;
    }
    
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getUserGroup() {
        return this.userGroup;
    }
    
    public void setUserGroup(String userGroup) {
        this.userGroup = userGroup;
    }
    public String getUserPassword() {
        return this.userPassword;
    }
    
    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getTelepon() {
        return this.telepon;
    }
    
    public void setTelepon(String telepon) {
        this.telepon = telepon;
    }
    public String getStatusActive() {
        return this.statusActive;
    }
    
    public void setStatusActive(String statusActive) {
        this.statusActive = statusActive;
    }
    public String getStatusLogin() {
        return this.statusLogin;
    }
    
    public void setStatusLogin(String statusLogin) {
        this.statusLogin = statusLogin;
    }
    public String getNama() {
        return this.nama;
    }
    
    public void setNama(String nama) {
        this.nama = nama;
    }
    public String getRoles() {
        return this.roles;
    }
    
    public void setRoles(String roles) {
        this.roles = roles;
    }




}


