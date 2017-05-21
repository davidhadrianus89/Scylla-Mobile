/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.dao;

import com.scyllamobile.model.TProduct;
import java.util.List;

/**
 *
 * @author 201302118
 */
public interface ProductDao {

    public List listProduct();
    
    public List listProductBySellerid(String sellerid);
    
    public List listProductByStatus(String status);

    public int saveProduct(TProduct tProduct);

    public int deleteProduct(String productid);

    public int updateProduct(TProduct tProduct);
    
    public int updateProductStatus(String productid, String status);

    public TProduct getProduct(String productId);

    public int checkGProduct(String groupId);
}
