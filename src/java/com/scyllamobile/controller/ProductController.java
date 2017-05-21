/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scyllamobile.controller;

import com.scyllamobile.dao.GroupProductDao;
import com.scyllamobile.dao.ProductDao;
import com.scyllamobile.dao.UnitProductDao;
import com.scyllamobile.imp.GroupProducDaotImp;
import com.scyllamobile.imp.ProductDaoImp;
import com.scyllamobile.imp.UnitProductDaoImp;
import com.scyllamobile.model.TProduct;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author 201302118
 */
@Controller
public class ProductController {

    private final String DATE_FORMAT_NOW = "yyyyMMddHHmmss";

    //STATUS PROCUT
    private final String STS_NEW = "0";
    private final String STS_CHECKER = "1";
    private final String STS_APPROVE = "2";
    private final String STS_CHECKER_SELLER = "3";
    private final String STS_APPROVE_SELLER = "4";

    //GROUP USER
    private final String PELAKSANA_BANK_MAKER = "1";
    private final String PELAKSANA_BANK_CHECKER = "2";
    private final String PELAKSANA_BANK_APPROVAL = "3";
    private final String PELAKSANA_BANK_SUPERADMIN = "4";
    private final String PELAKSANA_BANK_USER_MONITORING = "5";
    private final String BUYER_MAKER = "6";
    private final String BUYER_CHECKER = "7";
    private final String BUYER_APPROVAL = "8";
    private final String SELLER_MAKER = "9";
    private final String SELLER_CHECKER = "10";
    private final String SELLER_APPROVAL = "11";

    String defUrl;
    CallWebServiceController serviceController = new CallWebServiceController();

    public ProductController() {

        PropertiesController pc = new PropertiesController();
        defUrl = pc.prop();
        System.out.println("URL : " + defUrl);
    }

    @RequestMapping(value = "masterProduct", method = RequestMethod.GET)
    private ModelAndView masterProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map map = new HashMap();

        ArrayList profile = (ArrayList) request.getSession().getAttribute("profil");
        
        if (profile == null || profile.isEmpty()) {
            return new ModelAndView("lockscreen");
        }

        try {

            String sellerid = profile.get(0).toString();

            ProductDao pd = new ProductDaoImp();
            GroupProductDao gpd = new GroupProducDaotImp();
            UnitProductDao upd = new UnitProductDaoImp();

            map.put("list_cb", gpd.listGroupBySellerid(sellerid));
            map.put("list_unit", upd.listUnitBySellerid(sellerid));
            map.put("list_product", pd.listProduct());

        } catch (Exception e) {
            return new ModelAndView("500");
//            map.put("pesan", "session habis " + e.getMessage());
//            
//            System.out.println("ERROR : " + e.getMessage());
        }

        return new ModelAndView("body/product/masterProduct", map);
    }

    @RequestMapping(value = "addProduct", method = RequestMethod.GET)
    private ModelAndView addProduct(HttpServletRequest request, HttpServletResponse response) {
        Map map = new HashMap();
        String result = "";
        GroupProductDao gpd = new GroupProducDaotImp();
        UnitProductDao upd = new UnitProductDaoImp();

        ArrayList profile = (ArrayList) request.getSession().getAttribute("profil");
        String sellerid = profile.get(0).toString();

        map.put("list_group", gpd.listGroupBySellerid(sellerid));
        map.put("list_unit", upd.listUnitBySellerid(sellerid));

        return new ModelAndView("body/product/addProduct", map);
    }

    @ResponseBody
    @RequestMapping(value = "saveProduct", method = RequestMethod.POST)
    private String saveProduct(HttpServletRequest request,
            @RequestParam("file") MultipartFile file,
            @RequestParam("productname") String productName,
            @RequestParam("productcode") String productCode,
            @RequestParam("productgroup") String productGroup,
            @RequestParam("productunit") String productUnit,
            @RequestParam("information") String information,
            @RequestParam("valuta") String valuta,
            @RequestParam("price") String price,
            @RequestParam("stok") String stok,
            @RequestParam("condition") String condition,
            @RequestParam("status") String status) {

//        System.out.println("save product");
        String originalname = file.getOriginalFilename();
        String ext2 = FilenameUtils.getExtension(originalname);

        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_NOW);
        String imgname = "IMG" + sdf.format(cal.getTime()) + "." + ext2;//file image name

        try {

            ProductDao pd = new ProductDaoImp();

            if (!file.isEmpty()) {
                try {
                    byte[] bytes = file.getBytes();

                    // Creating the directory to store file
                    System.out.println("PATH PATH :" + request.getServletContext().getRealPath("/"));
                    String rootPath = request.getServletContext().getRealPath("/");
                    System.out.println("path : " + rootPath);

                    File dir = new File(rootPath + File.separator + "imgProduct");
                    if (!dir.exists()) {
                        dir.mkdirs();
                    }

                    // Create the file on server
                    File serverFile = new File(dir.getAbsolutePath()
                            + File.separator + imgname);
                    BufferedOutputStream stream = new BufferedOutputStream(
                            new FileOutputStream(serverFile));
                    stream.write(bytes);
                    stream.close();

                    TProduct product = new TProduct(
                            price, productName, productCode,
                            productGroup,
                            productUnit, information,
                            valuta, Long.valueOf(price),
                            Integer.valueOf(stok),
                            imgname,
                            condition, Integer.valueOf(status));

                    pd.saveProduct(product);
//
//                    System.out.println("Server File Location="
//                            + serverFile.getAbsolutePath());

                    return "You successfully add new product";// uploaded file=" + imgname;
                } catch (Exception e) {
                    return "You failed to upload " + imgname + " => " + e.getMessage();
                }
            } else {
                return "You failed to upload " + imgname
                        + " because the file was empty.";
            }

        } catch (Exception e) {

        }

        return "Sukses";

    }

    @RequestMapping(value = "deleteProduct", method = RequestMethod.GET)
    private ModelAndView deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        Map map = new HashMap();
        String productid = request.getParameter("productid");

        try {

            ArrayList profile = (ArrayList) request.getSession().getAttribute("profil");
            String sellerid = profile.get(0).toString();

            ProductDao pd = new ProductDaoImp();
            GroupProductDao gpd = new GroupProducDaotImp();
            UnitProductDao upd = new UnitProductDaoImp();

            int ret = pd.deleteProduct(productid);

            map.put("list_cb", gpd.listGroupBySellerid(sellerid));
            map.put("list_unit", upd.listUnitBySellerid(sellerid));
            map.put("list_product", pd.listProduct());

            map.put("pesan", "Delete product success");

        } catch (Exception e) {
            map.put("pesan", e.getMessage());

            System.out.println("error delete product : " + e.getMessage());
        }

        return new ModelAndView("body/product/masterProduct", map);
    }

    @RequestMapping(value = "updateStatusProduct", method = RequestMethod.GET)
    private ModelAndView updateStatusProduct(HttpServletRequest request, HttpServletResponse response) {
        Map map = new HashMap();
        String productid = request.getParameter("productid");
        String status = request.getParameter("status");

        String viewer = "body/product/approveEditDetailProductRequest";

        String sts = "";
        String status_update = "";
        String title = "";
        String pesan = "";

        ArrayList profile = (ArrayList) request.getSession().getAttribute("profil");
        String sellerid = profile.get(0).toString();
        String pelaksanagroup = profile.get(1).toString();

        try {
            ProductDao pd = new ProductDaoImp();

            int ret = pd.updateProductStatus(productid, status);

            switch (pelaksanagroup) {
                case PELAKSANA_BANK_CHECKER:
                    status_update = STS_CHECKER;
                    title = "CHECKER ADD PRODUCT REQUEST";
                    pesan = "Checker add product request success";
                    sts = STS_NEW;
                    break;
                case PELAKSANA_BANK_APPROVAL:
                    status_update = STS_APPROVE;
                    title = "APPROVE ADD PRODUCT REQUEST";
                    pesan = "Approve add product request success";
                    sts = STS_CHECKER;
                    break;
                case SELLER_CHECKER:
                    status_update = STS_APPROVE_SELLER;
                    title = "CHECKER EDIT DETAIL PRODUCT REQUEST";
                    pesan = "Checker edit detail product request success";
                    sts = STS_CHECKER_SELLER;
                    break;
                case SELLER_APPROVAL:
                    status_update = STS_NEW;
                    title = "APPROVE EDIT DETAIL PRODUCT REQUEST";
                    pesan = "Approval edit detail product request success";
                    sts = STS_APPROVE_SELLER;
                    break;
            }

            GroupProductDao gpd = new GroupProducDaotImp();
            UnitProductDao upd = new UnitProductDaoImp();

            map.put("title", title);
            map.put("pesan", pesan);
            map.put("status_update", status_update);
            map.put("list_group", gpd.listGroupBySellerid(sellerid));
            map.put("list_unit", upd.listUnitBySellerid(sellerid));
            map.put("list_product", pd.listProductByStatus(sts));

        } catch (Exception e) {
            map.put("pesan", e.getMessage());

//            System.out.println("error edit group product : " + e.getMessage());
        }

        return new ModelAndView(viewer, map);
    }

    @RequestMapping(value = "approveEditDetailProductRequest", method = RequestMethod.GET)
    private ModelAndView approveEditDetailProductRequest(HttpServletRequest request, HttpServletResponse response) {
        Map map = new HashMap();

        ArrayList profile = (ArrayList) request.getSession().getAttribute("profil");
        String sellerid = profile.get(0).toString();
        String pelaksanagroup = profile.get(1).toString();
        String status = "";
        String status_update = "";
        String title = "";
        String process = "";

        switch (pelaksanagroup) {
            case PELAKSANA_BANK_CHECKER:
                status = STS_NEW;
                status_update = STS_CHECKER;
                title = "CHECKER ADD PRODUCT REQUEST";
                break;
            case PELAKSANA_BANK_APPROVAL:
                status = STS_CHECKER;
                status_update = STS_APPROVE;
                title = "APPROVE ADD PRODUCT REQUEST";
                break;
            case SELLER_CHECKER:
                status = STS_CHECKER_SELLER;
                status_update = STS_APPROVE_SELLER;
                title = "CHECKER EDIT DETAIL PRODUCT REQUEST";
                break;
            case SELLER_APPROVAL:
                status = STS_APPROVE_SELLER;
                status_update = STS_NEW;
                title = "APPROVE EDIT DETAIL PRODUCT REQUEST";
                break;
        }

        ProductDao pd = new ProductDaoImp();
        GroupProductDao gpd = new GroupProducDaotImp();
        UnitProductDao upd = new UnitProductDaoImp();

        map.put("title", title);
        map.put("status_update", status_update);
        map.put("list_group", gpd.listGroupBySellerid(sellerid));
        map.put("list_unit", upd.listUnitBySellerid(sellerid));
        map.put("list_product", pd.listProductByStatus(status));

        return new ModelAndView("body/product/approveEditDetailProductRequest", map);
    }

}
