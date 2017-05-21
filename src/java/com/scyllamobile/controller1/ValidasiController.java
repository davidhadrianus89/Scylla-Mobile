package com.scyllamobile.controller1;

///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package id.co.bukopin.bscms.controller;
//
//import com.google.gson.Gson;
//import javax.servlet.http.HttpServletRequest;
//import org.json.JSONArray;
//import org.json.JSONObject;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//
///**
// *
// * @author Lenovo
// */
//@Controller
//public class ValidasiController {
//
//    private Gson gson = new Gson();
//    private ValidasiRekeningDao validasiDao = new ValidasiRekeningDaoImp();
//
//    @ResponseBody
//    @RequestMapping(value = "/validateData", method = RequestMethod.POST)
//    private String validateData(HttpServletRequest request, @RequestBody String param) throws Exception {
//        String result = "";
//        System.out.println("Masuk validate Controller Server");
//        org.json.simple.JSONObject returnJson = new org.json.simple.JSONObject();
//        org.json.simple.JSONArray jArray = new org.json.simple.JSONArray();
//
//        try {
//            JSONObject paramObj = new JSONObject(param);
//            JSONArray listArray = paramObj.getJSONArray("arList");
//            for (int i = 0; i < listArray.length(); i++) {
//                JSONObject obj = listArray.getJSONObject(i);
//                String acno = obj.getString("acno").trim();
//                String name = obj.getString("name").trim();
//                String status = validasiDao.validate(acno, name);
//
//                //set result output
//                //System.out.println(String.format("Acno : %s Name : %s State : %s", acno, name, status));
//                org.json.simple.JSONObject jObj = new org.json.simple.JSONObject();
//                jObj.put("acno", acno);
//                jObj.put("name", name);
//                jObj.put("status", status);
//
//                jArray.add(jObj);
//            }
//
//            returnJson.put("arResult", jArray);
//            result = returnJson.toString();
//        } catch (Exception e) {
//            System.err.println("error - " + e.getMessage());
//            result = e.getMessage();
//        }
//        //System.out.println("controller -" + result);
//        return result;
//    }
//}
