/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.imp;

import com.scyllamobile.util.HibernateUtilSQL;
import com.scyllamobile.dao.LoginDao;
import org.hibernate.Session;

/**
 *
 * @author Lenovo
 */
public class LoginDaoImp implements LoginDao {

    public Session session = null;

    public LoginDaoImp() {
        session = HibernateUtilSQL.getSessionFactory().openSession();
    //    session.beginTransaction();
    }


    @Override
    public int getLogin(String username, String password) {
        int result;
        try{
            Integer count;
            session.clear();
            count = Integer.valueOf(session.createQuery("Select count(1) from TUser where userId = '" + username + "'").list().get(0).toString());
            System.out.println("Masuk sini 1 : "+count);
            if (count > 0) {
                count = Integer.valueOf(session.createQuery("Select count(1) from TUser where userId = '" + username + "' and userPassword = '" + password + "' ").list().get(0).toString());
                System.out.println("Masuk Sini 2 : "+count);
                if (count > 0) {
                    count = Integer.valueOf(session.createQuery("Select count(1) from TUser where userId = '" + username + "' and statusActive ='1'").list().get(0).toString());
                     if (count > 0) {
                         result = 0;
                     }else{
                         result = 3;
                     }
                } else {
                    result = 2;
                }
            } else {
                result = 1;
            }
        }catch(Exception e){
            result = 9;
            System.out.println("Error Login DI TUser nih : " + e.getMessage());
        }
        return result;
    }

    @Override
    public void getLogout(String user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}