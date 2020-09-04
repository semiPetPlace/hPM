package com.kh.semiProject.Manager.model.vo;

import java.io.Serializable;

public class ReservationManager implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8375000328635427720L;
	
	
	private int reserHnum;
	private String reserHRname;
	private String cIn;
	private String cOut;
	private String cIntime;
	private String totalPrice;
	private String guestName;
	private String guestEmail;
	private String guestRequest;
	private String breakfast;
	private String petNum;
	public ReservationManager() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReservationManager(int reserHnum, String reserHRname, String cIn, String cOut, String cIntime,
			String totalPrice, String guestName, String guestEmail, String guestRequest, String breakfast, String petNum) {
		super();
		this.reserHnum = reserHnum;
		this.reserHRname = reserHRname;
		this.cIn = cIn;
		this.cOut = cOut;
		this.cIntime = cIntime;
		this.totalPrice = totalPrice;
		this.guestName = guestName;
		this.guestEmail = guestEmail;
		this.guestRequest = guestRequest;
		this.breakfast = breakfast;
		this.petNum = petNum;
	}
	public int getReserHnum() {
		return reserHnum;
	}
	public void setReserHnum(int reserHnum) {
		this.reserHnum = reserHnum;
	}
	public String getReserHRname() {
		return reserHRname;
	}
	public void setReserHRname(String reserHRname) {
		this.reserHRname = reserHRname;
	}
	public String getcIn() {
		return cIn;
	}
	public void setcIn(String cIn) {
		this.cIn = cIn;
	}
	public String getcOut() {
		return cOut;
	}
	public void setcOut(String cOut) {
		this.cOut = cOut;
	}
	public String getcIntime() {
		return cIntime;
	}
	public void setcIntime(String cIntime) {
		this.cIntime = cIntime;
	}
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getGuestName() {
		return guestName;
	}
	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}
	public String getGuestEmail() {
		return guestEmail;
	}
	public void setGuestEmail(String guestEmail) {
		this.guestEmail = guestEmail;
	}
	public String getGuestRequest() {
		return guestRequest;
	}
	public void setGuestRequest(String guestRequest) {
		this.guestRequest = guestRequest;
	}
	public String getBreakfast() {
		return breakfast;
	}
	public void setBreakfast(String breakfast) {
		this.breakfast = breakfast;
	}
	public String getPetNum() {
		return petNum;
	}
	public void setPetNum(String petNum) {
		this.petNum = petNum;
	}
	@Override
	public String toString() {
		return "ReservationManager [reserHnum=" + reserHnum + ", reserHRname=" + reserHRname + ", cIn=" + cIn
				+ ", cOut=" + cOut + ", cIntime=" + cIntime + ", totalPrice=" + totalPrice + ", guestName=" + guestName
				+ ", guestEmail=" + guestEmail + ", guestRequest=" + guestRequest + ", breakfast=" + breakfast
				+ ", petNum=" + petNum + "]";
	}

	
	
}
