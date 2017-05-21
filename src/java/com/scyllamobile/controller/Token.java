/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Rustanian
 */
public class Token {

    private String namaFile = "";
    public String buki_token = "";

    public String getPropLog() {

        Properties prop = new Properties();
        String propFileName = "/bukiweb/conf/url.properties";
        InputStream inputStream = getClass().getResourceAsStream(propFileName);
        try {
            prop.load(inputStream);
        } catch (IOException ex) {
            Logger.getLogger(Token.class.getName()).log(Level.SEVERE, null, ex);
        }

        // get the property value and print it out
        namaFile = prop.getProperty("namaFile");
        return null;

    }

    public String readNote(String userid) {
        getPropLog();
        String ret = "ret";
        try (BufferedReader br = new BufferedReader(new FileReader(namaFile + userid + ".txt"))) {
            String sCurrentLine;
            String abc[];
            while ((sCurrentLine = br.readLine()) != null) {
                System.out.println(sCurrentLine);
                abc = sCurrentLine.split("=");
                sCurrentLine = ((String) abc[0]).trim();
//                ret += sCurrentLine ;
                if (sCurrentLine.equals("TOKEN")) {
                    ret +="#"+((String) abc[1]).trim();
                } else if (sCurrentLine.equals("DATE")) {
                    ret +="#"+((String) abc[1]).trim();
                } else if (sCurrentLine.equals("TIME")) {
                    ret +="#"+((String) abc[1]).trim();
                } else if (sCurrentLine.equals("USERID")) {
                    ret +="#"+((String) abc[1]).trim();
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
            ret="err :"+e.getMessage();
        }

        return ret;
    }

    public static void main(String[] args) {
        try {
            Token t = new Token();
//            t.readNote("BK20131001");
            t.CreateToken("BK20911038");
        } catch (Exception e) {
            System.out.println("err " + e.getMessage());
        }

    }

    public String CreateToken(String userid) {
        try {
            getPropLog();
            System.out.println("nama file :" + namaFile);
            Random rand = new Random();

            Date date = new Date();
            DateFormat Formatjam = new SimpleDateFormat("mmss");
            DateFormat Formatjam2 = new SimpleDateFormat("HHmmss");
            DateFormat Formathari = new SimpleDateFormat("yyyyMMdd");
            PrintWriter out = new PrintWriter(new BufferedWriter(
                    new FileWriter(namaFile + userid + ".txt", false)));
//                    new FileWriter("D:/" + userid + ".txt", false)));

            String jam = Formatjam.format(date);
            String hari = Formathari.format(date);
            int a = Integer.parseInt(jam);
            String token = "";
            System.out.println("jam : " + a);
            int n = rand.nextInt(a);
            for (int i = 0; i < 8; i++) {
                jam = Formatjam.format(date);
                a = Integer.parseInt(jam);
                n = rand.nextInt(a);
                token += org.apache.commons.lang3.StringUtils.rightPad(String.valueOf(n), 4, "0");
                System.out.println("token :" + token);
            }
            out.println("DATE = " + hari);
            out.println("TIME = " + Formatjam2.format(date));
            out.println("USERID = " + userid);
            out.println("TOKEN = " + token);
            buki_token=token;
            out.close();
        } catch (Exception e) {
            System.out.println("err : " + e.getMessage());
            Logger.getLogger(Token.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

}
