/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.controller;

import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.simple.JSONObject;
import org.springframework.web.context.request.async.CallableProcessingInterceptor;

/**
 *
 * @author Rustanian
 */
public class CallWebServiceController {

    private final Gson gson = new Gson();

    public List getLevelAdm(String s_url, org.json.simple.JSONObject jsonogrupid2) {
        List list = new ArrayList<>();
        org.json.simple.JSONObject jsonogrupid = new org.json.simple.JSONObject();
        jsonogrupid.put("grupid", "TM");

        try {
            System.out.println("lemparan " + jsonogrupid2.toString());
            System.out.println("s_url " + s_url);
            URL url = new URL(s_url);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Accept", "application/json");
            conn.setRequestMethod("POST");
            OutputStream os = conn.getOutputStream();
//            os.write(gson.toJson(jsonogrupid2).getBytes());
            os.write(gson.toJson(jsonogrupid2).getBytes());
            os.flush();

            StringBuilder sb = new StringBuilder();
            int HttpResult = conn.getResponseCode();
            if (HttpResult == HttpURLConnection.HTTP_OK) {
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
                String line = null;
                while ((line = br.readLine()) != null) {
                    sb.append(line + "\n");
                }
                br.close();
                System.out.println("sb : "+sb);
                Map map2 = new HashMap();
                map2.put("error_code", "0");
                map2.put("message", sb);
                list.add(map2);
                System.out.println("sukses disini" +list);
            } else {
                System.out.println("Koneksi " + conn.getResponseMessage());
                Map map2 = new HashMap();
                map2.put("error_code", conn.getResponseCode());
                map2.put("message", "Koneksi " + conn.getResponseMessage());
                list.add(map2);
            }
        } catch (Exception e) {
            Map map2 = new HashMap();
            map2.put("error_code", "1");
            map2.put("message", e.getMessage());
            System.out.println("get tree Of Adm " + e.getMessage());
            list.add(map2);
        }
        return list;
    }

    public List callService(String urlService, JSONObject param) {
        List result = new ArrayList();
        try {
            URL url = new URL(urlService);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Accept", "application/json");
            conn.setRequestMethod("POST");
            OutputStream os = conn.getOutputStream();
            os.write(gson.toJson(param).getBytes());
            os.flush();
            os.close();
            StringBuilder sb = new StringBuilder();
            int HttpResult = conn.getResponseCode();
            if (HttpResult == HttpURLConnection.HTTP_OK) {
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
                String line = null;
                while ((line = br.readLine()) != null) {
                    sb.append(line);
                }

                br.close();
                System.out.println("Call Service Controller : " + sb.toString());
                result.add("0");
                result.add(sb.toString());

            } else {
                System.out.println(conn.getResponseMessage());
                result.add("1");
                result.add(conn.getResponseMessage());
            }
            conn.disconnect();

            return result;
        } catch (Exception ex) {
            result.add("99");
            result.add(ex.getMessage());
            return result;
        }
    }

    public List callService(String urlService) {
        List result = new ArrayList();
        try {
            URL url = new URL(urlService);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            int HttpResult = conn.getResponseCode();
            if (HttpResult == HttpURLConnection.HTTP_OK) {
                InputStream stream = conn.getInputStream();
                Scanner out = new Scanner(stream).useDelimiter("\\A");
                String resultString = "";
                if (out.hasNext()) {
                    resultString = out.next();
                }

                result.add("0");
                result.add(resultString);
            } else {
                result.add("1");
                result.add(conn.getResponseMessage());
            }

            conn.disconnect();

            return result;
        } catch (Exception ex) {
            result.add("99");
            result.add(ex.getMessage());
            return result;
        }
    }
}
