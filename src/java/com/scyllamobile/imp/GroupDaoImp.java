/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.imp;

import com.scyllamobile.dao.GroupDao;
import com.scyllamobile.model.TUserGroup;
import com.scyllamobile.util.HibernateUtilSQL;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author DPTI
 */
public class GroupDaoImp implements GroupDao {

    //public SessionFactory sessionFactory = null;
    public Session session = null;

    public GroupDaoImp() {
        //sessionFactory = HibernateUtilSQL.getSessionFactory();
        //session = sessionFactory.openSession();
        session = HibernateUtilSQL.getSessionFactory().openSession();
    }

    @Override
    public List listGroup() {
        List group = session.createQuery("from TUserGroup").list();

        return group;
    }

    @Override
    public int saveGroup(TUserGroup userGroup) {
        int result = 1;
        try {
            session.save(userGroup);
            session.flush();
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
            TUserGroup group = (TUserGroup) session.get(TUserGroup.class, groupId);
            session.delete(group);
            session.flush();
            result = 0;
        } catch (Exception e) {
            result = 1;
            System.out.println("Group Dao Imp : " + e.getMessage());
        }
        return result;
    }

    @Override
    public TUserGroup getGroup(String groupId) {
        TUserGroup group = null;
        try {
            group = (TUserGroup) session.get(TUserGroup.class, groupId);
        } catch (Exception e) {
            System.err.println("Group Dao Imp : " + e.getMessage());
        }
        return group;
    }

    @Override
    public int updateGroup(TUserGroup userGroup) {
        int result = 1;
        try {
            TUserGroup group = (TUserGroup) session.get(TUserGroup.class, userGroup.getUserGroupId());
            group.setDescription(userGroup.getDescription());
            group.setStatus(userGroup.getStatus());
            session.update(group);
            session.flush();
            result = 0;
        } catch (Exception e) {
            result = 1;
            System.out.println("GroupDaoImp : " + e.getMessage());
        }
        return result;
    }

    @Override
    public int checkGroup(String groupId) {
         int count;
        try {
            session.clear();
            count = Integer.valueOf(session.createQuery("Select count(1) from TUser where userGroup = '" + groupId + "'").list().get(0).toString());
        } catch (Exception e) {
            count = 0;
        }
        return count;
    }

}
