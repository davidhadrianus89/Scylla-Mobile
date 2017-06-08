/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.dao;

import com.scyllamobile.model.Roles;
import java.util.List;

/**
 *
 * @author tsuuy
 */
public interface RoleDao {
    
    public List listRole() throws Exception;
    
    public List listRoleById(String id) throws Exception;

    public int saveRole(Roles roles) throws Exception;

    public int deleteRole(String id) throws Exception;

    public int updateRole(Roles roles) throws Exception;

    public Roles getRole(String id) throws Exception;
    
    public int checkRole(String id) throws Exception;
    
}
