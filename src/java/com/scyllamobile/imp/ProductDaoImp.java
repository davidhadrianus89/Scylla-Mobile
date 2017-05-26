/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.imp;

import com.scyllamobile.dao.ProductDao;
import com.scyllamobile.model.TProduct;
import com.scyllamobile.util.HibernateUtilSQL;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author 201302118
 */
public class ProductDaoImp implements ProductDao{
    
    public SessionFactory sessionFactory = null;
    public Session session = null;
    public Transaction trx = null;

    public ProductDaoImp() {
        sessionFactory = HibernateUtilSQL.getSessionFactory();
        session = sessionFactory.openSession();
    }

    @Override
    public List listProduct() {
        session.clear();
        
        String hql = "from TProduct e join fetch e.TGroup g"
                    + " join fetch e.TUnit u"
                    + " order by e.idProduct";
        
        List group = session.createQuery(hql).list();
        
        session.close();

        return group;
    }

    @Override
    public int saveProduct(TProduct tProduct) {
        int result = 1;
        try {
            
            session.clear();

            trx = session.beginTransaction();

            session.saveOrUpdate(tProduct);
            trx.commit();
//            session.close();
            result = 0;
        } catch (Exception e) {
            result = 1;
            System.out.println("GroupDaoImp : " + e.getMessage());
        }
        return result;
    }

    @Override
    public int deleteProduct(String productId) {
        int result = 1;
        try {

            Transaction t = session.beginTransaction();

            TProduct tProduct = (TProduct) session.get(TProduct.class, productId);
            session.delete(tProduct);
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
    public int updateProduct(TProduct tProduct) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public TProduct getProduct(String productId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int checkGProduct(String groupId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List listProductBySellerid(String sellerid) {
        List group = session.createQuery("from TProduct where seller order by idProduct").list();

        return group;
    }

    @Override
    public List listProductByStatus(String status) {
        List group = session.createQuery("from TProduct where status="+ status +" order by idProduct").list();

        return group;
    }

    @Override
    public int updateProductStatus(String productid, String status) {
    int result;
        try {
            trx = session.beginTransaction();
            Query q = session.createQuery("Update TProduct set status = " + status + " where idProduct = '" + productid + "' ");
            result = q.executeUpdate();
            trx.commit();
            result = 0;
        } catch (Exception e) {
            result = -1;
            trx.rollback();
            System.out.println("Product Dao Imp : " + e.getMessage());
        }
        return result;    
    }
    
}
