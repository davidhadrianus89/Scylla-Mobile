/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.dao;

import com.scyllamobile.model.TTreeMenu;
import java.util.List;

/**
 *
 * @author DPTI
 */
public interface TreeMenuDao {

    public int saveTreeMenu(TTreeMenu treeMenu);

    public int deleteTreeMenu(String groupId);

    public List listTree(String groupId);
}
