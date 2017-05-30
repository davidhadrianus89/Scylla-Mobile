/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.api;

import com.google.gson.Gson;
import com.scyllamobile.dao.MasterDao;
import com.scyllamobile.impapi.MasterDaoImp;
import com.scyllamobile.modelo.Result;
import java.util.List;
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
@RequestMapping(value="/api/master")
public class MasterApi {
    
    @ResponseBody
    @RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public String master(HttpServletRequest request, HttpServletResponse response) {

        String mslsno = request.getParameter("mslsno");
        String mtgl = request.getParameter("mtgl");

        Gson gson = new Gson();

        try {
            MasterDao dao = new MasterDaoImp();
            
            Result result = new Result();
            
            result.setAktifitas(dao.getMaster("Mblfaktivitas", mslsno, mtgl));
            result.setAretur(dao.getMaster("Mblfarretur", mslsno, mtgl));
            result.setBank(dao.getMaster("Mblftbank", mslsno, mtgl));
            result.setBotol(dao.getMaster("Mblfbotol", mslsno, mtgl));
            result.setBrand(dao.getMaster("Mblfbrand", mslsno, mtgl));
            result.setCheq(dao.getMaster("Mblfcheq", mslsno, mtgl));
            result.setCndn(dao.getMaster("Mblfarcndn", mslsno, mtgl));
            result.setCustmst(dao.getMaster("Mblfcustmst", mslsno, mtgl));
            result.setFdisc5(dao.getMaster("Mblfdiscd5", mslsno, mtgl));
            result.setFdisc6(dao.getMaster("Mblfdiscd6", mslsno, mtgl));
            result.setMaster(dao.getMaster("Mblfmaster", mslsno, mtgl));
            result.setParam(dao.getMaster("Mblfparam", mslsno, mtgl));

            return gson.toJson(result);

        } catch (Exception e) {
            return gson.toJson(e);
        }
    }
    
    @ResponseBody
    @RequestMapping(value = "/mblfaktivitas", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public String mblfaktivitas(HttpServletRequest request, HttpServletResponse response) {

        String mslsno = request.getParameter("mslsno");
        String mtgl = request.getParameter("mtgl");

        Gson gson = new Gson();

        try {
            MasterDao dao = new MasterDaoImp();

            List list = dao.getMaster("Mblfaktivitas", mslsno, mtgl);

            return gson.toJson(list);

        } catch (Exception e) {
            return gson.toJson(e);
        }
    }
    
    @ResponseBody
    @RequestMapping(value = "/mblfarretur", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public String mblfarretur(HttpServletRequest request, HttpServletResponse response) {

        String mslsno = request.getParameter("mslsno");
        String mtgl = request.getParameter("mtgl");

        Gson gson = new Gson();

        try {
            MasterDao dao = new MasterDaoImp();

            List list = dao.getMaster("Mblfarretur", mslsno, mtgl);

            return gson.toJson(list);

        } catch (Exception e) {
            return gson.toJson(e);
        }
    }
    
    @ResponseBody
    @RequestMapping(value = "/mblftbank", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public String mblftbank(HttpServletRequest request, HttpServletResponse response) {

        String mslsno = request.getParameter("mslsno");
        String mtgl = request.getParameter("mtgl");

        Gson gson = new Gson();

        try {
            MasterDao dao = new MasterDaoImp();

            List list = dao.getMaster("Mblftbank", mslsno, mtgl);

            return gson.toJson(list);

        } catch (Exception e) {
            return gson.toJson(e);
        }
    }
    
    @ResponseBody
    @RequestMapping(value = "/mblfbotol", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public String mblfbotol(HttpServletRequest request, HttpServletResponse response) {

        String mslsno = request.getParameter("mslsno");
        String mtgl = request.getParameter("mtgl");

        Gson gson = new Gson();

        try {
            MasterDao dao = new MasterDaoImp();

            List list = dao.getMaster("Mblfbotol", mslsno, mtgl);

            return gson.toJson(list);

        } catch (Exception e) {
            return gson.toJson(e);
        }
    }
    
    @ResponseBody
    @RequestMapping(value = "/mblfbrand", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public String mblfbrand(HttpServletRequest request, HttpServletResponse response) {

        String mslsno = request.getParameter("mslsno");
        String mtgl = request.getParameter("mtgl");

        Gson gson = new Gson();

        try {
            MasterDao dao = new MasterDaoImp();

            List list = dao.getMaster("Mblfbrand", mslsno, mtgl);

            return gson.toJson(list);

        } catch (Exception e) {
            return gson.toJson(e);
        }
    }
    
    @ResponseBody
    @RequestMapping(value = "/mblfcheq", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public String mblfcheq(HttpServletRequest request, HttpServletResponse response) {

        String mslsno = request.getParameter("mslsno");
        String mtgl = request.getParameter("mtgl");

        Gson gson = new Gson();

        try {
            MasterDao dao = new MasterDaoImp();

            List list = dao.getMaster("Mblfcheq", mslsno, mtgl);

            return gson.toJson(list);

        } catch (Exception e) {
            return gson.toJson(e);
        }
    }
    
    @ResponseBody
    @RequestMapping(value = "/mblfarcndn", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public String mblfarcndn(HttpServletRequest request, HttpServletResponse response) {

        String mslsno = request.getParameter("mslsno");
        String mtgl = request.getParameter("mtgl");

        Gson gson = new Gson();

        try {
            MasterDao dao = new MasterDaoImp();

            List list = dao.getMaster("Mblfarcndn", mslsno, mtgl);

            return gson.toJson(list);

        } catch (Exception e) {
            return gson.toJson(e);
        }
    }
    
    @ResponseBody
    @RequestMapping(value = "/mblfcustmst", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public String mblfcustmst(HttpServletRequest request, HttpServletResponse response) {

        String mslsno = request.getParameter("mslsno");
        String mtgl = request.getParameter("mtgl");

        Gson gson = new Gson();

        try {
            MasterDao dao = new MasterDaoImp();

            List list = dao.getMaster("Mblfcustmst", mslsno, mtgl);

            return gson.toJson(list);

        } catch (Exception e) {
            return gson.toJson(e);
        }
    }
    
    @ResponseBody
    @RequestMapping(value = "/mblfdiscd5", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public String mblfdiscd5(HttpServletRequest request, HttpServletResponse response) {

        String mslsno = request.getParameter("mslsno");
        String mtgl = request.getParameter("mtgl");

        Gson gson = new Gson();

        try {
            MasterDao dao = new MasterDaoImp();

            List list = dao.getMaster("Mblfdiscd5", mslsno, mtgl);

            return gson.toJson(list);

        } catch (Exception e) {
            return gson.toJson(e);
        }
    }
    
    @ResponseBody
    @RequestMapping(value = "/mblfdiscd6", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public String mblfdiscd6(HttpServletRequest request, HttpServletResponse response) {

        String mslsno = request.getParameter("mslsno");
        String mtgl = request.getParameter("mtgl");

        Gson gson = new Gson();

        try {
            MasterDao dao = new MasterDaoImp();

            List list = dao.getMaster("Mblfdiscd6", mslsno, mtgl);

            return gson.toJson(list);

        } catch (Exception e) {
            return gson.toJson(e);
        }
    }
    
    @ResponseBody
    @RequestMapping(value = "/mblfmaster", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public String mblfmaster(HttpServletRequest request, HttpServletResponse response) {

        String mslsno = request.getParameter("mslsno");
        String mtgl = request.getParameter("mtgl");

        Gson gson = new Gson();

        try {
            MasterDao dao = new MasterDaoImp();

            List list = dao.getMaster("Mblfmaster", mslsno, mtgl);

            return gson.toJson(list);

        } catch (Exception e) {
            return gson.toJson(e);
        }
    }

    @ResponseBody
    @RequestMapping(value = "/mblfparam", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public String mblfparam(HttpServletRequest request, HttpServletResponse response) {

        String mslsno = request.getParameter("mslsno");
        String mtgl = request.getParameter("mtgl");

        Gson gson = new Gson();

        try {
            MasterDao dao = new MasterDaoImp();

            List list = dao.getMaster("Mblfparam", mslsno, mtgl);

            return gson.toJson(list);

        } catch (Exception e) {
            return gson.toJson(e);
        }
    }
    
}
