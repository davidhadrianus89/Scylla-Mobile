/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.dao;

/**
 *
 * @author DPTI
 */
public interface LoginDao {

    public int getLogin(String username, String password);

    public void getLogout(String user);
}
