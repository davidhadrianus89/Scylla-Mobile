/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.controller1;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 *
 * @author Gustiana
 */
public class PropertiesController {

    public String propKoneksiSQL(String propName) {
        String defUrl;
        Properties prop = new Properties();

        String propFileName = "/com/scyllamobile/conf/url.properties";
        InputStream inputStream = getClass().getResourceAsStream(propFileName);
        try {
            prop.load(inputStream);
        } catch (IOException ex) {
            System.err.println(" Error Prop : " + ex.getMessage());
        }

        // get the property value and print it out
        defUrl = prop.getProperty(propName);

        System.out.println("URL : " + defUrl);
        return defUrl;
    }
    
     public String getValProp(String propFile, String propName) {
        Properties prop = new Properties();

        String propFileName = propFile;
        InputStream inputStream = getClass().getResourceAsStream(propFileName);
        try {
            prop.load(inputStream);
        } catch (IOException ex) {
            System.err.println(" Error Prop : " + ex.getMessage());
        }
        return prop.getProperty(propName);
    }
    
}
