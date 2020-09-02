package com.kh.semiProject.mCompany.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Company implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1802201264176942205L;
	
	private int comNum;	//업체번호
	private String category;	//업체분류
	private String cName;	//업체명
	private	String cNum;	//사업자번호
	private	String corp;	// 기업형태
	private Date enrollDate;	//업체등록일
	private String address;	//우편주소
	private String tel;	//업체연락처
	private String rName1;	//대표자
	private String rName2;	//담당자
	private String phone;	//담당자 연락처
	private String email;	//담당자 이메일
	private String bankName;	//은행명
	private String holder;	//예금주
	private String account;	//계좌번호
	private String state;	//업체 활동 상태
	// 총 16
	
	public Company() {
		super();
	}
	
	
	
	public Company(int comNum, String category, String cName, String cNum, String corp, Date enrollDate, String address,
			String phone, String email, String bankName, String state) {
		super();
		this.comNum = comNum;
		this.category = category;
		this.cName = cName;
		this.cNum = cNum;
		this.corp = corp;
		this.enrollDate = enrollDate;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.bankName = bankName;
		this.state = state;
	}



	public Company(String category, String cName, String cNum, String corp, Date enrollDate, String address, String tel,
			String rName1, String rName2, String phone, String email, String bankName, String holder, String account,
			String state) {
		super();
		this.category = category;
		this.cName = cName;
		this.cNum = cNum;
		this.corp = corp;
		this.enrollDate = enrollDate;
		this.address = address;
		this.tel = tel;
		this.rName1 = rName1;
		this.rName2 = rName2;
		this.phone = phone;
		this.email = email;
		this.bankName = bankName;
		this.holder = holder;
		this.account = account;
		this.state = state;
	}

	public Company(int comNum, String category, String cName, String cNum, String corp, Date enrollDate, String address,
			String tel, String rName1, String rName2, String phone, String email, String bankName, String holder,
			String account, String state) {
		super();
		this.comNum = comNum;
		this.category = category;
		this.cName = cName;
		this.cNum = cNum;
		this.corp = corp;
		this.enrollDate = enrollDate;
		this.address = address;
		this.tel = tel;
		this.rName1 = rName1;
		this.rName2 = rName2;
		this.phone = phone;
		this.email = email;
		this.bankName = bankName;
		this.holder = holder;
		this.account = account;
		this.state = state;
	}
	public int getComNum() {
		return comNum;
	}
	public void setComNum(int comNum) {
		this.comNum = comNum;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcNum() {
		return cNum;
	}
	public void setcNum(String cNum) {
		this.cNum = cNum;
	}
	public String getCorp() {
		return corp;
	}
	public void setCorp(String corp) {
		this.corp = corp;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getrName1() {
		return rName1;
	}
	public void setrName1(String rName1) {
		this.rName1 = rName1;
	}
	public String getrName2() {
		return rName2;
	}
	public void setrName2(String rName2) {
		this.rName2 = rName2;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getHolder() {
		return holder;
	}
	public void setHolder(String holder) {
		this.holder = holder;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "Company [comNum=" + comNum + ", category=" + category + ", cName=" + cName + ", cNum=" + cNum
				+ ", corp=" + corp + ", enrollDate=" + enrollDate + ", address=" + address + ", tel=" + tel
				+ ", rName1=" + rName1 + ", rName2=" + rName2 + ", phone=" + phone + ", email=" + email + ", bankName="
				+ bankName + ", holder=" + holder + ", account=" + account + ", state=" + state + "]";
	}

}
