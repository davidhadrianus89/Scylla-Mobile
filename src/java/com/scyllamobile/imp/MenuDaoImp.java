/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.imp;

import com.scyllamobile.dao.MenuDao;
import com.scyllamobile.util.HibernateUtilSQL;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author DPTI
 */
public class MenuDaoImp implements MenuDao {

    public SessionFactory sessionFactory = null;
    public Session session = null;

    public MenuDaoImp() {
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
    public List listMenu(String userId, String groupId) {
        List user = session.createQuery("Select um from TTreeMenu tm, TUserMenu um, TUser u "
                + "where tm.id.menuId = um.menuId and tm.id.userGroupId = u.userGroup "
                + "and  u.userGroup = '" + groupId + "' and u.userId = '"+ userId +"' order by tm.id.menuId").list();

        return user;
    }

}
