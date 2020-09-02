package com.kh.semiProject.mSales.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Hsales implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5135723630753295338L;

	private int hNum;
	private String hName;
	private String hLocation;
	private int dailyAvg;
	private int dailySales;
	private int montlySales;
	private int yearlySales;
	private int totalSales;
	private Date enrolldate;
	public Hsales() {
		super();
	}
	public Hsales(int hNum, String hName, String hLocation, int dailyAvg, int dailySales, int montlySales,
			int yearlySales, int totalSales, Date enrolldate) {
		super();
		this.hNum = hNum;
		this.hName = hName;
		this.hLocation = hLocation;
		this.dailyAvg = dailyAvg;
		this.dailySales = dailySales;
		this.montlySales = montlySales;
		this.yearlySales = yearlySales;
		this.totalSales = totalSales;
		this.enrolldate = enrolldate;
	}
	public int gethNum() {
		return hNum;
	}
	public void sethNum(int hNum) {
		this.hNum = hNum;
	}
	public String gethName() {
		return hName;
	}
	public void sethName(String hName) {
		this.hName = hName;
	}
	public String gethLocation() {
		return hLocation;
	}
	public void sethLocation(String hLocation) {
		this.hLocation = hLocation;
	}
	public int getDailyAvg() {
		return dailyAvg;
	}
	public void setDailyAvg(int dailyAvg) {
		this.dailyAvg = dailyAvg;
	}
	public int getDailySales() {
		return dailySales;
	}
	public void setDailySales(int dailySales) {
		this.dailySales = dailySales;
	}
	public int getMontlySales() {
		return montlySales;
	}
	public void setMontlySales(int montlySales) {
		this.montlySales = montlySales;
	}
	public int getYearlySales() {
		return yearlySales;
	}
	public void setYearlySales(int yearlySales) {
		this.yearlySales = yearlySales;
	}
	public int getTotalSales() {
		return totalSales;
	}
	public void setTotalSales(int totalSales) {
		this.totalSales = totalSales;
	}
	public Date getEnrolldate() {
		return enrolldate;
	}
	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
	}
	
	
}
