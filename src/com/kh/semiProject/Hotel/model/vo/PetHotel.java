package com.kh.semiProject.Hotel.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class PetHotel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -74822089977611780L;
	
	private int phno;
	private String phname;
	private String phtel;
	private int phprice;
	private int phscore;
	private String phaddress;
	private String img;
	private String dimg;
	private String phpromotion;
	private String phrequests;
	private Date phregisterdate;
	private String registration;
	private String lat;
	private String lng;
	public PetHotel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PetHotel(int phno, String phname, String phtel, int phprice, int phscore, String phaddress, String img,
			String dimg, String phpromotion, String phrequests) {
		super();
		this.phno = phno;
		this.phname = phname;
		this.phtel = phtel;
		this.phprice = phprice;
		this.phscore = phscore;
		this.phaddress = phaddress;
		this.img = img;
		this.dimg = dimg;
		this.phpromotion = phpromotion;
		this.phrequests = phrequests;
	}
	
	public PetHotel(int phno, String phname, String phtel, int phprice, int phscore, String phaddress, String img,
			String dimg, String phpromotion, String phrequests, Date phregisterdate, String registration, String lat,
			String lng) {
		super();
		this.phno = phno;
		this.phname = phname;
		this.phtel = phtel;
		this.phprice = phprice;
		this.phscore = phscore;
		this.phaddress = phaddress;
		this.img = img;
		this.dimg = dimg;
		this.phpromotion = phpromotion;
		this.phrequests = phrequests;
		this.phregisterdate = phregisterdate;
		this.registration = registration;
		this.lat = lat;
		this.lng = lng;
	}
	public int getPhno() {
		return phno;
	}
	public void setPhno(int phno) {
		this.phno = phno;
	}
	public String getPhname() {
		return phname;
	}
	public void setPhname(String phname) {
		this.phname = phname;
	}
	public String getPhtel() {
		return phtel;
	}
	public void setPhtel(String phtel) {
		this.phtel = phtel;
	}
	public int getPhprice() {
		return phprice;
	}
	public void setPhprice(int phprice) {
		this.phprice = phprice;
	}
	public int getPhscore() {
		return phscore;
	}
	public void setPhscore(int phscore) {
		this.phscore = phscore;
	}
	public String getPhaddress() {
		return phaddress;
	}
	public void setPhaddress(String phaddress) {
		this.phaddress = phaddress;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getDimg() {
		return dimg;
	}
	public void setDimg(String dimg) {
		this.dimg = dimg;
	}
	public String getPhpromotion() {
		return phpromotion;
	}
	public void setPhpromotion(String phpromotion) {
		this.phpromotion = phpromotion;
	}
	public String getPhrequests() {
		return phrequests;
	}
	public void setPhrequests(String phrequests) {
		this.phrequests = phrequests;
	}
	public Date getPhregisterdate() {
		return phregisterdate;
	}
	public void setPhregisterdate(Date phregisterdate) {
		this.phregisterdate = phregisterdate;
	}
	public String getRegistration() {
		return registration;
	}
	public void setRegistration(String registration) {
		this.registration = registration;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	@Override
	public String toString() {
		return "PetHotel [phno=" + phno + ", phname=" + phname + ", phtel=" + phtel + ", phprice=" + phprice
				+ ", phscore=" + phscore + ", phaddress=" + phaddress + ", img=" + img + ", dimg=" + dimg
				+ ", phpromotion=" + phpromotion + ", phrequests=" + phrequests + ", phregisterdate=" + phregisterdate
				+ ", registration=" + registration + ", lat=" + lat + ", lng=" + lng + "]";
	}
	
	
	
}
