/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.controller;

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
public class GroupMaintenanceController {

    String defUrl;
    CallWebServiceController serviceController = new CallWebServiceController();

    public GroupMaintenanceController() {

        PropertiesController pc = new PropertiesController();
        defUrl = pc.prop();
        System.out.println("URL : " + defUrl);
    }

    @RequestMapping(value = "groupMaintenance", method = RequestMethod.GET)
    private ModelAndView getListGroup(HttpServletRequest request, HttpServletResponse response, String pesan) throws IOException {
        Map map = new HashMap();
        try {
            ArrayList profile = (ArrayList) request.getSession().getAttribute("profil");
            String currGroup = profile.get(1).toString();
            System.out.println("Curr Group : " + currGroup);

            List listGroup = new ArrayList<>();
            //Call Service
            String url = defUrl + "listGroup";
            List retService = serviceController.callService(url);
            if ("0".equals(retService.get(0).toString())) {
                JSONObject jsonObject = new JSONObject(retService.get(1).toString());
                JSONArray arrayGroup = jsonObject.getJSONArray("listGroup");
                for (int i = 0; i < arrayGroup.length(); i++) {
                    JSONObject group = (JSONObject) arrayGroup.get(i);
                    Map list = new HashMap();
                    if (!"BUKOPIN".equals(currGroup)) {
                        if (!"BUKOPIN".equals(group.getString("userGroupId"))) {
                            list.put("groupId", group.getString("userGroupId"));
                            list.put("status", group.getString("status"));
                            list.put("desc", group.getString("description"));
                            listGroup.add(list);
                        }
                    } else {
                        list.put("groupId", group.getString("userGroupId"));
                        list.put("status", group.getString("status"));
                        list.put("desc", group.getString("description"));
                        listGroup.add(list);
                    }
                }
            }
            map.put("listGroup", listGroup);

            if (!pesan.isEmpty()) {
                map.put("response", pesan);
            }

        } catch (Exception e) {
            System.out.println("client - " + e.getMessage());
            map.put("response", e.getMessage());
        }
        return new ModelAndView("body/user/groupMaintenance", map);
    }

    @RequestMapping(value = "addGroup", method = RequestMethod.GET)
    private ModelAndView addGroup(HttpServletRequest request, HttpServletResponse response) throws IOException {
        return new ModelAndView("body/user/addGroup");
    }

    @RequestMapping(value = "saveGroup", method = RequestMethod.GET)
    private ModelAndView saveGroup(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map map = new HashMap();
        String groupId;
        String description;

        groupId = request.getParameter("groupId");
        description = request.getParameter("description");
        String menu[] = request.getParameterValues("menu");

        org.json.simple.JSONObject param = new org.json.simple.JSONObject();
        org.json.simple.JSONArray arMenu = new org.json.simple.JSONArray();
        for (int i = 0; i < menu.length; i++) {
            org.json.simple.JSONObject jMenu = new org.json.simple.JSONObject();
            jMenu.put("menu", menu[i]);
            arMenu.add(jMenu);
        }

        param.put("groupId", groupId);
        param.put("description", description);
        param.put("menu", arMenu);

        System.out.println("Param : " + param);
        String url = defUrl + "saveGroup";
        List retService = serviceController.callService(url, param);
        if ("0".equals(retService.get(0).toString())) {

            //return new ModelAndView("redirect:groupMaintenance");
            if ("0".equals(retService.get(1).toString().trim())) {
                return getListGroup(request, response, "Data Saved!");
            } else {
                map.put("pesan", "Save Failed! Duplicate Key Group");
                return new ModelAndView("body/user/addGroup", map);
            }

        } else {
            map.put("pesan", retService.get(1).toString());
            return new ModelAndView("body/user/addGroup", map);
        }
    }

    @RequestMapping(value = "doUpdateGroup", method = RequestMethod.GET)
    private ModelAndView doUpdateGroup(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map map = new HashMap();
        String groupId;
        String description;

        groupId = request.getParameter("groupId");
        description = request.getParameter("description");
        String menu[] = request.getParameterValues("menu");

        org.json.simple.JSONObject param = new org.json.simple.JSONObject();
        org.json.simple.JSONArray arMenu = new org.json.simple.JSONArray();

        for (int i = 0; i < menu.length; i++) {
            org.json.simple.JSONObject jMenu = new org.json.simple.JSONObject();
            jMenu.put("menu", menu[i]);
            arMenu.add(jMenu);
        }

        param.put("groupId", groupId);
        param.put("description", description);
        param.put("menu", arMenu);

        String url = defUrl + "updateGroup";
        List retService = serviceController.callService(url, param);
        if (retService.get(0).toString() == "0") {
            return new ModelAndView("redirect:groupMaintenance");
        } else {
            return new ModelAndView("body/user/addGroup");
        }
    }

    @RequestMapping(value = "updateGroup", method = RequestMethod.GET)
    private ModelAndView updateGroup(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map map = new HashMap();
        String groupId;
        groupId = request.getParameter("groupId");

        System.out.println("group id : " + groupId);

        org.json.simple.JSONObject param = new org.json.simple.JSONObject();
        param.put("groupId", groupId);

        String url = defUrl + "getGroup";
        List retService = serviceController.callService(url, param);
        if (retService.get(0).toString() == "0") {
            JSONObject group = new JSONObject(retService.get(1).toString());
            map.put("groupId", group.getString("userGroupId"));
            map.put("desc", group.getString("description"));
            map.put("status", group.getString("status"));
            JSONArray listMenu = group.getJSONArray("menu");
            List list = new ArrayList();
            for (int i = 0; i < listMenu.length(); i++) {
                JSONObject m = listMenu.getJSONObject(i);
                list.add(m.getString("menu").trim());
            }
            map.put("menu", list);

            System.out.println(list);
        }

        return new ModelAndView("body/user/editGroup", map);
    }

    @RequestMapping(value = "deleteGroup", method = RequestMethod.GET)
    private ModelAndView deleteGroup(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map map = new HashMap();
        String groupId;
        groupId = request.getParameter("groupId");

        System.out.println("group id : " + groupId);

        org.json.simple.JSONObject param = new org.json.simple.JSONObject();
        param.put("groupId", groupId);

        String url = defUrl + "deleteGroup";
        List retService = serviceController.callService(url, param);
        if ("0".equals(retService.get(0).toString())) {
            if ("0".equals(retService.get(1).toString())) {
                return getListGroup(request, response, "Delete Group Success!");
            } else {
                return getListGroup(request, response, "Delete Group Failed!. This Group has an Users");
            }
        } else {
            return getListGroup(request, response, "Delete Group Failed. " + retService.get(1).toString());
        }

    }
}
