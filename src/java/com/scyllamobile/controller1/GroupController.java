/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.controller1;

import com.google.gson.Gson;
import com.scyllamobile.dao.GroupDao;
import com.scyllamobile.dao.TreeMenuDao;
import com.scyllamobile.imp.GroupDaoImp;
import com.scyllamobile.imp.TreeMenuDaoImp;
import com.scyllamobile.model.TTreeMenu;
import com.scyllamobile.model.TTreeMenuId;
import com.scyllamobile.model.TUserGroup;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Lenovo
 */
@Controller
public class GroupController {

    private Gson gson = new Gson();
    GroupDao groupDao = new GroupDaoImp();
    TreeMenuDao treeMenuDao = new TreeMenuDaoImp();

    @ResponseBody
    @RequestMapping(value = "/listGroup", method = RequestMethod.GET)
    private String listGroup(HttpServletRequest request) throws Exception {
        String result = "";
        //MASUK KE SERVER GRUP MANAGEMENT
        System.out.println("Masuk Group Conttroller Server");
        try {
            JSONObject jsonObj = new JSONObject();
            jsonObj.put("listGroup", groupDao.listGroup());
            result = jsonObj.toString();
        } catch (Exception e) {
            System.err.println("error - " + e.getMessage());
        }
        //System.out.println("controller -" + result);
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/getGroup", method = RequestMethod.POST)
    private String getGroup(HttpServletRequest request, @RequestBody String param) throws Exception {
        String result = "";
        try {
            System.out.println("Get Group");
            JSONObject paramObj = new JSONObject(param);
            String groupId = paramObj.getString("groupId");
            TUserGroup group = groupDao.getGroup(groupId);
            List listMenu = treeMenuDao.listTree(groupId);

            org.json.simple.JSONArray arMenu = new org.json.simple.JSONArray();
            for (int i = 0; i < listMenu.size(); i++) {
                org.json.simple.JSONObject jMenu = new org.json.simple.JSONObject();
                jMenu.put("menu", listMenu.get(i));
                arMenu.add(jMenu);
            }

            JSONObject jsonObj = new JSONObject();
            jsonObj.put("userGroupId", group.getUserGroupId());
            jsonObj.put("description", group.getDescription());
            jsonObj.put("status", group.getStatus());
            jsonObj.put("menu", arMenu);

            System.out.println("json : " + jsonObj);
            result = jsonObj.toString();
        } catch (Exception e) {
            System.err.println("error - " + e.getMessage());
        }

        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/updateGroup", method = RequestMethod.POST)
    private String updateGroup(HttpServletRequest request, @RequestBody String param) throws Exception {
        String result = "";
        System.out.println("Update Group Conttroller Server");
        JSONObject paramObj = new JSONObject(param);
        String groupId = paramObj.getString("groupId");
        String description = paramObj.getString("description");
        JSONArray listMenu = paramObj.getJSONArray("menu");
        List list = new ArrayList();
        for (int i = 0; i < listMenu.length(); i++) {
            JSONObject m = listMenu.getJSONObject(i);
            list.add(m.getString("menu").trim());
        }

        System.out.println(groupId + " - " + description);

        TUserGroup group = new TUserGroup();
        group.setUserGroupId(groupId);
        group.setStatus("1");
        group.setDescription(description);

        int status = groupDao.updateGroup(group);
        System.out.println("status " + status);
        if (status == 0) {
            //DELETE TREE EXIST
            treeMenuDao.deleteTreeMenu(groupId);

            //INSERT NEW TREE
            for (int i = 0; i < list.size(); i++) {
                TTreeMenuId menu = new TTreeMenuId();
                TTreeMenu tree = new TTreeMenu();
                menu.setUserGroupId(groupId);
                menu.setMenuId(list.get(i).toString());
                tree.setId(menu);
                status = treeMenuDao.saveTreeMenu(tree);
            }

            result = "0";
        } else {
            result = "1";
        }

        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/saveGroup", method = RequestMethod.POST)
    private String saveGroup(HttpServletRequest request, @RequestBody String param) throws Exception {
        String result = "";
        System.out.println("Save Group Conttroller Server");
        JSONObject paramObj = new JSONObject(param);
        String groupId = paramObj.getString("groupId");
        String description = paramObj.getString("description");
        JSONArray listMenu = paramObj.getJSONArray("menu");
        List list = new ArrayList();
        for (int i = 0; i < listMenu.length(); i++) {
            JSONObject m = listMenu.getJSONObject(i);
            list.add(m.getString("menu").trim());
        }

        System.out.println(groupId + " - " + description);
        System.out.println(list);

        TUserGroup group = new TUserGroup();
        group.setUserGroupId(groupId);
        group.setStatus("1");
        group.setDescription(description);

        int status = groupDao.saveGroup(group);
        System.out.println("status " + status);
        if (status == 0) {
            for (int i = 0; i < list.size(); i++) {
                TTreeMenuId menu = new TTreeMenuId();
                TTreeMenu tree = new TTreeMenu();
                menu.setUserGroupId(group.getUserGroupId());
                menu.setMenuId(list.get(i).toString());
                tree.setId(menu);
                status = treeMenuDao.saveTreeMenu(tree);
            }
            result = "0";
        } else {
            result = "1";
        }

        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/deleteGroup", method = RequestMethod.POST)
    private String deleteGroup(HttpServletRequest request, @RequestBody String param) throws Exception {
        String result = "";
        System.out.println("Delete Group Conttroller Server");
        JSONObject paramObj = new JSONObject(param);
        String groupId = paramObj.getString("groupId");

        System.out.println("id : " + groupId);

        //CHECK THIS GROUP HAS USER?? 
        int count = groupDao.checkGroup(groupId);
        System.out.println("Count User : " + count);
        if (count > 0) {
            result = "9";
        } else {

            int status = groupDao.deleteGroup(groupId);
            System.out.println("status " + status);
            if (status == 0) {
                status = treeMenuDao.deleteTreeMenu(groupId);
                result = "0";
            } else {
                result = "1";
            }
        }

        return result;
    }
}
