/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.imp;

import com.scyllamobile.dao.UnitProductDao;
import com.scyllamobile.model.TUnit;
import com.scyllamobile.util.HibernateUtilSQL;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author 201302118
 */
public class UnitProductDaoImp implements UnitProductDao {

    public Session session = null;

    public UnitProductDaoImp() {
        //sessionFactory = HibernateUtilSQL.getSessionFactory();
        //session = sessionFactory.openSession();
        session = HibernateUtilSQL.getSessionFactory().openSession();
    }

    @Override
    public List listUnit() {
        List group = session.createQuery("from TUnit order by unitid").list();

        return group;
    }

    @Override
    public int saveUnit(TUnit tUnit) {
        int result = 1;
        try {

            Transaction t = session.beginTransaction();

            session.saveOrUpdate(tUnit);
            t.commit();
//            session.close();
            result = 0;
        } catch (Exception e) {
            result = 1;
            System.out.println("UnitProductImp : " + e.getMessage());
        }
        return result;
    }

    @Override
    public int deleteUnit(String unitId) {
        int result = 1;
        try {

            Transaction t = session.beginTransaction();

            TUnit tUnit = (TUnit) session.get(TUnit.class, unitId);
            session.delete(tUnit);
            session.flush();
            t.commit();
            result = 0;
        } catch (Exception e) {
            result = 1;
            System.out.println("UnitProductDao delete : " + e.getMessage());
        }
        return result;
    }

    @Override
    public int updateUnit(TUnit tUnit) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public TUnit getUnit(String unitId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int checkUnit(String unitId) {
        int count;
        try {
            session.clear();
            count = Integer.valueOf(session.createQuery("Select max(tu.unitid) from TUnit tu").list().get(0).toString());
        } catch (Exception e) {
            count = 0;
        }
        return count;
    }

    @Override
    public List listUnitBySellerid(String sellerid) {
        List group = session.createQuery("from TUnit where sellerid='" +sellerid + "' order by unitid").list();

        return group;
    }

}
