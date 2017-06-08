/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.controller;

import com.google.code.kaptcha.Constants;
import com.google.gson.Gson;
import com.scyllamobile.dao.LoginDao;
import com.scyllamobile.dao.UserDao;
import com.scyllamobile.imp.LoginDaoImp;
import com.scyllamobile.imp.UserDaoImp;
import com.scyllamobile.model.Roles;
import com.scyllamobile.model.TUser;
import com.scyllamobile.model.Users;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import java.io.IOException;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Gustiana
 */
@Controller
public class LoginController extends MenuController {

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
    String hari = "";
    String jam = "";

    public void getPropUrl() {

        PropertiesController pc = new PropertiesController();

        defUrl = pc.prop();

        System.out.println("URL : " + defUrl);
    }

    public void getPropLog() {

        Date date = new Date();
        DateFormat Formathari = new SimpleDateFormat("dd/MM/yyyy");
        DateFormat Formatjam = new SimpleDateFormat("HH:mm:ss");
        hari = Formathari.format(date);
        jam = Formatjam.format(date);

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
        String password = request.getParameter("password");
        String username = request.getParameter("username");

        Map map = new HashMap();

        try {
            String kaptchaExpected = (String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
            String kaptchaReceived = request.getParameter("kaptcha");
            String textResult = "";

            getPropLog();
            getPropUrl();

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
                Username = username.toUpperCase();
                Password = password;

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

                LoginDao ld = new LoginDaoImp();
//                UserDao ud = new UserDaoImp();

                int retCode = ld.getLogin(username, password);

                if (retCode == 0) {

                    ArrayList list = new ArrayList();

                    Users user = ld.dataUser(username);
                    Roles roles = user.getRoles();

                    list.add(user.getEmail());
                    list.add(roles.getName());
                    list.add(user.getPasswordHash());
                    list.add(user.getEmail());
                    list.add(user.getEmail());
                    list.add(hari);
                    list.add(jam);

                    String listMenu = getMenu(user.getEmail().trim(), roles.getId().trim());

                    request.getSession().removeAttribute("profil");
                    request.getSession().removeAttribute("menuku");
                    request.getSession().removeAttribute("logout");
                    
                    
                    request.getSession().setAttribute("profil", list);
                    request.getSession().setAttribute("menuku", listMenu);
                    request.getSession().setAttribute("logout", username);

                    System.out.println("sukses semua");
                    return new ModelAndView("redirect:dashboard");

                } else if (retCode == 1) {
                    System.out.println("Gagal Login User Tidak ada");

                    map.put("retcode", "Code : 1");
                    map.put("message", "Message : User Tidak Ada!");
                    return new ModelAndView("login", map);

                } else if (retCode == 2) {
                    System.out.println("Password Salah");
                    map.put("retcode", "Code : 2");
                    map.put("message", "Message : Password Salah!");
                    return new ModelAndView("login", map);

                } else if (retCode == 3) {
                    System.out.println("User Tidak Aktif");
                    map.put("retcode", "Code : 3");
                    map.put("message", "Message : User Tidak Aktif. Silahkan hubungi Administrator!");
                    return new ModelAndView("login", map);

                } else {
                    System.out.println("Internal Server Error");
                    map.put("retcode", "Code : 9");
                    map.put("message", "Message : Internal Server Error. Please call Administrator!!");
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

        LoginDao ld = new LoginDaoImp();
        UserDao ud = new UserDaoImp();
        
        System.out.println("password " + password);

        int retCode = ld.getLogin(username, password);

        if (retCode == 0) {

            ArrayList list = new ArrayList();

            TUser user = ud.dataUser(username);

            list.add(user.getUserId());
            list.add(user.getUserGroup());
            list.add(user.getUserPassword());
            list.add(user.getEmail());
            list.add(user.getTelepon());
            list.add(hari);
            list.add(jam);

            String listMenu = getMenu(user.getUserId().trim(), user.getUserGroup().trim());

            request.getSession().removeAttribute("profil");
            request.getSession().removeAttribute("menuku");
            request.getSession().removeAttribute("logout");

            request.getSession().setAttribute("profil", list);
            request.getSession().setAttribute("menuku", listMenu);
            request.getSession().setAttribute("logout", username);

            System.out.println("sukses semua");
            ret="0";

        } else if (retCode == 1) {
            System.out.println("Gagal Login User Tidak ada");

            map.put("retcode", "Code : 1");
            map.put("message", "Message : User Tidak Ada!");
            ret="1";

        } else if (retCode == 2) {
            System.out.println("Password Salah");
            map.put("retcode", "Code : 2");
            map.put("message", "Message : Password Salah!");
            ret="2";

        } else if (retCode == 3) {
            System.out.println("User Tidak Aktif");
            map.put("retcode", "Code : 3");
            map.put("message", "Message : User Tidak Aktif. Silahkan hubungi Administrator!");
            ret = "3";

        } else {
            System.out.println("Internal Server Error");
            map.put("retcode", "Code : 9");
            map.put("message", "Message : Internal Server Error. Please call Administrator!!");
            ret="9";

        }

        return ret;
    }
    
}