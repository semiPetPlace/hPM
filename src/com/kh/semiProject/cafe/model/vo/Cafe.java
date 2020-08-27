package com.kh.semiProject.cafe.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Cafe implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4207883296931961094L;
	
	
	private int cno;
	private String cimage;
	private String cname;
	private String ctel;
	private String ctime;
	private int cscore;
	private String caddress;
	private String cpromotion;
	private String creview;
	private String crequest;
	private Date cregisterDate;
	private Date cregistration;
	
	
	public Cafe() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public Cafe(int cno, String cimage, String cname, int cscore) {
		super();
		this.cno = cno;
		this.cimage = cimage;
		this.cname = cname;
		this.cscore = cscore;
	}


	public Cafe(int cno, String cimage, String cname, String ctel, String ctime, int cscore, String caddress,
			String cpromotion, String creview, String crequest, Date cregisterDate, Date cregistration) {
		super();
		this.cno = cno;
		this.cimage = cimage;
		this.cname = cname;
		this.ctel = ctel;
		this.ctime = ctime;
		this.cscore = cscore;
		this.caddress = caddress;
		this.cpromotion = cpromotion;
		this.creview = creview;
		this.crequest = crequest;
		this.cregisterDate = cregisterDate;
		this.cregistration = cregistration;
	}


	public int getCno() {
		return cno;
	}


	public void setCno(int cno) {
		this.cno = cno;
	}


	public String getCimage() {
		return cimage;
	}


	public void setCimage(String cimage) {
		this.cimage = cimage;
	}


	public String getCname() {
		return cname;
	}


	public void setCname(String cname) {
		this.cname = cname;
	}


	public String getCtel() {
		return ctel;
	}


	public void setCtel(String ctel) {
		this.ctel = ctel;
	}


	public String getCtime() {
		return ctime;
	}


	public void setCtime(String ctime) {
		this.ctime = ctime;
	}


	public int getCscore() {
		return cscore;
	}


	public void setCscore(int cscore) {
		this.cscore = cscore;
	}


	public String getCaddress() {
		return caddress;
	}


	public void setCaddress(String caddress) {
		this.caddress = caddress;
	}


	public String getCpromotion() {
		return cpromotion;
	}


	public void setCpromotion(String cpromotion) {
		this.cpromotion = cpromotion;
	}


	public String getCreview() {
		return creview;
	}


	public void setCreview(String creview) {
		this.creview = creview;
	}


	public String getCrequest() {
		return crequest;
	}


	public void setCrequest(String crequest) {
		this.crequest = crequest;
	}


	public Date getCregisterDate() {
		return cregisterDate;
	}


	public void setCregisterDate(Date cregisterDate) {
		this.cregisterDate = cregisterDate;
	}


	public Date getCregistration() {
		return cregistration;
	}


	public void setCregistration(Date cregistration) {
		this.cregistration = cregistration;
	}


	@Override
	public String toString() {
		return "cno=" + cno + ", cimage=" + cimage + ", cname=" + cname + ", ctel=" + ctel + ", ctime=" + ctime
				+ ", cscore=" + cscore + ", caddress=" + caddress + ", cpromotion=" + cpromotion + ", creview="
				+ creview + ", crequest=" + crequest + ", cregisterDate=" + cregisterDate + ", cregistration="
				+ cregistration;
	}

}
