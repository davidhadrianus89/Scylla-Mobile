package com.scyllamobile.modelo;
// Generated May 30, 2017 1:15:21 PM by Hibernate Tools 4.3.1


import java.math.BigDecimal;

/**
 * Mblfbotol generated by hbm2java
 */
public class Mblfbotol  implements java.io.Serializable {


     private BigDecimal id;
     private String mtgl;
     private String mslsno;
     private String kodebtl;
     private String namabtl;
     private String tipe;
     private BigDecimal hargabtl;
     private String suppno;
     private BigDecimal begqty;
     private BigDecimal inqty;
     private BigDecimal outqty;

    public Mblfbotol() {
    }

	
    public Mblfbotol(BigDecimal id) {
        this.id = id;
    }
    public Mblfbotol(BigDecimal id, String mtgl, String mslsno, String kodebtl, String namabtl, String tipe, BigDecimal hargabtl, String suppno, BigDecimal begqty, BigDecimal inqty, BigDecimal outqty) {
       this.id = id;
       this.mtgl = mtgl;
       this.mslsno = mslsno;
       this.kodebtl = kodebtl;
       this.namabtl = namabtl;
       this.tipe = tipe;
       this.hargabtl = hargabtl;
       this.suppno = suppno;
       this.begqty = begqty;
       this.inqty = inqty;
       this.outqty = outqty;
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
    public String getKodebtl() {
        return this.kodebtl;
    }
    
    public void setKodebtl(String kodebtl) {
        this.kodebtl = kodebtl;
    }
    public String getNamabtl() {
        return this.namabtl;
    }
    
    public void setNamabtl(String namabtl) {
        this.namabtl = namabtl;
    }
    public String getTipe() {
        return this.tipe;
    }
    
    public void setTipe(String tipe) {
        this.tipe = tipe;
    }
    public BigDecimal getHargabtl() {
        return this.hargabtl;
    }
    
    public void setHargabtl(BigDecimal hargabtl) {
        this.hargabtl = hargabtl;
    }
    public String getSuppno() {
        return this.suppno;
    }
    
    public void setSuppno(String suppno) {
        this.suppno = suppno;
    }
    public BigDecimal getBegqty() {
        return this.begqty;
    }
    
    public void setBegqty(BigDecimal begqty) {
        this.begqty = begqty;
    }
    public BigDecimal getInqty() {
        return this.inqty;
    }
    
    public void setInqty(BigDecimal inqty) {
        this.inqty = inqty;
    }
    public BigDecimal getOutqty() {
        return this.outqty;
    }
    
    public void setOutqty(BigDecimal outqty) {
        this.outqty = outqty;
    }




}


