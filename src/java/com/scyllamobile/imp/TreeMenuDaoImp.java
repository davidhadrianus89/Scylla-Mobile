/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.imp;

import com.scyllamobile.dao.TreeMenuDao;
import com.scyllamobile.model.TTreeMenu;
import com.scyllamobile.util.HibernateUtilSQL;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author DPTI
 */
public class TreeMenuDaoImp implements TreeMenuDao {

    public SessionFactory sessionFactory = null;
    public Session session = null;
    public Transaction trx= null;

    public TreeMenuDaoImp() {
        sessionFactory = HibernateUtilSQL.getSessionFactory();
        session = sessionFactory.openSession();
    }

    @Override
    public int saveTreeMenu(TTreeMenu treeMenu) {
        int result = 1;
        try {
            session.clear();
            session.save(treeMenu);
            session.flush();
            result = 0;
        } catch (Exception e) {
            result = 1;
            System.out.println("TreeDaoImp : " + e.getMessage());
        }
        return result;
    }

    @Override
    public int deleteTreeMenu(String groupId) {
        int result;
        try {
            trx = session.beginTransaction();
            Query q = session.createQuery("Delete from TTreeMenu where id.userGroupId = '" + groupId + "' ");
            result = q.executeUpdate();
            trx.commit();
        } catch (Exception e) {
            trx.rollback();
            result = -1;
            System.out.println("Tree Dao Imp : " + e.getMessage());
        }
        return result;
    }

    @Override
    public List listTree(String groupId) {
        List treeMenu = session.createQuery("Select id.menuId from TTreeMenu where id.userGroupId = '"+ groupId +"' ").list();
        return treeMenu;
    }

}
