/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.imp;

import com.scyllamobile.dao.UserDao;
import com.scyllamobile.model.TUser;
import com.scyllamobile.model.TUserGroup;
import com.scyllamobile.util.HibernateUtilSQL;
import java.util.List;
import org.apache.catalina.startup.Catalina;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author DPTI
 */
public class UserDaoImp implements UserDao {

    public SessionFactory sessionFactory = null;
    public Session session = null;
    public Transaction trx = null;

    public UserDaoImp() {
        sessionFactory = HibernateUtilSQL.getSessionFactory();
        session = sessionFactory.openSession();
    }

    public int cekCommit(Session Tsession) {
        if (Tsession.getTransaction().wasCommitted()) {
            Tsession.getTransaction().commit();
        }

        return 0;
    }

    @Override
    public List getUser(String username) {
        session.clear();
        List user = session.createQuery("from TUser where userId = '" + username + "'").list();

        return user;
    }

    @Override
    public List getAllUser() {
        session.clear();
        List user = session.createQuery("from TUser").list();
        return user;
    }

    @Override
    public int saveUser(TUser user) {
        int result = 1;
        try {
            session.clear();
            Transaction t = session.beginTransaction();
            
            session.saveOrUpdate(user);
            session.flush();
            t.commit();
            result = 0;
        } catch (Exception e) {
            result = 1;
            System.out.println("User Dao Imp : " + e.getMessage());
        }
        return result;
    }

    @Override
    public TUser dataUser(String userId) {
        TUser user = null;
        try {
            user = (TUser) session.get(TUser.class, userId);
        } catch (Exception e) {
            System.err.println("User Dao Imp : " + e.getMessage());
        }
        return user;
    }

    @Override
    public int deleteUser(String userId) {
        int result = 1;
        try {
            
            Transaction t = session.beginTransaction();

            TUser user = (TUser) session.get(TUser.class, userId);
            session.delete(user);
            session.flush();
            t.commit();
            result = 0;
        } catch (Exception e) {
            result = 1;
            System.out.println("User Dao Imp : " + e.getMessage());
        }
        return result;
    }

    @Override
    public int savePengaturan(String userId, String email, String phone) {
        int result;
        try {
            trx = session.beginTransaction();
            Query q = session.createQuery("Update TUser set email = '" + email + "', telepon = '" + phone + "' where userId = '" + userId + "' ");
            result = q.executeUpdate();
            trx.commit();
            result = 0;
        } catch (Exception e) {
            result = -1;
            trx.rollback();
            System.out.println("User Dao Imp : " + e.getMessage());
        }
        return result;
    }

    @Override
    public int changePassword(String userId, String newPassword) {
        int result;
        try {
            trx = session.beginTransaction();
            Query q = session.createQuery("Update TUser set userPassword = '" + newPassword + "' where userId = '" + userId + "' ");
            result = q.executeUpdate();
            trx.commit();
            result = 0;
        } catch (Exception e) {
            result = -1;
            trx.rollback();
            System.out.println("User Dao Imp : " + e.getMessage());
        }
        return result;
    }

    @Override
    public int checkUser(String username) {
        int count;
        try {
            count = Integer.valueOf(session.createQuery("Select count(1) from TUser where userId = '" + username + "'").list().get(0).toString());
        } catch (Exception e) {
            count = 0;
        }
        return count;
    }
}