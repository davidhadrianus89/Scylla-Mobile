/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.controller;

import com.google.gson.Gson;
import com.scyllamobile.dao.GroupProductDao;
import com.scyllamobile.dao.UnitProductDao;
import com.scyllamobile.imp.GroupProducDaotImp;
import com.scyllamobile.imp.UnitProductDaoImp;
import com.scyllamobile.model.TGroup;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author 201302118
 */
@Controller
public class ProductGroupController {

    @RequestMapping(value = "masterProductGroup", method = RequestMethod.GET)
    private ModelAndView masterProductGroup(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map map = new HashMap();
        
        ArrayList profile = (ArrayList) request.getSession().getAttribute("profil");
        
        if (profile == null || profile.isEmpty()) {
            return new ModelAndView("500");
        }

        try {
            GroupProductDao gpd = new GroupProducDaotImp();
            String sellerid = profile.get(0).toString();

            map.put("list_group", gpd.listGroupBySellerid(sellerid));

        } catch (Exception e) {
            map.put("pesan", "session time out" + e.getMessage());
        }

        return new ModelAndView("body/product/masterProductGroup", map);
    }

    @RequestMapping(value = "addGroupProduct", method = RequestMethod.GET)
    private ModelAndView addGroupProduct(HttpServletRequest request, HttpServletResponse response) {
        Map map = new HashMap();
        String groupname = request.getParameter("name");
        String groupdesc = request.getParameter("desc");

        String act = request.getParameter("act");
        String viewer = "";

        try {
            GroupProductDao gpd = new GroupProducDaotImp();
            UnitProductDao upd = new UnitProductDaoImp();

            ArrayList profile = (ArrayList) request.getSession().getAttribute("profil");
            String sellerid = profile.get(0).toString();

            System.out.println("seller id : " + sellerid);

            int counter = gpd.checkGroup(groupdesc) + 1;

            TGroup group = new TGroup(String.valueOf(counter), sellerid, groupname, groupdesc, 1);

            int ret = gpd.saveGroup(group);

            map.put("pesan", "Add group product success");
            map.put("list_group", gpd.listGroupBySellerid(sellerid));

            if (act.equals("1")) {
                viewer = "body/product/masterProductGroup";
            } else {
                viewer = "body/product/addProduct";
                map.put("list_unit", upd.listUnit());
            }

        } catch (Exception e) {
            //map.put("pesan", e.getMessage());

            System.out.println("error add group product : " + e.getMessage());
        }

        return new ModelAndView(viewer, map);
    }

    @RequestMapping(value = "editGroupProduct", method = RequestMethod.GET)
    private ModelAndView editGroupProduct(HttpServletRequest request, HttpServletResponse response) {
        Map map = new HashMap();
        String groupid = request.getParameter("groupid");
        String sellerid = request.getParameter("sellerid");
        String groupname = request.getParameter("name");
        String groupdesc = request.getParameter("desc");

        try {
            GroupProductDao gpd = new GroupProducDaotImp();
            TGroup group = new TGroup(groupid, sellerid, groupname, groupdesc, 1);

            int ret = gpd.saveGroup(group);

            map.put("pesan", "Edit group product success");
            map.put("list_group", gpd.listGroupBySellerid(sellerid));

        } catch (Exception e) {
            //map.put("pesan", e.getMessage());

            System.out.println("error edit group product : " + e.getMessage());
        }

        return new ModelAndView("body/product/masterProductGroup", map);
    }

    @RequestMapping(value = "deleteGroupProduct", method = RequestMethod.GET)
    private ModelAndView deleteGroupProduct(HttpServletRequest request, HttpServletResponse response) {
        Map map = new HashMap();
        String groupid = request.getParameter("groupid");
        ArrayList profile = (ArrayList) request.getSession().getAttribute("profil");
        String sellerid = profile.get(0).toString();

        try {
            GroupProductDao gpd = new GroupProducDaotImp();

            int ret = gpd.deleteGroup(groupid);

            map.put("pesan", "Delete group product success");
            map.put("list_group", gpd.listGroupBySellerid(sellerid));

        } catch (Exception e) {
            map.put("pesan", e.getMessage());

            System.out.println("error edit group product : " + e.getMessage());
        }

        return new ModelAndView("body/product/masterProductGroup", map);
    }

    @RequestMapping(value = "getGroupProduct", method = RequestMethod.GET)
    private ModelAndView getGroupProduct(HttpServletRequest request, HttpServletResponse response) {
        Map map = new HashMap();

        Gson gson = new Gson();
        JSONObject json;

        try {
            GroupProductDao gpd = new GroupProducDaotImp();
            UnitProductDao upd = new UnitProductDaoImp();

            ArrayList profile = (ArrayList) request.getSession().getAttribute("profil");
            String sellerid = profile.get(0).toString();

            map.put("list_group", gpd.listGroupBySellerid(sellerid));
            //map.put("list_unit", upd.listUnit());

            System.out.println("JSON OBJ : " + new JSONObject(map).toString());

        } catch (Exception e) {
            //map.put("pesan", e.getMessage());

            System.out.println("error add group product : " + e.getMessage());
        }

        return new ModelAndView("body/product/addProduct", map);
    }

}
