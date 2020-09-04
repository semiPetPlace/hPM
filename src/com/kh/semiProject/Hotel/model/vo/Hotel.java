package com.kh.semiProject.Hotel.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Hotel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3278651861553478260L;
    
	private int hNo;
	private String hName;
	private String hTel;
	private int hPrice;	//가격?
	private int hGrade;	//등급
	private int hScore; //평점
	private String hAddress;
	private String hImg;
	private String hPromotion; //홍보글
	private String hRequests; //업체요청글
	private Date hRegisterData; //등록일
	private String hRegistration; //등록여부
	private float lat; // 위도
	private float lng; // 경도
	private String filter; // 필터
	
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
			String hPromotion, String hRequests, Date hRegisterData, String hRegistration) {
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

	public Hotel(int hNo, String hName, String hTel, int hPrice, int hGrade, int hScore, String hAddress, String hImg,
			String hPromotion, String hRequests, Date hRegisterData, String hRegistration, float lat, float lng,
			String filter) {
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
		this.lat = lat;
		this.lng = lng;
		this.filter = filter;
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


	public Date gethRegisterData() {
		return hRegisterData;
	}


	public void sethRegisterData(Date hRegisterData) {
		this.hRegisterData = hRegisterData;
	}


	public String gethRegistration() {
		return hRegistration;
	}


	public void sethRegistration(String hRegistration) {
		this.hRegistration = hRegistration;
	}


	public float getLat() {
		return lat;
	}


	public void setLat(float lat) {
		this.lat = lat;
	}


	public float getLng() {
		return hLng;
	}


	public void setLng(float lng) {
		this.lng = lng;
	}


	public String getFilter() {
		return filter;
	}


	public void setFilter(String filter) {
		this.filter = filter;
	}


	@Override
	public String toString() {
		return "Hotel [hNo=" + hNo + ", hName=" + hName + ", hTel=" + hTel + ", hPrice=" + hPrice + ", hGrade=" + hGrade
				+ ", hScore=" + hScore + ", hAddress=" + hAddress + ", hImg=" + hImg + ", hPromotion=" + hPromotion
				+ ", hRequests=" + hRequests + ", hRegisterData=" + hRegisterData + ", hRegistration=" + hRegistration
				+ ", lat=" + lat + ", lng=" + lng + ", filter=" + filter + "]";
	}

}
