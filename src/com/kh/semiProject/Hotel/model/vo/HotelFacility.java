package com.kh.semiProject.Hotel.model.vo;

import java.io.Serializable;

public class HotelFacility implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 898295311696995068L;
	
	private int hno;
	private String front;
	private String paking;
	private String restaurant;
	private String roomservice;
	private String fitness;
	private String nosmk;
	private String airport;
	private String disabled;
	private String soundproof;
	private String family;
	private String spa;
	private String sauna;
	private String wifi;
	private String evsc;
	private String pool;
	private String kitchen;
	private String bathroom;
	private String bathtub;
	private String tv;
	private String washer;
	private String outlook;
	private String kettle;
	private String bar;
	private String coffeemachine;
	private String rooftop;
	private String airconditioner;
	private String terrace;
	private String balcony;
	public HotelFacility() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HotelFacility(int hno, String front, String paking, String restaurant, String roomservice, String titness,
			String nosmk, String airport, String disabled, String soundproof, String family, String spa, String sauna,
			String wifi, String evsc, String pool, String kitchen, String bathroom, String bathtub, String tv,
			String washer, String outlook, String kettle, String bar, String coffeemachine, String rooftop,
			String airconditioner, String terrace, String balcony) {
		super();
		this.hno = hno;
		this.front = front;
		this.paking = paking;
		this.restaurant = restaurant;
		this.roomservice = roomservice;
		this.fitness = titness;
		this.nosmk = nosmk;
		this.airport = airport;
		this.disabled = disabled;
		this.soundproof = soundproof;
		this.family = family;
		this.spa = spa;
		this.sauna = sauna;
		this.wifi = wifi;
		this.evsc = evsc;
		this.pool = pool;
		this.kitchen = kitchen;
		this.bathroom = bathroom;
		this.bathtub = bathtub;
		this.tv = tv;
		this.washer = washer;
		this.outlook = outlook;
		this.kettle = kettle;
		this.bar = bar;
		this.coffeemachine = coffeemachine;
		this.rooftop = rooftop;
		this.airconditioner = airconditioner;
		this.terrace = terrace;
		this.balcony = balcony;
	}
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public String getFront() {
		return front;
	}
	public void setFront(String front) {
		this.front = front;
	}
	public String getPaking() {
		return paking;
	}
	public void setPaking(String paking) {
		this.paking = paking;
	}
	public String getRestaurant() {
		return restaurant;
	}
	public void setRestaurant(String restaurant) {
		this.restaurant = restaurant;
	}
	public String getRoomservice() {
		return roomservice;
	}
	public void setRoomservice(String roomservice) {
		this.roomservice = roomservice;
	}
	public String getfitness() {
		return fitness;
	}
	public void setfitness(String titness) {
		this.fitness = titness;
	}
	public String getNosmk() {
		return nosmk;
	}
	public void setNosmk(String nosmk) {
		this.nosmk = nosmk;
	}
	public String getAirport() {
		return airport;
	}
	public void setAirport(String airport) {
		this.airport = airport;
	}
	public String getDisabled() {
		return disabled;
	}
	public void setDisabled(String disabled) {
		this.disabled = disabled;
	}
	public String getSoundproof() {
		return soundproof;
	}
	public void setSoundproof(String soundproof) {
		this.soundproof = soundproof;
	}
	public String getFamily() {
		return family;
	}
	public void setFamily(String family) {
		this.family = family;
	}
	public String getSpa() {
		return spa;
	}
	public void setSpa(String spa) {
		this.spa = spa;
	}
	public String getSauna() {
		return sauna;
	}
	public void setSauna(String sauna) {
		this.sauna = sauna;
	}
	public String getWifi() {
		return wifi;
	}
	public void setWifi(String wifi) {
		this.wifi = wifi;
	}
	public String getEvsc() {
		return evsc;
	}
	public void setEvsc(String evsc) {
		this.evsc = evsc;
	}
	public String getPool() {
		return pool;
	}
	public void setPool(String pool) {
		this.pool = pool;
	}
	public String getKitchen() {
		return kitchen;
	}
	public void setKitchen(String kitchen) {
		this.kitchen = kitchen;
	}
	public String getBathroom() {
		return bathroom;
	}
	public void setBathroom(String bathroom) {
		this.bathroom = bathroom;
	}
	public String getBathtub() {
		return bathtub;
	}
	public void setBathtub(String bathtub) {
		this.bathtub = bathtub;
	}
	public String getTv() {
		return tv;
	}
	public void setTv(String tv) {
		this.tv = tv;
	}
	public String getWasher() {
		return washer;
	}
	public void setWasher(String washer) {
		this.washer = washer;
	}
	public String getOutlook() {
		return outlook;
	}
	public void setOutlook(String outlook) {
		this.outlook = outlook;
	}
	public String getKettle() {
		return kettle;
	}
	public void setKettle(String kettle) {
		this.kettle = kettle;
	}
	public String getBar() {
		return bar;
	}
	public void setBar(String bar) {
		this.bar = bar;
	}
	public String getCoffeemachine() {
		return coffeemachine;
	}
	public void setCoffeemachine(String coffeemachine) {
		this.coffeemachine = coffeemachine;
	}
	public String getRooftop() {
		return rooftop;
	}
	public void setRooftop(String rooftop) {
		this.rooftop = rooftop;
	}
	public String getAirconditioner() {
		return airconditioner;
	}
	public void setAirconditioner(String airconditioner) {
		this.airconditioner = airconditioner;
	}
	public String getTerrace() {
		return terrace;
	}
	public void setTerrace(String terrace) {
		this.terrace = terrace;
	}
	public String getBalcony() {
		return balcony;
	}
	public void setBalcony(String balcony) {
		this.balcony = balcony;
	}
	@Override
	public String toString() {
		return "HotelFacility [hno=" + hno + ", front=" + front + ", paking=" + paking + ", restaurant=" + restaurant
				+ ", roomservice=" + roomservice + ", fitness=" + fitness + ", nosmk=" + nosmk + ", airport=" + airport
				+ ", disabled=" + disabled + ", soundproof=" + soundproof + ", family=" + family + ", spa=" + spa
				+ ", sauna=" + sauna + ", wifi=" + wifi + ", evsc=" + evsc + ", pool=" + pool + ", kitchen=" + kitchen
				+ ", bathroom=" + bathroom + ", bathtub=" + bathtub + ", tv=" + tv + ", washer=" + washer + ", outlook="
				+ outlook + ", kettle=" + kettle + ", bar=" + bar + ", coffeemachine=" + coffeemachine + ", rooftop="
				+ rooftop + ", airconditioner=" + airconditioner + ", terrace=" + terrace + ", balcony=" + balcony
				+ "]";
	}
	
	

}
