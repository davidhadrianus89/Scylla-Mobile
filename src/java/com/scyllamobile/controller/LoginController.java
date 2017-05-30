/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.controller;

import com.google.code.kaptcha.Constants;
import com.google.gson.Gson;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.URL;
import java.net.UnknownHostException;
import java.util.ArrayList;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Gustiana
 */
@Controller
public class LoginController {

    Gson gson = new Gson();
    CallWebServiceController serviceController = new CallWebServiceController();
    boolean logonvalid;
    public String Username;
    public static String Password;
    String defUrl;
    boolean defPass = false;
    int newtab = 0;
    int newtab1 = 0;
    String macadd;
    String ipadd;
    List macList = new ArrayList();
    String expired = "";
    String sukses = "";

    public void getPropUrl() {

        PropertiesController pc = new PropertiesController();

        //defUrl = pc.prop();
//        defUrl = " http://localhost:8080/BSCMS_Server/";
        defUrl = " http://localhost:8084/smbackend/";

        System.out.println("URL : " + defUrl);
    }

    public String logout(HttpServletRequest request) {
        newtab = 0;
        String macaddr = (String) request.getSession().getAttribute("macaddr");
        String cek_user = "";
        cek_user = request.getParameter("userid");
        System.out.println("cek user " + cek_user);
        if (!cek_user.equals("") || cek_user != null || !cek_user.contains("null") || !cek_user.isEmpty()) {
            Username = cek_user;
        } else {
            Username = (String) request.getSession().getAttribute("logout");
        }
        getPropUrl();

        request.getSession().removeAttribute("logout");
        request.getSession().removeAttribute("profil");
        request.getSession().removeAttribute("menuku");

        System.err.println("log out");
        return "sukses";
    }

    //logout new

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    private ModelAndView getLogout(HttpServletRequest request, HttpServletResponse response) {
        newtab = 0;
        String macaddr = (String) request.getSession().getAttribute("macaddr");
        String cek_user = "";
        cek_user = request.getParameter("userid");
        System.out.println("cek user " + cek_user);
        if (!cek_user.equals("") || cek_user != null || !cek_user.contains("null") || !cek_user.isEmpty()) {
            Username = cek_user;
        } else {
            Username = (String) request.getSession().getAttribute("logout");
        }
        System.out.println("usernama " + Username);

        getPropUrl();

        response.setHeader("Cache-Control", "private,no-store,no-cache");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        request.getSession().removeAttribute("logout");
        request.getSession().removeAttribute("profil");
        request.getSession().removeAttribute("menuku");

        System.err.println("log out");
        Username = request.getParameter("userid");

        return new ModelAndView("redirect:login");
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    private ModelAndView getOpening(HttpServletRequest request) {

        return new ModelAndView("login");
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    private ModelAndView getLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
        System.out.println("masuk login post");
        Map map = new HashMap();
        try {
            String kaptchaExpected = (String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
            String kaptchaReceived = request.getParameter("kaptcha");
            String textResult = "";

            if (kaptchaReceived == null || !kaptchaReceived.equalsIgnoreCase(kaptchaExpected)) {
                System.out.println("gagal kaptcha");
                textResult = "You're entered invalid code";

                map.put("retcode", "Code : 9");
                map.put("message", "Message : Invalid Code Captcha!");
                return new ModelAndView("login", map);

            } else {
                System.out.println("sukses kaptcha");
                textResult = "Congratulation you're entered correct code";

                newtab1 = 0;

                String ret = "";
                getPropUrl();

                System.out.println("new method login ");
                String password = request.getParameter("password");
                String username = request.getParameter("username");

                Username = username.toUpperCase();
                Password = password;
                Enkripsi ek = new Enkripsi();
                String UsernameEnk = ek.encrypt(Username);
                String PasswordEnk = ek.encrypt(Password);

                //GET MAC ADDRESS 
                InetAddress ip;
                try {

                    ip = InetAddress.getLocalHost();
                    System.out.println("Current IP address : " + ip.getHostAddress());
                    ipadd = ip.getHostAddress();
                    NetworkInterface network = NetworkInterface.getByInetAddress(ip);

                    byte[] mac = network.getHardwareAddress();

                    System.out.print("Current MAC address : ");

                    StringBuilder sb = new StringBuilder();
                    for (int i = 0; i < mac.length; i++) {
                        sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : ""));
                    }
                    System.out.println(sb.toString());

                    macadd = sb.toString();

                } catch (UnknownHostException | SocketException e) {
                    macadd = e.getMessage();
                    ipadd = e.getMessage();
                }

                request.getSession().setAttribute("macaddr", macadd);
                //END OF GET MAC ADDRESS

                //set param
                org.json.simple.JSONObject userpass = new org.json.simple.JSONObject();
                userpass.put("username", UsernameEnk);
                userpass.put("password", PasswordEnk);

                //Call Service
                String url = defUrl + "doLogin";
                List retService = serviceController.callService(url, userpass);
                if (retService.get(0).toString() == "0") {

                    ArrayList list = new ArrayList();
                    ArrayList result = new ArrayList();
                    String listMenu;
                    JSONObject listDashboard = new JSONObject(retService.get(1).toString());
                    JSONArray arResult = listDashboard.getJSONArray("result");
                    for (int i = 0; i < arResult.length(); i++) {
                        JSONObject retCode = arResult.getJSONObject(i);
                        result.add(retCode.getString("retcode").trim());
                        result.add(retCode.getString("message").trim());
                    }

                    System.out.println("result : " + result.get(0));

                    if (result.get(0).toString().equals("0")) {
                        listMenu = listDashboard.getString("menu");
                        JSONArray listProfil = listDashboard.getJSONArray("dataUser");
                        for (int i = 0; i < listProfil.length(); i++) {
                            JSONObject profil = listProfil.getJSONObject(i);
                            list.add(profil.getString("username").trim());
                            list.add(profil.getString("usergroup").trim());
                            list.add(profil.getString("password").trim());
                            list.add(profil.getString("email").trim());
                            list.add(profil.getString("telepon").trim());
                            list.add(profil.getString("logdate").trim());
                            list.add(profil.getString("logtime").trim());
                        }

                        request.getSession().removeAttribute("profil");
                        request.getSession().removeAttribute("menuku");
                        request.getSession().removeAttribute("logout");
                        
                        request.getSession().setAttribute("profil", list);
                        request.getSession().setAttribute("menuku", listMenu);
                        request.getSession().setAttribute("logout", Username);

                        System.out.println("sukses semua");
                        return new ModelAndView("redirect:dashboard");
                    } else {
                        System.out.println("result != 0");
                        map.put("retcode", "Code : " + result.get(0));
                        map.put("message", "Message : " + result.get(1));
                        return new ModelAndView("login", map);
                    }
                } else {

                    map.put("message", "Message : " + retService.get(1).toString());
                    return new ModelAndView("login", map);
                }
            }
        } catch (Exception e) {
            System.out.println("error" + e.getMessage());
            map.put("message", e.getMessage());
            return new ModelAndView("login", map);
        }
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    private ModelAndView getHome(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("Mlebu neng method home");

        if (!macList.isEmpty() || macList != null) {
            List macTemp = macList;
            for (int i = 0; i < macTemp.size(); i++) {
                if (macTemp.get(i) == macadd) {
                    macList.remove(i);
                }
            }
        }

        return new ModelAndView("redirect:dashboard");

    }

    @RequestMapping(value = "/404", method = RequestMethod.GET)
    private ModelAndView get404(HttpServletRequest request) throws IOException {

        return new ModelAndView("404");

    }

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    private ModelAndView getBeranda(HttpServletRequest request) throws IOException {

        Map map = new HashMap();

        if (!macList.isEmpty() || macList != null) {
            List macTemp = macList;
            for (int i = 0; i < macTemp.size(); i++) {
                if (macList.get(i) == macadd) {
                    return new ModelAndView("redirect:404");
                }
            }
        }

        macList.add(macadd);

        ArrayList list = (ArrayList) request.getSession().getAttribute("profil");
        System.out.println("ini di Dashboard");

        if (list != null) {
            System.out.println("masuk sini");
            map.put("url", "home.jsp");

            return new ModelAndView("dashboard", map);
        } else {
            System.out.println("list null");
            map.put("Error", "YOU MUST LOGIN FIRST <br>");
            return new ModelAndView("redirect:login");
        }

    }

    public static void main(String[] args) {
        String path = "";
        try (BufferedReader br = new BufferedReader(new FileReader("D://url.txt"))) {
            String sCurrentLine;
            String abc[];
            while ((sCurrentLine = br.readLine()) != null) {
                path = sCurrentLine;

            }
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("e : " + e.getMessage());
        }
    }

    @RequestMapping(value = "/loginSession", method = RequestMethod.GET)
    @ResponseBody
    private String loginSession(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
        newtab1 = 0;
        Map map = new HashMap();
        String ret = "";
        getPropUrl();
        System.out.println("Mlebu neng method login session");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println("user : " + username);
        System.out.println("pass : " + password);

        Enkripsi ek = new Enkripsi();
        String UsernameEnk = ek.encrypt(username.toUpperCase());
        String PasswordEnk = ek.encrypt(password);

        //GET MAC ADDRESS
        InetAddress ip;
        try {

            ip = InetAddress.getLocalHost();
            System.out.println("loginSession Current IP address : " + ip.getHostAddress());
            ipadd = ip.getHostAddress();
            NetworkInterface network = NetworkInterface.getByInetAddress(ip);

            byte[] mac = network.getHardwareAddress();

            System.out.print("loginSession Current MAC address : ");

            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < mac.length; i++) {
                sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : ""));
            }
            System.out.println(sb.toString());

            macadd = sb.toString();

        } catch (UnknownHostException | SocketException e) {
            macadd = e.getMessage();
            ipadd = e.getMessage();
        }

        request.getSession().setAttribute("macaddr", macadd);
        //END OF GET MAC ADDRESS
        org.json.simple.JSONObject userpass = new org.json.simple.JSONObject();
        userpass.put("username", UsernameEnk);
        userpass.put("password", PasswordEnk);

        //Call Service
        String url = defUrl + "doLogin";
        List retService = serviceController.callService(url, userpass);
        if (retService.get(0).toString() == "0") {

            ArrayList list = new ArrayList();
            ArrayList result = new ArrayList();
            String listMenu;
            JSONObject listDashboard = new JSONObject(retService.get(1).toString());
            JSONArray arResult = listDashboard.getJSONArray("result");
            for (int i = 0; i < arResult.length(); i++) {
                JSONObject retCode = arResult.getJSONObject(i);
                result.add(retCode.getString("retcode").trim());
                result.add(retCode.getString("message").trim());
            }

            System.out.println("result : " + result.get(0));

            if (result.get(0).toString().equals("0")) {
                listMenu = listDashboard.getString("menu");
                JSONArray listProfil = listDashboard.getJSONArray("dataUser");
                for (int i = 0; i < listProfil.length(); i++) {
                    JSONObject profil = listProfil.getJSONObject(i);
                    list.add(profil.getString("username").trim());
                    list.add(profil.getString("usergroup").trim());
                    list.add(profil.getString("password").trim());
                    list.add(profil.getString("email").trim());
                    list.add(profil.getString("telepon").trim());
                    list.add(profil.getString("logdate").trim());
                    list.add(profil.getString("logtime").trim());
                }

                request.getSession().removeAttribute("profil");
                request.getSession().removeAttribute("menuku");
                request.getSession().removeAttribute("logout");
                
                request.getSession().setAttribute("profil", list);
                request.getSession().setAttribute("menuku", listMenu);
                request.getSession().setAttribute("logout", Username);
                ret = "0";
                System.out.println("sukses semua");
            } else {
                ret = result.get(1).toString();
                System.out.println("result != 0");
                map.put("retcode", "Code : " + result.get(0));
                map.put("message", "Message : " + result.get(1));
            }
        } else {
            ret = retService.get(1).toString();
            map.put("message", "Message : " + retService.get(1).toString());
        }

        return ret;
    }

}
