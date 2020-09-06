package com.kh.semiProject.mypage.model.vo;

import java.io.Serializable;

public class ReservationMana implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7777778942806241405L;
	
	private String reserDate;
	private String reserhotelname;
	private int reserHotelno;
	private String reserRoom;
	private String reserCheckin;
	private String reserCheckout;
	private String reserCheckintime;
	private String reserTotalprice;
	private String reserGuestid;
	private String reserGuestemail;
	private String reserGuestrequest;
	private String reserBreakfast;
	private int reserPetnumber;
	private String reserCancel;
	private String reserUserid;
	private String reserHotelimg;
	private int reserNo;
	public ReservationMana() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReservationMana(String reserDate, String reserhotelname, int reserHotelno, String reserRoom,
			String reserCheckin, String reserCheckout, String reserCheckintime, String reserTotalprice,
			String reserGuestid, String reserGuestemail, String reserGuestrequest, String reserBreakfast,
			int reserPetnumber, String reserCancel, String reserUserid, String reserHotelimg, int reserNo) {
		super();
		this.reserDate = reserDate;
		this.reserhotelname = reserhotelname;
		this.reserHotelno = reserHotelno;
		this.reserRoom = reserRoom;
		this.reserCheckin = reserCheckin;
		this.reserCheckout = reserCheckout;
		this.reserCheckintime = reserCheckintime;
		this.reserTotalprice = reserTotalprice;
		this.reserGuestid = reserGuestid;
		this.reserGuestemail = reserGuestemail;
		this.reserGuestrequest = reserGuestrequest;
		this.reserBreakfast = reserBreakfast;
		this.reserPetnumber = reserPetnumber;
		this.reserCancel = reserCancel;
		this.reserUserid = reserUserid;
		this.reserHotelimg = reserHotelimg;
		this.reserNo = reserNo;
	}
	public String getReserDate() {
		return reserDate;
	}
	public void setReserDate(String reserDate) {
		this.reserDate = reserDate;
	}
	public String getReserhotelname() {
		return reserhotelname;
	}
	public void setReserhotelname(String reserhotelname) {
		this.reserhotelname = reserhotelname;
	}
	public int getReserHotelno() {
		return reserHotelno;
	}
	public void setReserHotelno(int reserHotelno) {
		this.reserHotelno = reserHotelno;
	}
	public String getReserRoom() {
		return reserRoom;
	}
	public void setReserRoom(String reserRoom) {
		this.reserRoom = reserRoom;
	}
	public String getReserCheckin() {
		return reserCheckin;
	}
	public void setReserCheckin(String reserCheckin) {
		this.reserCheckin = reserCheckin;
	}
	public String getReserCheckout() {
		return reserCheckout;
	}
	public void setReserCheckout(String reserCheckout) {
		this.reserCheckout = reserCheckout;
	}
	public String getReserCheckintime() {
		return reserCheckintime;
	}
	public void setReserCheckintime(String reserCheckintime) {
		this.reserCheckintime = reserCheckintime;
	}
	public String getReserTotalprice() {
		return reserTotalprice;
	}
	public void setReserTotalprice(String reserTotalprice) {
		this.reserTotalprice = reserTotalprice;
	}
	public String getReserGuestid() {
		return reserGuestid;
	}
	public void setReserGuestid(String reserGuestid) {
		this.reserGuestid = reserGuestid;
	}
	public String getReserGuestemail() {
		return reserGuestemail;
	}
	public void setReserGuestemail(String reserGuestemail) {
		this.reserGuestemail = reserGuestemail;
	}
	public String getReserGuestrequest() {
		return reserGuestrequest;
	}
	public void setReserGuestrequest(String reserGuestrequest) {
		this.reserGuestrequest = reserGuestrequest;
	}
	public String getReserBreakfast() {
		return reserBreakfast;
	}
	public void setReserBreakfast(String reserBreakfast) {
		this.reserBreakfast = reserBreakfast;
	}
	public int getReserPetnumber() {
		return reserPetnumber;
	}
	public void setReserPetnumber(int reserPetnumber) {
		this.reserPetnumber = reserPetnumber;
	}
	public String getReserCancel() {
		return reserCancel;
	}
	public void setReserCancel(String reserCancel) {
		this.reserCancel = reserCancel;
	}
	public String getReserUserid() {
		return reserUserid;
	}
	public void setReserUserid(String reserUserid) {
		this.reserUserid = reserUserid;
	}
	public String getReserHotelimg() {
		return reserHotelimg;
	}
	public void setReserHotelimg(String reserHotelimg) {
		this.reserHotelimg = reserHotelimg;
	}
	public int getReserNo() {
		return reserNo;
	}
	public void setReserNo(int reserNo) {
		this.reserNo = reserNo;
	}
	@Override
	public String toString() {
		return "ReservationMana [reserDate=" + reserDate + ", reserhotelname=" + reserhotelname + ", reserHotelno="
				+ reserHotelno + ", reserRoom=" + reserRoom + ", reserCheckin=" + reserCheckin + ", reserCheckout="
				+ reserCheckout + ", reserCheckintime=" + reserCheckintime + ", reserTotalprice=" + reserTotalprice
				+ ", reserGuestid=" + reserGuestid + ", reserGuestemail=" + reserGuestemail + ", reserGuestrequest="
				+ reserGuestrequest + ", reserBreakfast=" + reserBreakfast + ", reserPetnumber=" + reserPetnumber
				+ ", reserCancel=" + reserCancel + ", reserUserid=" + reserUserid + ", reserHotelimg=" + reserHotelimg
				+ ", reserNo=" + reserNo + "]";
	}
	
	
		
}
