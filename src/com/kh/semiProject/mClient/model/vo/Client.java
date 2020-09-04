package com.kh.semiProject.mClient.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Client implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1236126488979612621L;
	
	private int userNo;
	private String userId;
	private String userName;
	private int reserCount;
	private int reserCountByY;
	private int totalPrice;
	private int avePrice;
	private int cancelcnt;
	private Date enrollDate;
	private String status;
	public Client() {
		super();
	}
	public Client(int userNo, String userId, String userName, int reserCount, int reserCountByY, int totalPrice,
			int avePrice, int cancelcnt, Date enrollDate, String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.reserCount = reserCount;
		this.reserCountByY = reserCountByY;
		this.totalPrice = totalPrice;
		this.avePrice = avePrice;
		this.cancelcnt = cancelcnt;
		this.enrollDate = enrollDate;
		this.status = status;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getReserCount() {
		return reserCount;
	}
	public void setReserCount(int reserCount) {
		this.reserCount = reserCount;
	}
	public int getReserCountByY() {
		return reserCountByY;
	}
	public void setReserCountByY(int reserCountByY) {
		this.reserCountByY = reserCountByY;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getAvePrice() {
		return avePrice;
	}
	public void setAvePrice(int avePrice) {
		this.avePrice = avePrice;
	}
	public int getCancelcnt() {
		return cancelcnt;
	}
	public void setCancelcnt(int cancelcnt) {
		this.cancelcnt = cancelcnt;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Client [userNo=" + userNo + ", userId=" + userId + ", userName=" + userName + ", reserCount="
				+ reserCount + ", reserCountByY=" + reserCountByY + ", totalPrice=" + totalPrice + ", avePrice="
				+ avePrice + ", cancelcnt=" + cancelcnt + ", enrollDate=" + enrollDate + ", status=" + status + "]";
	}
	
	
	
	
}
