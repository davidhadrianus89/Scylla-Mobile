/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Rustanian
 */
@Controller
public class SessionController {

    Gson gson = new Gson();
    String defUrl;
    LoginController loginController = new LoginController();

    public void getPropUrl() {

        PropertiesController pc = new PropertiesController();

        defUrl = pc.prop();

        System.out.println("URL : " + defUrl);
    }

    public int secureURL(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int ret=9;
        
        ArrayList profile = (ArrayList) request.getSession().getAttribute("profil");
//        String sellerid = profile.get(0).toString();
        
//        System.out.println("profile " + profile + " -- " + sellerid);
        
        if (profile.isEmpty()) {
            ret=1;
        }else{
            ret=0;
        }
        //request.getSession().removeAttribute("profil");
        return ret;
    }
    
    @RequestMapping(value = "/removeSession", method = RequestMethod.GET)
    public @ResponseBody
    String cekSession(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String ret = "";
        String ret_logout = "";
        String note = "";
        ret_logout = loginController.logout(request);
        if (ret_logout.contains("sukses")) {
//            System.out.println("sukses logout " + ret);
            ret = "0#sukses Logout";
        } else {
//            System.out.println("err logout " + ret);
            ret = "1#Session is denied please login again";
        }
        //read note || check tanggallogin
        Token token = new Token();
        Date date = new Date();
        String abc[];
        DateFormat formathari = new SimpleDateFormat("yyyyMMdd");
        String hari = formathari.format(date);
        String tanggal = "";

        return ret;

    }
}
