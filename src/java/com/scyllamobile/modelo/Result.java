package com.scyllamobile.modelo;

import java.io.Serializable;
import java.util.List;

@SuppressWarnings("serial")
public class Result implements Serializable {
	
	public List<Mblfaktivitas> aktifitas;
	public List<Mblfarcndn> cndn;
	public List<Mblfarretur> aretur;
	public List<Mblfbotol> botol;
	public List<Mblfbrand> brand;
	public List<Mblfcheq> cheq;
	public List<Mblfcustmst> custmst;
	public List<Mblfdiscd5> fdisc5;
	public List<Mblfdiscd6> fdisc6;
//	public List<Mblfdisch> fdisch;
//	public List<Mblfembtipe> fembtype;
//	public List<Mblfgdisc> fgdisc;
//	public List<Mblfgharga> gharga;
//	public List<Mblfgrowth> fgrowth;
//	public List<Mblfgrupout> groupout;
//	public List<Mblfinfo> info;
//	public List<Mblfkompcust> kompcust;
//	public List<Mblfkompetitor> kompetitor;
//	public List<Mblfkpl> kpl;
	public List<Mblfmaster> master;
//	public List<Mblfnote> note;
//	public List<Mblfnotec> notec;
//	public List<Mblfpckdisc> pckdisc;
//	public List<Mblfpckompt> pckompt;
//	public List<Mblfpiutang> piutang;
//	public List<Mblfprice> price;
//	public List<Mblfpriced> priced;
//	public List<Mblfprlin> prlin;
//	public List<Mblfreasonb> reasonb;
//	public List<Mblfrute> rute;
//	public List<Mblfstcust> stcust;
//	public List<Mblftarget> target;
//	public List<Mblftpr3d1> tpr3d1;
//	public List<Mblftpr3d2> tpr3d2;
//	public List<Mblftpr3d3> tpr3d3;
//	public List<Mblftpr3d5> tpr3d5;
//	public List<Mblftpr3d6> tpr3d6;
//	public List<Mblftpr3h> tpr3h;
//	public List<Mblftransfer> transfer;
//	public List<Mblftretur> retur;
//	public List<Mblftypeout> typeout;
//	public List<Mblftypeout> vdisinvd;
//	public List<Mblfvdisinvh> vdisinvh;
//	public List<Mbltbiaya> tbiaya;
	public List<Mblfparam> param;
	public List<Mblftbank> bank;
	
	
	
	public List<Mblftbank> getBank() {
		return bank;
	}
	public void setBank(List<Mblftbank> bank) {
		this.bank = bank;
	}
	public List<Mblfaktivitas> getAktifitas() {
		return aktifitas;
	}
	public List<Mblfarcndn> getCndn() {
		return cndn;
	}
	public List<Mblfarretur> getAretur() {
		return aretur;
	}
	public List<Mblfbotol> getBotol() {
		return botol;
	}
	public List<Mblfbrand> getBrand() {
		return brand;
	}
	public List<Mblfcheq> getCheq() {
		return cheq;
	}
	public List<Mblfcustmst> getCustmst() {
		return custmst;
	}
	public List<Mblfdiscd5> getFdisc5() {
		return fdisc5;
	}
	public List<Mblfdiscd6> getFdisc6() {
		return fdisc6;
	}
//	public List<Mblfdisch> getFdisch() {
//		return fdisch;
//	}
//	public List<Mblfembtipe> getFembtype() {
//		return fembtype;
//	}
//	public List<Mblfgdisc> getFgdisc() {
//		return fgdisc;
//	}
//	public List<Mblfgharga> getGharga() {
//		return gharga;
//	}
//	public List<Mblfgrowth> getFgrowth() {
//		return fgrowth;
//	}
//	public List<Mblfgrupout> getGroupout() {
//		return groupout;
//	}
//	public List<Mblfinfo> getInfo() {
//		return info;
//	}
//	public List<Mblfkompcust> getKompcust() {
//		return kompcust;
//	}
//	public List<Mblfkompetitor> getKompetitor() {
//		return kompetitor;
//	}
//	public List<Mblfkpl> getKpl() {
//		return kpl;
//	}
//	public List<Mblfmaster> getMaster() {
//		return master;
//	}
//	public List<Mblfnote> getNote() {
//		return note;
//	}
//	public List<Mblfnotec> getNotec() {
//		return notec;
//	}
//	public List<Mblfpckdisc> getPckdisc() {
//		return pckdisc;
//	}
//	public List<Mblfpckompt> getPckompt() {
//		return pckompt;
//	}
//	public List<Mblfpiutang> getPiutang() {
//		return piutang;
//	}
//	public List<Mblfprice> getPrice() {
//		return price;
//	}
//	public List<Mblfpriced> getPriced() {
//		return priced;
//	}
//	public List<Mblfprlin> getPrlin() {
//		return prlin;
//	}
//	public List<Mblfreasonb> getReasonb() {
//		return reasonb;
//	}
//	public List<Mblfrute> getRute() {
//		return rute;
//	}
//	public List<Mblfstcust> getStcust() {
//		return stcust;
//	}
//	public List<Mblftarget> getTarget() {
//		return target;
//	}
//	public List<Mblftpr3d1> getTpr3d1() {
//		return tpr3d1;
//	}
//	public List<Mblftpr3d2> getTpr3d2() {
//		return tpr3d2;
//	}
//	public List<Mblftpr3d3> getTpr3d3() {
//		return tpr3d3;
//	}
//	public List<Mblftpr3d5> getTpr3d5() {
//		return tpr3d5;
//	}
//	public List<Mblftpr3d6> getTpr3d6() {
//		return tpr3d6;
//	}
//	public List<Mblftpr3h> getTpr3h() {
//		return tpr3h;
//	}
//	public List<Mblftransfer> getTransfer() {
//		return transfer;
//	}
//	public List<Mblftretur> getRetur() {
//		return retur;
//	}
//	public List<Mblftypeout> getTypeout() {
//		return typeout;
//	}
//	public List<Mblftypeout> getVdisinvd() {
//		return vdisinvd;
//	}
//	public List<Mblfvdisinvh> getVdisinvh() {
//		return vdisinvh;
//	}
//	public List<Mbltbiaya> getTbiaya() {
//		return tbiaya;
//	}
	public List<Mblfparam> getParam() {
		return param;
	}
	public void setAktifitas(List<Mblfaktivitas> aktifitas) {
		this.aktifitas = aktifitas;
	}
	public void setCndn(List<Mblfarcndn> cndn) {
		this.cndn = cndn;
	}
	public void setAretur(List<Mblfarretur> aretur) {
		this.aretur = aretur;
	}
	public void setBotol(List<Mblfbotol> botol) {
		this.botol = botol;
	}
	public void setBrand(List<Mblfbrand> brand) {
		this.brand = brand;
	}
	public void setCheq(List<Mblfcheq> cheq) {
		this.cheq = cheq;
	}
	public void setCustmst(List<Mblfcustmst> custmst) {
		this.custmst = custmst;
	}
	public void setFdisc5(List<Mblfdiscd5> fdisc5) {
		this.fdisc5 = fdisc5;
	}
	public void setFdisc6(List<Mblfdiscd6> fdisc6) {
		this.fdisc6 = fdisc6;
	}
//	public void setFdisch(List<Mblfdisch> fdisch) {
//		this.fdisch = fdisch;
//	}
//	public void setFembtype(List<Mblfembtipe> fembtype) {
//		this.fembtype = fembtype;
//	}
//	public void setFgdisc(List<Mblfgdisc> fgdisc) {
//		this.fgdisc = fgdisc;
//	}
//	public void setGharga(List<Mblfgharga> gharga) {
//		this.gharga = gharga;
//	}
//	public void setFgrowth(List<Mblfgrowth> fgrowth) {
//		this.fgrowth = fgrowth;
//	}
//	public void setGroupout(List<Mblfgrupout> groupout) {
//		this.groupout = groupout;
//	}
//	public void setInfo(List<Mblfinfo> info) {
//		this.info = info;
//	}
//	public void setKompcust(List<Mblfkompcust> kompcust) {
//		this.kompcust = kompcust;
//	}
//	public void setKompetitor(List<Mblfkompetitor> kompetitor) {
//		this.kompetitor = kompetitor;
//	}
//	public void setKpl(List<Mblfkpl> kpl) {
//		this.kpl = kpl;
//	}
	public void setMaster(List<Mblfmaster> master) {
		this.master = master;
	}
//	public void setNote(List<Mblfnote> note) {
//		this.note = note;
//	}
//	public void setNotec(List<Mblfnotec> notec) {
//		this.notec = notec;
//	}
//	public void setPckdisc(List<Mblfpckdisc> pckdisc) {
//		this.pckdisc = pckdisc;
//	}
//	public void setPckompt(List<Mblfpckompt> pckompt) {
//		this.pckompt = pckompt;
//	}
//	public void setPiutang(List<Mblfpiutang> piutang) {
//		this.piutang = piutang;
//	}
//	public void setPrice(List<Mblfprice> price) {
//		this.price = price;
//	}
//	public void setPriced(List<Mblfpriced> priced) {
//		this.priced = priced;
//	}
//	public void setPrlin(List<Mblfprlin> prlin) {
//		this.prlin = prlin;
//	}
//	public void setReasonb(List<Mblfreasonb> reasonb) {
//		this.reasonb = reasonb;
//	}
//	public void setRute(List<Mblfrute> rute) {
//		this.rute = rute;
//	}
//	public void setStcust(List<Mblfstcust> stcust) {
//		this.stcust = stcust;
//	}
//	public void setTarget(List<Mblftarget> target) {
//		this.target = target;
//	}
//	public void setTpr3d1(List<Mblftpr3d1> tpr3d1) {
//		this.tpr3d1 = tpr3d1;
//	}
//	public void setTpr3d2(List<Mblftpr3d2> tpr3d2) {
//		this.tpr3d2 = tpr3d2;
//	}
//	public void setTpr3d3(List<Mblftpr3d3> tpr3d3) {
//		this.tpr3d3 = tpr3d3;
//	}
//	public void setTpr3d5(List<Mblftpr3d5> tpr3d5) {
//		this.tpr3d5 = tpr3d5;
//	}
//	public void setTpr3d6(List<Mblftpr3d6> tpr3d6) {
//		this.tpr3d6 = tpr3d6;
//	}
//	public void setTpr3h(List<Mblftpr3h> tpr3h) {
//		this.tpr3h = tpr3h;
//	}
//	public void setTransfer(List<Mblftransfer> transfer) {
//		this.transfer = transfer;
//	}
//	public void setRetur(List<Mblftretur> retur) {
//		this.retur = retur;
//	}
//	public void setTypeout(List<Mblftypeout> typeout) {
//		this.typeout = typeout;
//	}
//	public void setVdisinvd(List<Mblftypeout> vdisinvd) {
//		this.vdisinvd = vdisinvd;
//	}
//	public void setVdisinvh(List<Mblfvdisinvh> vdisinvh) {
//		this.vdisinvh = vdisinvh;
//	}
//	public void setTbiaya(List<Mbltbiaya> tbiaya) {
//		this.tbiaya = tbiaya;
//	}
	public void setParam(List<Mblfparam> param) {
		this.param = param;
	}

}
