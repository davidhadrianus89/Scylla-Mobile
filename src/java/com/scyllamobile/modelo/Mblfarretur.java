package com.scyllamobile.modelo;
// Generated May 30, 2017 1:15:21 PM by Hibernate Tools 4.3.1


import java.math.BigDecimal;

/**
 * Mblfarretur generated by hbm2java
 */
public class Mblfarretur  implements java.io.Serializable {


     private BigDecimal id;
     private String mtgl;
     private String mslsno;
     private String invno;
     private String slsno;
     private String custno;
     private String invdate;
     private BigDecimal invamount;
     private BigDecimal retamt;
     private String remark;
     private String slsname;
     private String flag;

    public Mblfarretur() {
    }

	
    public Mblfarretur(BigDecimal id) {
        this.id = id;
    }
    public Mblfarretur(BigDecimal id, String mtgl, String mslsno, String invno, String slsno, String custno, String invdate, BigDecimal invamount, BigDecimal retamt, String remark, String slsname, String flag) {
       this.id = id;
       this.mtgl = mtgl;
       this.mslsno = mslsno;
       this.invno = invno;
       this.slsno = slsno;
       this.custno = custno;
       this.invdate = invdate;
       this.invamount = invamount;
       this.retamt = retamt;
       this.remark = remark;
       this.slsname = slsname;
       this.flag = flag;
    }
   
    public BigDecimal getId() {
        return this.id;
    }
    
    public void setId(BigDecimal id) {
        this.id = id;
    }
    public String getMtgl() {
        return this.mtgl;
    }
    
    public void setMtgl(String mtgl) {
        this.mtgl = mtgl;
    }
    public String getMslsno() {
        return this.mslsno;
    }
    
    public void setMslsno(String mslsno) {
        this.mslsno = mslsno;
    }
    public String getInvno() {
        return this.invno;
    }
    
    public void setInvno(String invno) {
        this.invno = invno;
    }
    public String getSlsno() {
        return this.slsno;
    }
    
    public void setSlsno(String slsno) {
        this.slsno = slsno;
    }
    public String getCustno() {
        return this.custno;
    }
    
    public void setCustno(String custno) {
        this.custno = custno;
    }
    public String getInvdate() {
        return this.invdate;
    }
    
    public void setInvdate(String invdate) {
        this.invdate = invdate;
    }
    public BigDecimal getInvamount() {
        return this.invamount;
    }
    
    public void setInvamount(BigDecimal invamount) {
        this.invamount = invamount;
    }
    public BigDecimal getRetamt() {
        return this.retamt;
    }
    
    public void setRetamt(BigDecimal retamt) {
        this.retamt = retamt;
    }
    public String getRemark() {
        return this.remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }
    public String getSlsname() {
        return this.slsname;
    }
    
    public void setSlsname(String slsname) {
        this.slsname = slsname;
    }
    public String getFlag() {
        return this.flag;
    }
    
    public void setFlag(String flag) {
        this.flag = flag;
    }




}


