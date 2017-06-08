/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.imp;

import com.scyllamobile.dao.RoleDao;
import com.scyllamobile.model.Roles;
import com.scyllamobile.util.HibernateUtilOracle;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author tsuuy
 */
public class RoleDaoImp implements RoleDao{
    
    public SessionFactory sessionFactory = null;
    public Session session = null;
    public Transaction trx = null;

    public RoleDaoImp() {
        
    }
    
    public void openSess(){
        session= HibernateUtilOracle.getSessionFactory().openSession();
    }
    
    public void closeSess(){
        session.clear();
        session.close();
    }

    @Override
    public List listRole() throws Exception {
        this.openSess();
        
        List role = session.createQuery("from Roles").list();
        
        this.closeSess();
        
        return role;
    }

    @Override
    public List listRoleById(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int saveRole(Roles roles) throws Exception {
        this.openSess();
        trx = session.beginTransaction();
        
        session.saveOrUpdate(roles);
        session.flush();
        trx.commit();
        
        this.closeSess();
        return 0;
    }

    @Override
    public int deleteRole(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int updateRole(Roles roles) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Roles getRole(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int checkRole(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
