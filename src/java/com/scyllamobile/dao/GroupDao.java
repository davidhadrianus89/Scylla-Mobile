/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.dao;

import com.scyllamobile.model.TUserGroup;
import java.util.List;

/**
 *
 * @author DPTI
 */
public interface GroupDao {

    public List listGroup();

    public int saveGroup(TUserGroup userGroup);

    public int deleteGroup(String groupId);

    public int updateGroup(TUserGroup userGroup);

    public TUserGroup getGroup(String groupId);
    
    public int checkGroup(String groupId);
}
