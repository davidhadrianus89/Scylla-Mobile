/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.dao;

import com.scyllamobile.model.TUser;
import java.util.List;

/**
 *
 * @author DPTI
 */
public interface UserDao {

    public List getUser(String username);
    
    public int checkUser(String username);

    public TUser dataUser(String userId);

    public List getAllUser();

    public int saveUser(TUser user);

    public int deleteUser(String userId);
    
    public int savePengaturan(String userId, String email, String phone);
    
    public int changePassword(String userId, String newPassword);
}
