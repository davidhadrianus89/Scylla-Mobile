/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.controller1;

import com.google.gson.Gson;
import com.scyllamobile.dao.GroupDao;
import com.scyllamobile.dao.UserDao;
import com.scyllamobile.imp.GroupDaoImp;
import com.scyllamobile.imp.UserDaoImp;
import com.scyllamobile.model.TUser;
import com.scyllamobile.model.TUserGroup;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author DPTI
 */
@Controller
public class UserController {

    private Gson gson = new Gson();
    private UserDao userDao = new UserDaoImp();
    private GroupDao groupDao = new GroupDaoImp();

    @ResponseBody
    @RequestMapping(value = "/listUser", method = RequestMethod.GET)
    private String listUser(HttpServletRequest request) throws Exception {
        String result = "";
        //MASUK UserControll
        System.out.println("Masuk User Conttroller Server");
        try {
            JSONObject jsonObj = new JSONObject();
            jsonObj.put("listUser", userDao.getAllUser());
            result = jsonObj.toString();
        } catch (Exception e) {
            System.err.println("error - " + e.getMessage());
        }
        //System.out.println("controller -" + result);
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/saveUser", method = RequestMethod.POST)
    private String saveUser(HttpServletRequest request, @RequestBody String param) throws Exception {
        try {
            String result = "";
            //Masuk UserControll
            System.out.println("Save User Conttroller Server");

            JSONObject paramObj = new JSONObject(param);
            String userId = paramObj.getString("user");
            String email = paramObj.getString("email");
            String phone = paramObj.getString("phone");
            String group = paramObj.getString("group");
            String status = paramObj.getString("status");
            String action = paramObj.getString("action");

            System.out.println(userId + email + phone + group + status + action);

            //CHECK DUPLICATE USER
            if (action.equalsIgnoreCase("save")) {
                int count = userDao.checkUser(userId);
                if (count > 0) {
                    return "1";
                }
            }

            TUser user = new TUser();
            user.setUserId(userId);
            user.setUserPassword(userId);
            user.setEmail(email);
            user.setTelepon(phone);
            user.setStatusActive(status);
            user.setUserGroup(group);
            user.setStatusLogin("0");

            int ret = userDao.saveUser(user);
            System.out.println("status " + ret);
            if (ret == 0) {
                result = "0";
            } else {
                result = "1";
            }

            return result;
        } catch (Exception e) {
            return e.getMessage();
        }
    }

    @ResponseBody
    @RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
    private String deleteUser(HttpServletRequest request, @RequestBody String param) throws Exception {
        String result = "";
        System.out.println("Delete User Conttroller Server");
        JSONObject paramObj = new JSONObject(param);
        String userId = paramObj.getString("userId");

        System.out.println("id : " + userId);

        int status = userDao.deleteUser(userId);
        System.out.println("status " + status);
        if (status == 0) {
            result = "0";
        } else {
            result = "1";
        }

        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/getUser", method = RequestMethod.POST)
    private String getUser(HttpServletRequest request, @RequestBody String param) throws Exception {
        String result = "";
        try {
            System.out.println("Get Group");
            JSONObject paramObj = new JSONObject(param);
            String userId = paramObj.getString("userId");
            TUser user = userDao.dataUser(userId);

            JSONObject jsonObj = new JSONObject();
            jsonObj.put("user", user.getUserId());
            jsonObj.put("email", user.getEmail());
            jsonObj.put("phone", user.getTelepon());
            jsonObj.put("group", user.getUserGroup());
            jsonObj.put("status", user.getStatusActive());
            jsonObj.put("listGroup", groupDao.listGroup());

            System.out.println("json : " + jsonObj);
            result = jsonObj.toString();
        } catch (Exception e) {
            System.err.println("error - " + e.getMessage());
        }

        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/savePengaturan", method = RequestMethod.POST)
    private String savePengaturan(HttpServletRequest request, @RequestBody String param) throws Exception {
        String result = "";
        System.out.println("Save Pengaturan Conttroller Server");

        JSONObject paramObj = new JSONObject(param);
        String userId = paramObj.getString("user");
        String email = paramObj.getString("email");
        String phone = paramObj.getString("phone");

        System.out.println(userId + email + phone);

        int ret = userDao.savePengaturan(userId, email, phone);
        System.out.println("status " + ret);
        if (ret == 0) {
            result = "0";
        } else {
            result = "1";
        }
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    private String changePassword(HttpServletRequest request, @RequestBody String param) throws Exception {
        String result = "";
        System.out.println("Change Password Conttroller Server");

        JSONObject paramObj = new JSONObject(param);
        String userId = paramObj.getString("userId");
        String newPass = paramObj.getString("newPass");

        System.out.println(userId + newPass);

        int ret = userDao.changePassword(userId, newPass);
        System.out.println("status " + ret);
        if (ret == 0) {
            result = "0";
        } else {
            result = "1";
        }
        return result;
    }
}
