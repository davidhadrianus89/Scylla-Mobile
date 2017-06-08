/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.dao;

import com.scyllamobile.model.Devices;
import java.util.List;

/**
 *
 * @author tsuuy
 */
public interface DeviceDao {
    
    public List listDevice() throws Exception;
    
    public List listDeviceById(String id) throws Exception;

    public int saveDevice(Devices devices) throws Exception;

    public int deleteDevice(String id) throws Exception;

    public int updateDevice(Devices devices) throws Exception;

    public Devices getDevice(String id) throws Exception;
    
    public int checkDevice(String id) throws Exception;
    
}
