package com.scyllamobile.modelo;
// Generated Jun 8, 2017 5:46:44 AM by Hibernate Tools 4.3.1


import java.math.BigDecimal;

/**
 * Mblfparam generated by hbm2java
 */
public class Mblfparam  implements java.io.Serializable {


     private BigDecimal id;
     private String mtgl;
     private String slsno;
     private String slsname;
     private String slstp;
     private BigDecimal weekno;
     private BigDecimal prdno;
     private String transdate;
     private String team;
     private String teamdesc;
     private BigDecimal ruteno;
     private BigDecimal nruteno;
     private String slspass;
     private BigDecimal growth;
     private String distbarc;
     private String distid;
     private String distnm;
     private String flagrute;
     private BigDecimal target;
     private BigDecimal pc;
     private BigDecimal ec;
     private String actcust;
     private BigDecimal seqdummy;
     private String flagcash;
     private BigDecimal maxvisit;
     private String flagkompttr;
     private String flagcashdiscr;
     private String flagkunjung;
     private String flaglevdis;
     private String flagapl;
     private String flagtop;
     private String lblpc1;
     private String lblpc2;
     private String lblpc3;
     private String lblot1;
     private String lblot2;
     private String lblot3;
     private String flagprs;
     private String flaggeo;
     private String flagbarcode;
     private BigDecimal radius;

    public Mblfparam() {
    }

	
    public Mblfparam(BigDecimal id) {
        this.id = id;
    }
    public Mblfparam(BigDecimal id, String mtgl, String slsno, String slsname, String slstp, BigDecimal weekno, BigDecimal prdno, String transdate, String team, String teamdesc, BigDecimal ruteno, BigDecimal nruteno, String slspass, BigDecimal growth, String distbarc, String distid, String distnm, String flagrute, BigDecimal target, BigDecimal pc, BigDecimal ec, String actcust, BigDecimal seqdummy, String flagcash, BigDecimal maxvisit, String flagkompttr, String flagcashdiscr, String flagkunjung, String flaglevdis, String flagapl, String flagtop, String lblpc1, String lblpc2, String lblpc3, String lblot1, String lblot2, String lblot3, String flagprs, String flaggeo, String flagbarcode, BigDecimal radius) {
       this.id = id;
       this.mtgl = mtgl;
       this.slsno = slsno;
       this.slsname = slsname;
       this.slstp = slstp;
       this.weekno = weekno;
       this.prdno = prdno;
       this.transdate = transdate;
       this.team = team;
       this.teamdesc = teamdesc;
       this.ruteno = ruteno;
       this.nruteno = nruteno;
       this.slspass = slspass;
       this.growth = growth;
       this.distbarc = distbarc;
       this.distid = distid;
       this.distnm = distnm;
       this.flagrute = flagrute;
       this.target = target;
       this.pc = pc;
       this.ec = ec;
       this.actcust = actcust;
       this.seqdummy = seqdummy;
       this.flagcash = flagcash;
       this.maxvisit = maxvisit;
       this.flagkompttr = flagkompttr;
       this.flagcashdiscr = flagcashdiscr;
       this.flagkunjung = flagkunjung;
       this.flaglevdis = flaglevdis;
       this.flagapl = flagapl;
       this.flagtop = flagtop;
       this.lblpc1 = lblpc1;
       this.lblpc2 = lblpc2;
       this.lblpc3 = lblpc3;
       this.lblot1 = lblot1;
       this.lblot2 = lblot2;
       this.lblot3 = lblot3;
       this.flagprs = flagprs;
       this.flaggeo = flaggeo;
       this.flagbarcode = flagbarcode;
       this.radius = radius;
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
    public String getSlsno() {
        return this.slsno;
    }
    
    public void setSlsno(String slsno) {
        this.slsno = slsno;
    }
    public String getSlsname() {
        return this.slsname;
    }
    
    public void setSlsname(String slsname) {
        this.slsname = slsname;
    }
    public String getSlstp() {
        return this.slstp;
    }
    
    public void setSlstp(String slstp) {
        this.slstp = slstp;
    }
    public BigDecimal getWeekno() {
        return this.weekno;
    }
    
    public void setWeekno(BigDecimal weekno) {
        this.weekno = weekno;
    }
    public BigDecimal getPrdno() {
        return this.prdno;
    }
    
    public void setPrdno(BigDecimal prdno) {
        this.prdno = prdno;
    }
    public String getTransdate() {
        return this.transdate;
    }
    
    public void setTransdate(String transdate) {
        this.transdate = transdate;
    }
    public String getTeam() {
        return this.team;
    }
    
    public void setTeam(String team) {
        this.team = team;
    }
    public String getTeamdesc() {
        return this.teamdesc;
    }
    
    public void setTeamdesc(String teamdesc) {
        this.teamdesc = teamdesc;
    }
    public BigDecimal getRuteno() {
        return this.ruteno;
    }
    
    public void setRuteno(BigDecimal ruteno) {
        this.ruteno = ruteno;
    }
    public BigDecimal getNruteno() {
        return this.nruteno;
    }
    
    public void setNruteno(BigDecimal nruteno) {
        this.nruteno = nruteno;
    }
    public String getSlspass() {
        return this.slspass;
    }
    
    public void setSlspass(String slspass) {
        this.slspass = slspass;
    }
    public BigDecimal getGrowth() {
        return this.growth;
    }
    
    public void setGrowth(BigDecimal growth) {
        this.growth = growth;
    }
    public String getDistbarc() {
        return this.distbarc;
    }
    
    public void setDistbarc(String distbarc) {
        this.distbarc = distbarc;
    }
    public String getDistid() {
        return this.distid;
    }
    
    public void setDistid(String distid) {
        this.distid = distid;
    }
    public String getDistnm() {
        return this.distnm;
    }
    
    public void setDistnm(String distnm) {
        this.distnm = distnm;
    }
    public String getFlagrute() {
        return this.flagrute;
    }
    
    public void setFlagrute(String flagrute) {
        this.flagrute = flagrute;
    }
    public BigDecimal getTarget() {
        return this.target;
    }
    
    public void setTarget(BigDecimal target) {
        this.target = target;
    }
    public BigDecimal getPc() {
        return this.pc;
    }
    
    public void setPc(BigDecimal pc) {
        this.pc = pc;
    }
    public BigDecimal getEc() {
        return this.ec;
    }
    
    public void setEc(BigDecimal ec) {
        this.ec = ec;
    }
    public String getActcust() {
        return this.actcust;
    }
    
    public void setActcust(String actcust) {
        this.actcust = actcust;
    }
    public BigDecimal getSeqdummy() {
        return this.seqdummy;
    }
    
    public void setSeqdummy(BigDecimal seqdummy) {
        this.seqdummy = seqdummy;
    }
    public String getFlagcash() {
        return this.flagcash;
    }
    
    public void setFlagcash(String flagcash) {
        this.flagcash = flagcash;
    }
    public BigDecimal getMaxvisit() {
        return this.maxvisit;
    }
    
    public void setMaxvisit(BigDecimal maxvisit) {
        this.maxvisit = maxvisit;
    }
    public String getFlagkompttr() {
        return this.flagkompttr;
    }
    
    public void setFlagkompttr(String flagkompttr) {
        this.flagkompttr = flagkompttr;
    }
    public String getFlagcashdiscr() {
        return this.flagcashdiscr;
    }
    
    public void setFlagcashdiscr(String flagcashdiscr) {
        this.flagcashdiscr = flagcashdiscr;
    }
    public String getFlagkunjung() {
        return this.flagkunjung;
    }
    
    public void setFlagkunjung(String flagkunjung) {
        this.flagkunjung = flagkunjung;
    }
    public String getFlaglevdis() {
        return this.flaglevdis;
    }
    
    public void setFlaglevdis(String flaglevdis) {
        this.flaglevdis = flaglevdis;
    }
    public String getFlagapl() {
        return this.flagapl;
    }
    
    public void setFlagapl(String flagapl) {
        this.flagapl = flagapl;
    }
    public String getFlagtop() {
        return this.flagtop;
    }
    
    public void setFlagtop(String flagtop) {
        this.flagtop = flagtop;
    }
    public String getLblpc1() {
        return this.lblpc1;
    }
    
    public void setLblpc1(String lblpc1) {
        this.lblpc1 = lblpc1;
    }
    public String getLblpc2() {
        return this.lblpc2;
    }
    
    public void setLblpc2(String lblpc2) {
        this.lblpc2 = lblpc2;
    }
    public String getLblpc3() {
        return this.lblpc3;
    }
    
    public void setLblpc3(String lblpc3) {
        this.lblpc3 = lblpc3;
    }
    public String getLblot1() {
        return this.lblot1;
    }
    
    public void setLblot1(String lblot1) {
        this.lblot1 = lblot1;
    }
    public String getLblot2() {
        return this.lblot2;
    }
    
    public void setLblot2(String lblot2) {
        this.lblot2 = lblot2;
    }
    public String getLblot3() {
        return this.lblot3;
    }
    
    public void setLblot3(String lblot3) {
        this.lblot3 = lblot3;
    }
    public String getFlagprs() {
        return this.flagprs;
    }
    
    public void setFlagprs(String flagprs) {
        this.flagprs = flagprs;
    }
    public String getFlaggeo() {
        return this.flaggeo;
    }
    
    public void setFlaggeo(String flaggeo) {
        this.flaggeo = flaggeo;
    }
    public String getFlagbarcode() {
        return this.flagbarcode;
    }
    
    public void setFlagbarcode(String flagbarcode) {
        this.flagbarcode = flagbarcode;
    }
    public BigDecimal getRadius() {
        return this.radius;
    }
    
    public void setRadius(BigDecimal radius) {
        this.radius = radius;
    }




}


