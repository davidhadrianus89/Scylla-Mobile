/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.imp;

import com.scyllamobile.dao.GroupProductDao;
import com.scyllamobile.model.TGroup;
import com.scyllamobile.util.HibernateUtilSQL;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author 201302118
 */
public class GroupProducDaotImp implements GroupProductDao {

    public Session session = null;

    public GroupProducDaotImp() {
        //sessionFactory = HibernateUtilSQL.getSessionFactory();
        //session = sessionFactory.openSession();
        session = HibernateUtilSQL.getSessionFactory().openSession();
    }

    @Override
    public List listGroup() {

        List group = session.createQuery("from TGroup order by groupid").list();

        return group;
    }

    @Override
    public int saveGroup(TGroup tGroup) {
        int result = 1;
        try {

            Transaction t = session.beginTransaction();

            session.saveOrUpdate(tGroup);
            t.commit();
//            session.close();
            result = 0;
        } catch (Exception e) {
            result = 1;
            System.out.println("GroupDaoImp : " + e.getMessage());
        }
        return result;
    }

    @Override
    public int deleteGroup(String groupId) {
        int result = 1;
        try {

            Transaction t = session.beginTransaction();

            TGroup tGroup = (TGroup) session.get(TGroup.class, groupId);
            session.delete(tGroup);
            session.flush();
            t.commit();
            result = 0;
        } catch (Exception e) {
            result = 1;
            System.out.println("GroupDaoImp : " + e.getMessage());
        }
        return result;
    }

    @Override
    public int updateGroup(TGroup tGroup) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public TGroup getGroup(String groupId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int checkGroup(String groupId) {
        int count;
        try {
            session.clear();
            count = Integer.valueOf(session.createQuery("Select max(tg.groupid) from TGroup tg").list().get(0).toString());
        } catch (Exception e) {
            count = 0;
        }
        return count;
    }

    @Override
    public List listGroupBySellerid(String sellerid) {
        List group = session.createQuery("from TGroup where sellerid='" + sellerid  +"' order by groupid").list();
        
        return group;
    }

}
