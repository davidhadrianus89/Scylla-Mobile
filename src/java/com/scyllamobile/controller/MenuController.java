/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.controller;

import com.scyllamobile.dao.MenuDao;
import com.scyllamobile.imp.MenuDaoImp;
import com.scyllamobile.model.Menuuser;

import java.util.List;
import org.springframework.stereotype.Controller;

/**
 *
 * @author Rustanian
 */
@Controller
public class MenuController {

    List<Object[]> resultsx;
    MenuDao menuDao = new MenuDaoImp();

    protected String getMenu(String userId, String groupId) throws Exception {
        String menu = "";
        List listMenu = menuDao.listMenu(userId, groupId);
        String menuid="";
        
        
        for (int i = 0; i < listMenu.size(); i++) {
            Menuuser userMenu = (Menuuser) listMenu.get(i);
            
            menuid = userMenu.getMenuId();
            
            if(userMenu.getMenuParent().equals("0")){
                
                String child = checkChild(listMenu, menuid);
                
                //onclick=\"loadPage('" + userMenu.getMenuAddress() + "')\"
                
                    menu += "<li><a href=\"#\" >"
                            + "<i class=\"fa fa-sitemap\"></i> "
                            + "<span class=\"nav-label\">" + userMenu.getMenuName() + "</span></a>\n"
                            + child
                            + "</li>";
            }
        }
        
         menu += "<li>\n"
                    + "<a href=\"#\" onclick=\"loadPage('addProduct')\"><i class=\"fa fa-gear\"></i> <span class=\"nav-label\">SETTINGS </span></a>\n"
                    + "</li>";

        return menu;
    }
    
    public String checkChild(List listMenu, String menuid){
        String child ="";
        String menu ="";
        
        for (int i = 0; i < listMenu.size(); i++) {
            Menuuser userMenu = (Menuuser) listMenu.get(i);
            
            String parent = userMenu.getMenuParent();
            
            if(parent.equals(menuid)){            
                    child += "<li><a href=\"#\" onclick=\"loadPage('" + userMenu.getMenuAddress() + "')\">" + userMenu.getMenuName() + "</a><li>";
            }
        }
        
        if(!child.equals("")){
            menu += "<ul class=\"nav nav-second-level\">"
                  + child
                  +"</ul>";
        }
        
        return menu;
    }
    
}
