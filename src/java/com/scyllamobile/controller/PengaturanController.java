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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author DPTI
 */
@Controller
public class PengaturanController {

    String defUrl;
    CallWebServiceController serviceController = new CallWebServiceController();

    public PengaturanController() {

        PropertiesController pc = new PropertiesController();
        defUrl = pc.prop();
        System.out.println("URL : " + defUrl);
    }

    @RequestMapping(value = "pengaturan", method = RequestMethod.GET)
    private ModelAndView getPengaturan(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map map = new HashMap();
        ArrayList profile = (ArrayList) request.getSession().getAttribute("profil");
        // System.out.println("pengaturan : " + profile);
        map.put("userid", profile.get(0));
        map.put("email", profile.get(3));
        map.put("phone", profile.get(4));
        map.put("password", profile.get(2));
        return new ModelAndView("body/pengaturan/pengaturan", map);
    }

    @RequestMapping(value = "savePengaturan", method = RequestMethod.GET)
    private ModelAndView savePengaturan(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map map = new HashMap();
        String userId = request.getParameter("user");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        ArrayList profile = (ArrayList) request.getSession().getAttribute("profil");
        map.put("password", profile.get(2));
        
        org.json.simple.JSONObject param = new org.json.simple.JSONObject();
        param.put("user", userId);
        param.put("email", email);
        param.put("phone", phone);

        System.out.println("Param : " + param);

        String url = defUrl + "savePengaturan";
        List retService = serviceController.callService(url, param);
        if (retService.get(0).toString() == "0") {
            map.put("userid", userId);
            map.put("email", email);
            map.put("phone", phone);
            
            return new ModelAndView("body/pengaturan/pengaturan", map);
        } else {    
            map.put("userid", profile.get(0));
            map.put("email", profile.get(3));
            map.put("phone", profile.get(4));
            map.put("pesan", "Gagal Ubah Pengaturan!");
            
            return new ModelAndView("body/pengaturan/pengaturan", map);
        }
    }

    @RequestMapping(value = "changePass", method = RequestMethod.GET)
    private ModelAndView changePass(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map map = new HashMap();
        String userId = request.getParameter("user");
        String newPass = request.getParameter("newPass");

        org.json.simple.JSONObject param = new org.json.simple.JSONObject();
        param.put("userId", userId);
        param.put("newPass", newPass);

        System.out.println("Param : " + param);
        ArrayList profile = (ArrayList) request.getSession().getAttribute("profil");
        map.put("userid", profile.get(0));
        map.put("email", profile.get(3));
        map.put("phone", profile.get(4));

        String url = defUrl + "changePassword";
        List retService = serviceController.callService(url, param);

        if (retService.get(0).toString() == "0") {
            System.out.println("return 0");
            map.put("pesan", "okk");
            return new ModelAndView("body/pengaturan/pengaturan", map);
        } else {

            map.put("pesan", "Gagal Ubah Pengaturan!");
            return new ModelAndView("body/pengaturan/pengaturan", map);
        }

    }

}
