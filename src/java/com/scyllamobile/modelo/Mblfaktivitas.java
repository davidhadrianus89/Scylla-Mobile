package com.scyllamobile.modelo;
// Generated May 30, 2017 1:15:21 PM by Hibernate Tools 4.3.1


import java.math.BigDecimal;

/**
 * Mblfaktivitas generated by hbm2java
 */
public class Mblfaktivitas  implements java.io.Serializable {


     private BigDecimal id;
     private String mtgl;
     private String mslsno;
     private String kode;
     private String kodea;
     private String ket;

    public Mblfaktivitas() {
    }

	
    public Mblfaktivitas(BigDecimal id) {
        this.id = id;
    }
    public Mblfaktivitas(BigDecimal id, String mtgl, String mslsno, String kode, String kodea, String ket) {
       this.id = id;
       this.mtgl = mtgl;
       this.mslsno = mslsno;
       this.kode = kode;
       this.kodea = kodea;
       this.ket = ket;
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
    public String getKodea() {
        return this.kodea;
    }
    
    public void setKodea(String kodea) {
        this.kodea = kodea;
    }
    public String getKet() {
        return this.ket;
    }
    
    public void setKet(String ket) {
        this.ket = ket;
    }




}

