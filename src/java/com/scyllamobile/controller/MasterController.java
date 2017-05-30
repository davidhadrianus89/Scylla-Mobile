/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author tsuuy
 */

@Controller
public class MasterController {
    
    @ResponseBody
    @RequestMapping(value="/api", method = RequestMethod.GET)
    public String login(HttpServletRequest request, HttpServletResponse response){
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        
        return username + "--" + password;
    
    }
    
}
