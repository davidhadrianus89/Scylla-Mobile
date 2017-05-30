/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.impapi;

import com.scyllamobile.dao.MasterDao;
import com.scyllamobile.util.HibernateUtilOracle;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author tsuuy
 */
public class MasterDaoImp implements MasterDao{
    
    public Session session =null;
    
    public MasterDaoImp(){
        session = HibernateUtilOracle.getSessionFactory().openSession();
    }

    @Override
    public List getMaster(String mslsno, String mtgl) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List getMaster(String tablename, String mslsno, String mtgl) throws Exception {
        
        session = HibernateUtilOracle.getSessionFactory().openSession();
        
        String hql ="";
        
        if(tablename.equals("Mblfparam")){
            hql = "from " + tablename + " where slsno='" + mslsno + "' and mtgl='" + mtgl + "'";
        }else{
            hql = "from " + tablename + " where mslsno='" + mslsno + "' and mtgl='" + mtgl + "'";
        }
        
        

          List  mblList = session.createQuery(hql).list();

            session.clear();
            session.close();
            return mblList;
    }
    
}
