/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.dao;

import com.scyllamobile.model.TGroup;
import com.scyllamobile.model.TUnit;
import java.util.List;

/**
 *
 * @author 201302118
 */
public interface UnitProductDao {
    public List listUnit();
    
    public List listUnitBySellerid(String sellerid);

    public int saveUnit(TUnit tUnit);

    public int deleteUnit(String unitId);

    public int updateUnit(TUnit tUnit);

    public TUnit getUnit(String unitId);
    
    public int checkUnit(String unitId);
    
}
