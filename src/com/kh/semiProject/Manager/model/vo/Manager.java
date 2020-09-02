package com.kh.semiProject.Manager.model.vo;

import java.io.Serializable;
import java.util.Arrays;

public class Manager implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2484925199104603291L;
	
	private int[] daily;
	private int[] montly;

	private int saleY;
	private int saleM;
	private int saleD;
	private int reservationY;
	private int reservationM;
	private int membercount;
	private int membercountM;
	
	
	
	public Manager() {
		super();
	}


	public Manager(int[] daily,int[] montly) {
		super();
		this.daily = daily;
		this.montly = montly;
	}
	

	public Manager(int saleY, int saleM, int saleD, int reservationY, int reservationM,
			int membercount, int membercountM) {
		super();
		this.saleY = saleY;
		this.saleM = saleM;
		this.saleD = saleD;
		this.reservationY = reservationY;
		this.reservationM = reservationM;
		this.membercount = membercount;
		this.membercountM = membercountM;
	}

	public int[] getDaily() {
		return daily;
	}

	public void setDaily(int[] daily) {
		this.daily = daily;
	}

	public int[] getMontly() {
		return montly;
	}

	public void setMontly(int[] montly) {
		this.montly = montly;
	}

	public int getSaleY() {
		return saleY;
	}

	public void setSaleY(int saleY) {
		this.saleY = saleY;
	}

	public int getSaleM() {
		return saleM;
	}

	public void setSaleM(int saleM) {
		this.saleM = saleM;
	}

	public int getSaleD() {
		return saleD;
	}

	public void setSaleD(int saleD) {
		this.saleD = saleD;
	}

	public int getReservationY() {
		return reservationY;
	}

	public void setReservationY(int reservationY) {
		this.reservationY = reservationY;
	}

	public int getReservationM() {
		return reservationM;
	}

	public void setReservationM(int reservationM) {
		this.reservationM = reservationM;
	}

	public int getMembercount() {
		return membercount;
	}

	public void setMembercount(int membercount) {
		this.membercount = membercount;
	}

	public int getMembercountM() {
		return membercountM;
	}

	public void setMembercountM(int membercountM) {
		this.membercountM = membercountM;
	}

	@Override
	public String toString() {
		return "Manager [daily=" + Arrays.toString(daily) + ", montly=" + Arrays.toString(montly) + ", saleY=" + saleY
				+ ", saleM=" + saleM + ", saleD=" + saleD + ", reservationY=" + reservationY + ", reservationM="
				+ reservationM + ", membercount=" + membercount + ", membercountM=" + membercountM + "]";
	}

	
	
	
	
	
}
