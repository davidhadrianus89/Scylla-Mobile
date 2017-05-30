/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.dao;

import java.util.List;

/**
 *
 * @author tsuuy
 */
public interface MasterDao {
    
    public List getMaster(String mslsno, String mtgl) throws Exception;
    public List getMaster(String tablename, String mslsno, String mtgl) throws Exception;
    
}
