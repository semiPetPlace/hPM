package com.kh.semiProject.Hotel.model.vo;

import java.io.Serializable;

public class HotelConvenience implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6282249615079316374L;

	private int hno;
	private String tansport;
	private String airport;
	private String location;
	private String wifi;
	private String tub;
	public HotelConvenience() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HotelConvenience(int hno, String tansport, String airport, String location, String wifi, String tub) {
		super();
		this.hno = hno;
		this.tansport = tansport;
		this.airport = airport;
		this.location = location;
		this.wifi = wifi;
		this.tub = tub;
	}
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public String getTansport() {
		return tansport;
	}
	public void setTansport(String tansport) {
		this.tansport = tansport;
	}
	public String getAirport() {
		return airport;
	}
	public void setAirport(String airport) {
		this.airport = airport;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getWifi() {
		return wifi;
	}
	public void setWifi(String wifi) {
		this.wifi = wifi;
	}
	public String getTub() {
		return tub;
	}
	public void setTub(String tub) {
		this.tub = tub;
	}
	@Override
	public String toString() {
		return "HotelConvenience [hno=" + hno + ", tansport=" + tansport + ", airport=" + airport + ", location="
				+ location + ", wifi=" + wifi + ", tub=" + tub + "]";
	}
	
}
