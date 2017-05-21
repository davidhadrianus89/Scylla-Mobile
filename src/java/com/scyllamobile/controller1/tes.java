/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.controller1;

import javax.servlet.http.HttpServletRequest;
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
public class tes {
    @ResponseBody
    @RequestMapping(value = "/doLogintes", method = RequestMethod.GET)
    private String doLogin(HttpServletRequest request, @RequestBody String login) throws Exception { 
        try {
            System.out.println("Masuk ke service");
            
            org.json.JSONObject userpass = new org.json.JSONObject(login);
            String username = userpass.getString("username");
            String password = userpass.getString("password");
            System.out.println("user : "+username);
        }catch(Exception e){
      
        }
     return "";
    }
}
