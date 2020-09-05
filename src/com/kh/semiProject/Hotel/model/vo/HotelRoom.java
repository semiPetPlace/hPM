package com.kh.semiProject.Hotel.model.vo;

import java.io.Serializable;

public class HotelRoom implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1277443183984026159L;
	
	private int hno;
	private String hname;
	private String rname;
	private int rprice;
	private String rcheckin;
	private String rcheckout;
	private String rimg;
	private String rtub;
	private String rbreakfast;
	private String rbadtype;
	private String rsize;
	private String rview;
	private String rstatus;
	
	public HotelRoom() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public HotelRoom(int hno, String hname, String rname, int rprice, String rimg, String rtub, String rbreakfast,
			String rbadtype, String rsize, String rview) {
		super();
		this.hno = hno;
		this.hname = hname;
		this.rname = rname;
		this.rprice = rprice;
		this.rimg = rimg;
		this.rtub = rtub;
		this.rbreakfast = rbreakfast;
		this.rbadtype = rbadtype;
		this.rsize = rsize;
		this.rview = rview;
	}



	public HotelRoom(int hno, String hname, String rname, int rprice, String rcheckin, String rcheckout, String rimg,
			String rtub, String rbreakfast, String rbadtype, String rsize, String rview) {
		super();
		this.hno = hno;
		this.hname = hname;
		this.rname = rname;
		this.rprice = rprice;
		this.rcheckin = rcheckin;
		this.rcheckout = rcheckout;
		this.rimg = rimg;
		this.rtub = rtub;
		this.rbreakfast = rbreakfast;
		this.rbadtype = rbadtype;
		this.rsize = rsize;
		this.rview = rview;
	}

	
	public HotelRoom(int hno, String hname, String rname, int rprice, String rcheckin, String rcheckout, String rimg,
			String rtub, String rbreakfast, String rbadtype, String rsize, String rview, String rstatus) {
		super();
		this.hno = hno;
		this.hname = hname;
		this.rname = rname;
		this.rprice = rprice;
		this.rcheckin = rcheckin;
		this.rcheckout = rcheckout;
		this.rimg = rimg;
		this.rtub = rtub;
		this.rbreakfast = rbreakfast;
		this.rbadtype = rbadtype;
		this.rsize = rsize;
		this.rview = rview;
		this.rstatus = rstatus;
	}

	public int getHno() {
		return hno;
	}

	public void setHno(int hno) {
		this.hno = hno;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public int getRprice() {
		return rprice;
	}

	public void setRprice(int rprice) {
		this.rprice = rprice;
	}

	public String getRcheckin() {
		return rcheckin;
	}

	public void setRcheckin(String rcheckin) {
		this.rcheckin = rcheckin;
	}

	public String getRcheckout() {
		return rcheckout;
	}

	public void setRcheckout(String rcheckout) {
		this.rcheckout = rcheckout;
	}

	public String getRimg() {
		return rimg;
	}

	public void setRimg(String rimg) {
		this.rimg = rimg;
	}

	public String getRtub() {
		return rtub;
	}

	public void setRtub(String rtub) {
		this.rtub = rtub;
	}

	public String getRbreakfast() {
		return rbreakfast;
	}

	public void setRbreakfast(String rbreakfast) {
		this.rbreakfast = rbreakfast;
	}

	public String getRbadtype() {
		return rbadtype;
	}

	public void setRbadtype(String rbadtype) {
		this.rbadtype = rbadtype;
	}

	public String getRsize() {
		return rsize;
	}

	public void setRsize(String rsize) {
		this.rsize = rsize;
	}

	public String getRview() {
		return rview;
	}

	public void setRview(String rview) {
		this.rview = rview;
	}

	public String getRstatus() {
		return rstatus;
	}

	public void setRstatus(String rstatus) {
		this.rstatus = rstatus;
	}

	@Override
	public String toString() {
		return "HotelRoom [hno=" + hno + ", hname=" + hname + ", rname=" + rname + ", rprice=" + rprice + ", rcheckin="
				+ rcheckin + ", rcheckout=" + rcheckout + ", rimg=" + rimg + ", rtub=" + rtub + ", rbreakfast="
				+ rbreakfast + ", rbadtype=" + rbadtype + ", rsize=" + rsize + ", rview=" + rview + ", rstatus="
				+ rstatus + "]";
	}


}
