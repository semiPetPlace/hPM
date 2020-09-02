package com.kh.semiProject.cafe.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Cafe implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4207883296931961094L;
	
	
	private int cno;
	private String crimage;
	private String cimage;
	private String cname;
	private String ctel;
	private String ctime;
	private double cscore;
	private String caddress;
	private String cdogCompInfo;
	private String cpromotion;
	private String creview;
	private String crequest;
	private Date cregisterDate;
	private String cregistration;
	
	
	public Cafe() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Cafe(int cno, String cimage, String cname, double cscore) {
		super();
		this.cno = cno;
		this.cimage = cimage;
		this.cname = cname;
		this.cscore = cscore;
	}


	public Cafe(String crimage, String cimage, String cname, String ctel, String ctime, double cscore, String caddress,
			String cdogCompInfo, String cpromotion, String creview, String crequest, Date cregisterDate,
			String cregistration) {
		super();
		this.crimage = crimage;
		this.cimage = cimage;
		this.cname = cname;
		this.ctel = ctel;
		this.ctime = ctime;
		this.cscore = cscore;
		this.caddress = caddress;
		this.cdogCompInfo = cdogCompInfo;
		this.cpromotion = cpromotion;
		this.creview = creview;
		this.crequest = crequest;
		this.cregisterDate = cregisterDate;
		this.cregistration = cregistration;
	}


	public Cafe(int cno, String crimage, String cimage, String cname, String ctel, String ctime, double cscore,
			String caddress, String cdogCompInfo, String cpromotion, String creview, String crequest,
			Date cregisterDate, String cregistration) {
		super();
		this.cno = cno;
		this.crimage = crimage;
		this.cimage = cimage;
		this.cname = cname;
		this.ctel = ctel;
		this.ctime = ctime;
		this.cscore = cscore;
		this.caddress = caddress;
		this.cdogCompInfo = cdogCompInfo;
		this.cpromotion = cpromotion;
		this.creview = creview;
		this.crequest = crequest;
		this.cregisterDate = cregisterDate;
		this.cregistration = cregistration;
	}


	public int getCno() {
		return cno;
	}


	public String getCrimage() {
		return crimage;
	}


	public String getCimage() {
		return cimage;
	}


	public String getCname() {
		return cname;
	}


	public String getCtel() {
		return ctel;
	}


	public String getCtime() {
		return ctime;
	}


	public double getCscore() {
		return cscore;
	}


	public String getCaddress() {
		return caddress;
	}


	public String getCdogCompInfo() {
		return cdogCompInfo;
	}


	public String getCpromotion() {
		return cpromotion;
	}


	public String getCreview() {
		return creview;
	}


	public String getCrequest() {
		return crequest;
	}


	public Date getCregisterDate() {
		return cregisterDate;
	}


	public String getCregistration() {
		return cregistration;
	}


	public void setCno(int cno) {
		this.cno = cno;
	}


	public void setCrimage(String crimage) {
		this.crimage = crimage;
	}


	public void setCimage(String cimage) {
		this.cimage = cimage;
	}


	public void setCname(String cname) {
		this.cname = cname;
	}


	public void setCtel(String ctel) {
		this.ctel = ctel;
	}


	public void setCtime(String ctime) {
		this.ctime = ctime;
	}


	public void setCscore(double cscore) {
		this.cscore = cscore;
	}


	public void setCaddress(String caddress) {
		this.caddress = caddress;
	}


	public void setCdogCompInfo(String cdogCompInfo) {
		this.cdogCompInfo = cdogCompInfo;
	}


	public void setCpromotion(String cpromotion) {
		this.cpromotion = cpromotion;
	}


	public void setCreview(String creview) {
		this.creview = creview;
	}


	public void setCrequest(String crequest) {
		this.crequest = crequest;
	}


	public void setCregisterDate(Date cregisterDate) {
		this.cregisterDate = cregisterDate;
	}


	public void setCregistration(String cregistration) {
		this.cregistration = cregistration;
	}


	@Override
	public String toString() {
		return "cno=" + cno + ", crimage=" + crimage + ", cimage=" + cimage + ", cname=" + cname + ", ctel="
				+ ctel + ", ctime=" + ctime + ", cscore=" + cscore + ", caddress=" + caddress + ", cdogCompInfo="
				+ cdogCompInfo + ", cpromotion=" + cpromotion + ", creview=" + creview + ", crequest=" + crequest
				+ ", cregisterDate=" + cregisterDate + ", cregistration=" + cregistration;
	}
}
