package com.kh.semiProject.Hotel.model.vo;

import java.io.Serializable;

import javax.xml.crypto.Data;

public class Hotel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3278651861553478260L;
	
	private int hNo;
	private String hName;
	private String hTel;
	private int hPrice;
	private int hGrade;
	private int hScore;
	private String hAddress;
	private String hImg;
	private String hPromotion;
	private String hRequests;
	private Data hRegisterData;
	private Data hRegistration;
	public Hotel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Hotel(int hNo, String hName, int hPrice, int hGrade, int hScore, String hAddress, String hImg,
			String hPromotion) {
		super();
		this.hNo = hNo;
		this.hName = hName;
		this.hPrice = hPrice;
		this.hGrade = hGrade;
		this.hScore = hScore;
		this.hAddress = hAddress;
		this.hImg = hImg;
		this.hPromotion = hPromotion;
	}
	public Hotel(int hNo, String hName, String hTel, int hPrice, int hGrade, int hScore, String hAddress, String hImg,
			String hPromotion, String hRequests, Data hRegisterData, Data hRegistration) {
		super();
		this.hNo = hNo;
		this.hName = hName;
		this.hTel = hTel;
		this.hPrice = hPrice;
		this.hGrade = hGrade;
		this.hScore = hScore;
		this.hAddress = hAddress;
		this.hImg = hImg;
		this.hPromotion = hPromotion;
		this.hRequests = hRequests;
		this.hRegisterData = hRegisterData;
		this.hRegistration = hRegistration;
	}
	public int gethNo() {
		return hNo;
	}
	public void sethNo(int hNo) {
		this.hNo = hNo;
	}
	public String gethName() {
		return hName;
	}
	public void sethName(String hName) {
		this.hName = hName;
	}
	public String gethTel() {
		return hTel;
	}
	public void sethTel(String hTel) {
		this.hTel = hTel;
	}
	public int gethPrice() {
		return hPrice;
	}
	public void sethPrice(int hPrice) {
		this.hPrice = hPrice;
	}
	public int gethGrade() {
		return hGrade;
	}
	public void sethGrade(int hGrade) {
		this.hGrade = hGrade;
	}
	public int gethScore() {
		return hScore;
	}
	public void sethScore(int hScore) {
		this.hScore = hScore;
	}
	public String gethAddress() {
		return hAddress;
	}
	public void sethAddress(String hAddress) {
		this.hAddress = hAddress;
	}
	public String gethImg() {
		return hImg;
	}
	public void sethImg(String hImg) {
		this.hImg = hImg;
	}
	public String gethPromotion() {
		return hPromotion;
	}
	public void sethPromotion(String hPromotion) {
		this.hPromotion = hPromotion;
	}
	public String gethRequests() {
		return hRequests;
	}
	public void sethRequests(String hRequests) {
		this.hRequests = hRequests;
	}
	public Data gethRegisterData() {
		return hRegisterData;
	}
	public void sethRegisterData(Data hRegisterData) {
		this.hRegisterData = hRegisterData;
	}
	public Data gethRegistration() {
		return hRegistration;
	}
	public void sethRegistration(Data hRegistration) {
		this.hRegistration = hRegistration;
	}
	@Override
	public String toString() {
		return "Hotel [hNo=" + hNo + ", hName=" + hName + ", hTel=" + hTel + ", hPrice=" + hPrice + ", hGrade=" + hGrade
				+ ", hScore=" + hScore + ", hAddress=" + hAddress + ", hImg=" + hImg + ", hPromotion=" + hPromotion
				+ ", hRequests=" + hRequests + ", hRegisterData=" + hRegisterData + ", hRegistration=" + hRegistration
				+ "]";
	}
	
	
	
	
	

}
