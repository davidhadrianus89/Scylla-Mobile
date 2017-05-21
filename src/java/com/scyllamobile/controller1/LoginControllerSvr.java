/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.controller1;

import com.google.gson.Gson;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.scyllamobile.dao.LoginDao;
import com.scyllamobile.dao.UserDao;
import com.scyllamobile.imp.LoginDaoImp;
import com.scyllamobile.imp.UserDaoImp;
import com.scyllamobile.model.TUser;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.logging.FileHandler;
import java.util.logging.Logger;
import org.eclipse.jdt.internal.compiler.batch.Main;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Gustiana
 */
@Controller
public class LoginControllerSvr extends MenuController {

    private Gson gson = new Gson();
    private LoginDao loginDao = new LoginDaoImp();
    private UserDao userDao = new UserDaoImp();
    boolean logonvalid = false;

    public String Username;
    public static String Password;

    final static Logger logger = Logger.getLogger(Main.class.getName());
    static FileHandler fh;
    String hari = "";
    String jam = "";

    public void getPropValues() {
        String result = "";
        Properties prop = new Properties();

        String propFileName = "/bukiweb/conf/jdbc.properties";
        InputStream inputStream = getClass().getResourceAsStream(propFileName);
        try {
            prop.load(inputStream);
        } catch (IOException ex) {
            System.err.println(" Error Prop : " + ex.getMessage());
        }

    }

    public void getPropLog() {

        Date date = new Date();
        DateFormat Formathari = new SimpleDateFormat("dd/MM/yyyy");
        DateFormat Formatjam = new SimpleDateFormat("HH:mm:ss");
        hari = Formathari.format(date);
        jam = Formatjam.format(date);

    }

    @ResponseBody
    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    private String getLogout(HttpServletRequest request, @RequestBody String username) throws Exception {
        System.out.println("log out post");
        org.json.JSONObject userpass = new org.json.JSONObject(username);
        String user = userpass.getString("username");

        System.out.println(user);

//        loginDao.getLogout(user);
        return "Sukses";
    }

    @ResponseBody
    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    private String doLogin(HttpServletRequest request, @RequestBody String login) throws Exception {
        try {
            System.out.println("== masuk doLogin SERVER ==");
            getPropLog();
            Map map = new HashMap();
            int retCode;
            String menu = "";
            List dataUser = null;
            JSONArray arUser = new JSONArray();
            JSONArray arResult = new JSONArray();
            JSONObject listDashboard = new JSONObject();
            JSONObject listresult = new JSONObject();

            org.json.JSONObject userpass = new org.json.JSONObject(login);
            String username = userpass.getString("username");
            String password = userpass.getString("password");

            Dekripsi dk = new Dekripsi();
            Username = dk.decrypt(username);
            Password = dk.decrypt(password);
            retCode = loginDao.getLogin(Username, Password);
            System.out.println("Do Login - user : " + Username);
            System.out.println("pass : " + Password);
            System.out.println("retcode : " + retCode);
            
            if (retCode == 0) {
                listresult.put("retcode", "0");
                listresult.put("message", "Login Sukses!");
                dataUser = userDao.getUser(Username);

                TUser userId = (TUser) dataUser.get(0);

                JSONObject listUser = new JSONObject();
                listUser.put("username", userId.getUserId());
                listUser.put("usergroup", userId.getUserGroup());
                listUser.put("password", userId.getUserPassword());
                listUser.put("email", userId.getEmail());
                listUser.put("telepon", userId.getTelepon());
                listUser.put("logdate", hari);
                listUser.put("logtime", jam);

                arUser.add(listUser);
                menu = getLogin(userId.getUserId().trim(), userId.getUserGroup().trim());
                
                System.out.println("MENU : " + menu);

                System.out.println("Do Login - Sukses login");
                System.out.println("ar user : " + arUser);

            } else if (retCode == 1) {
                listresult.put("retcode", "1");
                listresult.put("message", "User Tidak Ada!");

                System.out.println("Gagal Login User Tidak ada");
            } else if (retCode == 2) {
                listresult.put("retcode", "2");
                listresult.put("message", "Password Salah!");
                System.out.println("Password Salah");
            } else if (retCode == 3) {
                listresult.put("retcode", "3");
                listresult.put("message", "User Tidak Aktif. Silahkan hubungi Administrator!");
                System.out.println("User Tidak Aktif");
            
            } else{
                listresult.put("retcode", "9");
                listresult.put("message", "Internal Server Error. Please call Administrator!");
                System.out.println("Internal Server Error");
            }

            arResult.add(listresult);

            listDashboard.put("menu", menu);
            listDashboard.put("dataUser", arUser);
            listDashboard.put("result", arResult);
            return gson.toJson(listDashboard);
        } catch (Exception e) {
            System.err.println("error - " + e.getMessage());
            return "";
        }

    }

}
