package com.scyllamobile.modelo;
// Generated Jun 8, 2017 5:46:44 AM by Hibernate Tools 4.3.1


import java.math.BigDecimal;

/**
 * Mblfdiscd5 generated by hbm2java
 */
public class Mblfdiscd5  implements java.io.Serializable {


     private BigDecimal id;
     private String mtgl;
     private String mslsno;
     private String kode;
     private BigDecimal xno;
     private BigDecimal minrange;
     private BigDecimal maxrange;
     private String tkode;
     private BigDecimal tpercent;
     private BigDecimal tvalue;

    public Mblfdiscd5() {
    }

	
    public Mblfdiscd5(BigDecimal id) {
        this.id = id;
    }
    public Mblfdiscd5(BigDecimal id, String mtgl, String mslsno, String kode, BigDecimal xno, BigDecimal minrange, BigDecimal maxrange, String tkode, BigDecimal tpercent, BigDecimal tvalue) {
       this.id = id;
       this.mtgl = mtgl;
       this.mslsno = mslsno;
       this.kode = kode;
       this.xno = xno;
       this.minrange = minrange;
       this.maxrange = maxrange;
       this.tkode = tkode;
       this.tpercent = tpercent;
       this.tvalue = tvalue;
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
    public String getKode() {
        return this.kode;
    }
    
    public void setKode(String kode) {
        this.kode = kode;
    }
    public BigDecimal getXno() {
        return this.xno;
    }
    
    public void setXno(BigDecimal xno) {
        this.xno = xno;
    }
    public BigDecimal getMinrange() {
        return this.minrange;
    }
    
    public void setMinrange(BigDecimal minrange) {
        this.minrange = minrange;
    }
    public BigDecimal getMaxrange() {
        return this.maxrange;
    }
    
    public void setMaxrange(BigDecimal maxrange) {
        this.maxrange = maxrange;
    }
    public String getTkode() {
        return this.tkode;
    }
    
    public void setTkode(String tkode) {
        this.tkode = tkode;
    }
    public BigDecimal getTpercent() {
        return this.tpercent;
    }
    
    public void setTpercent(BigDecimal tpercent) {
        this.tpercent = tpercent;
    }
    public BigDecimal getTvalue() {
        return this.tvalue;
    }
    
    public void setTvalue(BigDecimal tvalue) {
        this.tvalue = tvalue;
    }




}


