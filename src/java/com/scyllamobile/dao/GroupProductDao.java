/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.dao;


import com.scyllamobile.model.TGroup;
import java.util.List;

/**
 *
 * @author 201302118
 */
public interface GroupProductDao {
    
    public List listGroup();
    
    public List listGroupBySellerid(String sellerid);

    public int saveGroup(TGroup tGroup);

    public int deleteGroup(String groupId);

    public int updateGroup(TGroup tGroup);

    public TGroup getGroup(String groupId);
    
    public int checkGroup(String groupId);
    
}
