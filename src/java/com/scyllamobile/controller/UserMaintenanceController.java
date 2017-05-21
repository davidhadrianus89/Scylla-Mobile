/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.controller;

import com.scyllamobile.dao.GroupDao;
import com.scyllamobile.dao.UserDao;
import com.scyllamobile.imp.GroupDaoImp;
import com.scyllamobile.imp.UserDaoImp;
import com.scyllamobile.model.TUser;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author DPTI
 */
@Controller
public class UserMaintenanceController {

    String defUrl;
    CallWebServiceController serviceController = new CallWebServiceController();

    public UserMaintenanceController() {

        PropertiesController pc = new PropertiesController();
        defUrl = pc.prop();
        System.out.println("URL : " + defUrl);
    }

    @RequestMapping(value = "userMaintenance", method = RequestMethod.GET)
    private ModelAndView getListUser(HttpServletRequest request, HttpServletResponse response, String pesan) throws IOException {
        Map map = new HashMap();
        ArrayList profile = (ArrayList) request.getSession().getAttribute("profil");
        String currGroup = profile.get(1).toString();
        
        
        System.out.println("test user maintenance");
        
        try {
           UserDao ud = new UserDaoImp();
           
            map.put("listUser", ud.getAllUser());
            map.put("response", pesan);
//            System.out.println("map : " + map.toString());

        } catch (Exception e) {
            map.put("response", e.getMessage());
            System.out.println("client - " + e.getMessage());
        }
        return new ModelAndView("body/user/userMaintenance", map);
    }

    @RequestMapping(value = "addUser", method = RequestMethod.GET)
    private ModelAndView addUser(HttpServletRequest request, HttpServletResponse response, String pesan) throws IOException {
        Map map = new HashMap();
        try {
            List listGroup = new ArrayList<>();
            //Call Service
            String url = defUrl + "listGroup";
            List retService = serviceController.callService(url);
            if (retService.get(0).toString() == "0") {
                JSONObject jsonObject = new JSONObject(retService.get(1).toString());
                JSONArray arrayGroup = jsonObject.getJSONArray("listGroup");
                for (int i = 0; i < arrayGroup.length(); i++) {
                    JSONObject group = (JSONObject) arrayGroup.get(i);
                    Map list = new HashMap();
                    list.put("groupId", group.getString("userGroupId"));
                    list.put("status", group.getString("status"));
                    list.put("desc", group.getString("description"));
                    listGroup.add(list);
                }
            }
            map.put("listGroup", listGroup);

            if (!pesan.isEmpty()) {
                map.put("pesan", pesan);
            }
        } catch (Exception e) {
            System.out.println("client - " + e.getMessage());
        }
        return new ModelAndView("body/user/addUser", map);
    }

    @RequestMapping(value = "saveUser", method = RequestMethod.GET)
    private ModelAndView saveUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map map = new HashMap();
        String groupId;
        String user;
        String email;
        String phone;
        String status;
        String action;

        groupId = request.getParameter("group");
        user = request.getParameter("user");
        email = request.getParameter("email");
        phone = request.getParameter("phone");
        status = request.getParameter("status");
        action = request.getParameter("action");
        
        TUser u = new TUser();

        u.setUserGroup(groupId);
        u.setUserId(user);
        u.setEmail(email);
        u.setTelepon(phone);
        u.setStatusActive(status);
        u.setUserPassword(user);
        u.setStatusLogin(status);
        
        
        UserDao ud = new UserDaoImp();
        
        int ret = ud.saveUser(u);
        
        if (ret == 0) {

                return getListUser(request, response, "Data Saved!");

        } else {
            map.put("pesan", "Update failed");
            return new ModelAndView("body/user/adduser", map);
        }
    }

    @RequestMapping(value = "deleteUser", method = RequestMethod.GET)
    private ModelAndView deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map map = new HashMap();
        String userId;
        userId = request.getParameter("userId");
        
        System.out.println("USER ID : " + userId);
        
        
        UserDao ud = new UserDaoImp();
        
        int ret = ud.deleteUser(userId);

        if (ret == 0) {

            return getListUser(request, response, "Delete User Success!");
        } else {
            return getListUser(request, response, "Delete User Failed. ");
        }
    }

    @RequestMapping(value = "updateUser", method = RequestMethod.GET)
    private ModelAndView updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map map = new HashMap();
        String userId;
        userId = request.getParameter("userId");
        
        UserDao ud = new UserDaoImp();
        
        TUser user = ud.dataUser(userId);        
        
        if (!user.getUserId().isEmpty()) {
            
            
            map.put("user", user.getUserId());
            map.put("email", user.getEmail());
            map.put("phone", user.getTelepon());
            map.put("group", user.getUserGroup());
            map.put("status", user.getStatusActive());
            
            GroupDao gd = new GroupDaoImp();
            
            map.put("listGroup", gd.listGroup());

        } else {
            map.put("pesan", "error edit data user");
        }

        return new ModelAndView("body/user/editUser", map);
    }
}
