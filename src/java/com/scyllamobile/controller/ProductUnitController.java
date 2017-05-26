/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.controller;

import com.scyllamobile.dao.GroupProductDao;
import com.scyllamobile.dao.UnitProductDao;
import com.scyllamobile.imp.GroupProducDaotImp;
import com.scyllamobile.imp.UnitProductDaoImp;
import com.scyllamobile.model.TUnit;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author 201302118
 */
@Controller
public class ProductUnitController {
    
    @RequestMapping(value = "masterProductUnit", method = RequestMethod.GET)
    private ModelAndView masterProductUnit(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map map = new HashMap();
        
        ArrayList profile = (ArrayList) request.getSession().getAttribute("profil");
        
        if (profile == null || profile.isEmpty()) {
            return new ModelAndView("500");
        }
        
        try {
            
        String sellerid = profile.get(0).toString();

        UnitProductDao upd = new UnitProductDaoImp();

        map.put("list_unit", upd.listUnitBySellerid(sellerid));
            
        } catch (Exception e) {
            map.put("pesan", "session time out " + e.getMessage());
        }
        
        return new ModelAndView("body/product/masterProductUnit", map);
    }

    @RequestMapping(value = "addUnitProduct", method = RequestMethod.GET)
    private ModelAndView addUnitProduct(HttpServletRequest request, HttpServletResponse response) {
        Map map = new HashMap();
        String unitname = request.getParameter("name");
        String unitdesc = request.getParameter("desc");
        
        ArrayList profile = (ArrayList) request.getSession().getAttribute("profil");
        String sellerid = profile.get(0).toString();
        
        String act = request.getParameter("act");
        String viewer = "";

        try {
            GroupProductDao gpd = new GroupProducDaotImp();
            UnitProductDao upd = new UnitProductDaoImp();

            int counter = upd.checkUnit(unitdesc) + 1;

            TUnit tUnit = new TUnit();
            
            tUnit.setUnitid(String.valueOf(counter));
            tUnit.setSellerid(sellerid);
            tUnit.setUnitname(unitname);
            tUnit.setDescription(unitdesc);
            tUnit.setStatus(1);
            

            int ret = upd.saveUnit(tUnit);
            String result = "";
            
            map.put("pesan", "Add unit product success");
            map.put("list_unit", upd.listUnitBySellerid(sellerid));
            
            if (act.equals("1")) {
                viewer = "body/product/masterProductUnit";
            } else {
                viewer = "body/product/addProduct";
                map.put("list_group", gpd.listGroupBySellerid(sellerid));
            }

        } catch (Exception e) {
            //map.put("pesan", e.getMessage());

            System.out.println("error add group product : " + e.getMessage());
        }

        return new ModelAndView(viewer, map);
    }

    @RequestMapping(value = "editUnitProduct", method = RequestMethod.GET)
    private ModelAndView editUnitProduct(HttpServletRequest request, HttpServletResponse response) {
        Map map = new HashMap();
        String unitid = request.getParameter("unitid");
        String unitname = request.getParameter("name");
        String unitdesc = request.getParameter("desc");

        ArrayList profile = (ArrayList) request.getSession().getAttribute("profil");
        String sellerid = profile.get(0).toString();

        try {
            UnitProductDao upd = new UnitProductDaoImp();
            TUnit tUnit = new TUnit();
            
            tUnit.setUnitid(unitid);
            tUnit.setSellerid(sellerid);
            tUnit.setUnitname(unitname);
            tUnit.setDescription(unitdesc);
            tUnit.setStatus(1);

            int ret = upd.saveUnit(tUnit);

            map.put("pesan", "Edit group product success");
            map.put("list_unit", upd.listUnitBySellerid(sellerid));

        } catch (Exception e) {
            //map.put("pesan", e.getMessage());

            System.out.println("error unit group product : " + e.getMessage());
        }

        return new ModelAndView("body/product/masterProductUnit", map);
    }

    @RequestMapping(value = "deleteUnitProduct", method = RequestMethod.GET)
    private ModelAndView deleteUnitProduct(HttpServletRequest request, HttpServletResponse response) {
        Map map = new HashMap();
        String unitid = request.getParameter("unitid");

        ArrayList profile = (ArrayList) request.getSession().getAttribute("profil");
        String sellerid = profile.get(0).toString();

        try {
            UnitProductDao upd = new UnitProductDaoImp();

            int ret = upd.deleteUnit(unitid);

            map.put("pesan", "Delete group product success");
            map.put("list_unit", upd.listUnitBySellerid(sellerid));

        } catch (Exception e) {
            //map.put("pesan", e.getMessage());

            System.out.println("error edit unit product : " + e.getMessage());
        }

        return new ModelAndView("body/product/masterProductUnit", map);
    }
    
}
