/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.imp;

import com.scyllamobile.util.HibernateUtilSQL;
import com.scyllamobile.dao.LoginDao;
import com.scyllamobile.model.TUser;
import com.scyllamobile.model.Users;
import com.scyllamobile.util.HibernateUtilOracle;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author Lenovo
 */
public class LoginDaoImp implements LoginDao {

    public Session session = null;

    public LoginDaoImp() {
        session = HibernateUtilOracle.getSessionFactory().openSession();
    //    session.beginTransaction();
    }


    @Override
    public int getLogin(String username, String password) {
        int result;
        try{
            Integer count;
            session.clear();
            count = Integer.valueOf(session.createQuery("Select count(1) from Users where email = '" + username + "'").list().get(0).toString());
            System.out.println("Masuk sini 1 : "+count);
            if (count > 0) {
                count = Integer.valueOf(session.createQuery("Select count(1) from Users where email = '" + username + "' and passwordHash = '" + password + "' ").list().get(0).toString());
                System.out.println("Masuk Sini 2 : "+count);
                if (count > 0) {
                    count = Integer.valueOf(session.createQuery("Select count(1) from Users where email = '" + username + "' and status =1").list().get(0).toString());
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
            System.out.println("Error Login Di Users nih : " + e.getMessage());
        }
        return result;
    }

    @Override
    public void getLogout(String user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Users dataUser(String email) {
        
        System.out.println("user ID :" + email);
        
        Users user = null;
        try {
            
            List<Users> list = session.createQuery("from Users where email = '"+email + "'").list(); // here should be something else than list()
            return (list.isEmpty() ? null : list.get(0));
            
//            user = (Users) session.get(Users.class, email);
        } catch (Exception e) {
            System.err.println("User Dao Imp : " + e.getMessage());
        }
        return user;
    }
    
    public static void main(String[] args) {
        LoginDaoImp imp = new LoginDaoImp();
        
        Users u = imp.dataUser("admin@yahoo.com");
        
        System.out.println("Full name " + u.getFullName());
    }
}