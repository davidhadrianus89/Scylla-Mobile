/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.api;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author tsuuy
 */
@Controller
public class Hello {
    
    @ResponseBody
    @RequestMapping(value="/hello/", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public String hello(HttpServletRequest request, HttpServletResponse response){
        return "test";
    
    }
    
    
    public static void main(String[] args) {
        
    }
    
}
