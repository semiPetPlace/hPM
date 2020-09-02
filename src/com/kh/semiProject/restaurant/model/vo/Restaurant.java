package com.kh.semiProject.restaurant.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Restaurant implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -825186780960579523L;
	
	
	private int rno;
	private String rrimage;
	private String rimage;
	private String rname;
	private String rtel;
	private String rtime;
	private double rscore;
	private String raddress;
	private String rdogCompInfo;
	private String rpromotion;
	private String rreview;
	private String rrequest;
	private Date rregisterDate;
	private String rregistration;
	
	public Restaurant() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Restaurant(int rno, String rimage, String rname, double rscore) {
		super();
		this.rno = rno;
		this.rimage = rimage;
		this.rname = rname;
		this.rscore = rscore;
	}

	public Restaurant(String rrimage, String rimage, String rname, String rtel, String rtime, double rscore,
			String raddress, String rdogCompInfo, String rpromotion, String rreview, String rrequest,
			Date rregisterDate, String rregistration) {
		super();
		this.rrimage = rrimage;
		this.rimage = rimage;
		this.rname = rname;
		this.rtel = rtel;
		this.rtime = rtime;
		this.rscore = rscore;
		this.raddress = raddress;
		this.rdogCompInfo = rdogCompInfo;
		this.rpromotion = rpromotion;
		this.rreview = rreview;
		this.rrequest = rrequest;
		this.rregisterDate = rregisterDate;
		this.rregistration = rregistration;
	}

	public Restaurant(int rno, String rrimage, String rimage, String rname, String rtel, String rtime, double rscore,
			String raddress, String rdogCompInfo, String rpromotion, String rreview, String rrequest,
			Date rregisterDate, String rregistration) {
		super();
		this.rno = rno;
		this.rrimage = rrimage;
		this.rimage = rimage;
		this.rname = rname;
		this.rtel = rtel;
		this.rtime = rtime;
		this.rscore = rscore;
		this.raddress = raddress;
		this.rdogCompInfo = rdogCompInfo;
		this.rpromotion = rpromotion;
		this.rreview = rreview;
		this.rrequest = rrequest;
		this.rregisterDate = rregisterDate;
		this.rregistration = rregistration;
	}

	public int getRno() {
		return rno;
	}

	public String getRrimage() {
		return rrimage;
	}

	public String getRimage() {
		return rimage;
	}

	public String getRname() {
		return rname;
	}

	public String getRtel() {
		return rtel;
	}

	public String getRtime() {
		return rtime;
	}

	public double getRscore() {
		return rscore;
	}

	public String getRaddress() {
		return raddress;
	}

	public String getRdogCompInfo() {
		return rdogCompInfo;
	}

	public String getRpromotion() {
		return rpromotion;
	}

	public String getRreview() {
		return rreview;
	}

	public String getRrequest() {
		return rrequest;
	}

	public Date getRregisterDate() {
		return rregisterDate;
	}

	public String getRregistration() {
		return rregistration;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public void setRrimage(String rrimage) {
		this.rrimage = rrimage;
	}

	public void setRimage(String rimage) {
		this.rimage = rimage;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public void setRtel(String rtel) {
		this.rtel = rtel;
	}

	public void setRtime(String rtime) {
		this.rtime = rtime;
	}

	public void setRscore(double rscore) {
		this.rscore = rscore;
	}

	public void setRaddress(String raddress) {
		this.raddress = raddress;
	}

	public void setRdogCompInfo(String rdogCompInfo) {
		this.rdogCompInfo = rdogCompInfo;
	}

	public void setRpromotion(String rpromotion) {
		this.rpromotion = rpromotion;
	}

	public void setRreview(String rreview) {
		this.rreview = rreview;
	}

	public void setRrequest(String rrequest) {
		this.rrequest = rrequest;
	}

	public void setRregisterDate(Date rregisterDate) {
		this.rregisterDate = rregisterDate;
	}

	public void setRregistration(String rregistration) {
		this.rregistration = rregistration;
	}

	@Override
	public String toString() {
		return "rno=" + rno + ", rrimage=" + rrimage + ", rimage=" + rimage + ", rname=" + rname + ", rtel="
				+ rtel + ", rtime=" + rtime + ", rscore=" + rscore + ", raddress=" + raddress + ", rdogCompInfo="
				+ rdogCompInfo + ", rpromotion=" + rpromotion + ", rreview=" + rreview + ", rrequest=" + rrequest
				+ ", rregisterDate=" + rregisterDate + ", rregistration=" + rregistration;
	}
}
