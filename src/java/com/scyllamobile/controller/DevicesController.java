/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.controller;

import com.scyllamobile.dao.DeviceDao;
import com.scyllamobile.imp.DeviceDaoImp;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author tsuuy
 */
@Controller
public class DevicesController {
    
    @RequestMapping(value = "masterDevice", method = RequestMethod.GET)
    private ModelAndView masterDevice(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map map = new HashMap();
        
        ArrayList profile = (ArrayList) request.getSession().getAttribute("profil");
        
        if (profile == null || profile.isEmpty()) {
            return new ModelAndView("500");
        }
        
        try {
            
        String sellerid = profile.get(0).toString();

        DeviceDao dd = new DeviceDaoImp();

        map.put("list_device", dd.listDevice());
            
        } catch (Exception e) {
            map.put("pesan", "session time out " + e.getMessage());
        }
        
        return new ModelAndView("body/devices/masterDevice", map);
    }
    
}
