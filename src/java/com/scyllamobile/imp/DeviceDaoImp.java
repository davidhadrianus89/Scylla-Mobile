/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.imp;

import com.scyllamobile.dao.DeviceDao;
import com.scyllamobile.model.Devices;
import com.scyllamobile.util.HibernateUtilOracle;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author tsuuy
 */
public class DeviceDaoImp implements DeviceDao{
    
    public SessionFactory sessionFactory = null;
    public Session session = null;
    public Transaction trx = null;
    
    public void openSess(){
        session= HibernateUtilOracle.getSessionFactory().openSession();
    }
    
    public void closeSess(){
        session.clear();
        session.close();
    }

    @Override
    public List listDevice() throws Exception {
        this.openSess(); 
        
        String hql = "from Devices d join fetch d.users u";
        
        List device = session.createQuery(hql).list();
        
        this.closeSess();
        
        return device;
    }

    @Override
    public List listDeviceById(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int saveDevice(Devices devices) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int deleteDevice(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int updateDevice(Devices devices) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Devices getDevice(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int checkDevice(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
