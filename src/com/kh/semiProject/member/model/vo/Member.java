package com.kh.semiProject.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import javax.xml.crypto.Data;

public class Member implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3831619569847507178L;

	private String mno; // 회원 고유번호
	private String mimg; // 회원 이미지
	private String muserId; // 아이디
	private String muserName; // 이름
	private String muserPwd; // 비밀번호
	private String maddress; // 주소
	private String mphone; // 전화번호
	private String tel;
	private String memail; // 이메일
	private String mgender; // 성별
	private String mbirth; // 생년월일
	private Date mRegisterdate; // 회원 가입
	private String mStatus; // 회원 상태

	public Member(String mno, String mimg, String muserId, String muserName, String muserPwd, String maddress,
			String mphone,String tel, String memail, String mgender, String mbirth, Date mRegisterdate, String mStatus) {
		super();
		this.mno = mno;
		this.mimg = mimg;
		this.muserId = muserId;
		this.muserName = muserName;
		this.muserPwd = muserPwd;
		this.maddress = maddress;
		this.mphone = mphone;
		this.tel = tel;
		this.memail = memail;
		this.mgender = mgender;
		this.mbirth = mbirth;
		this.mRegisterdate = mRegisterdate;
		this.mStatus = mStatus;
	}

	public Member() {
		super();
	}

	public Member(String mno, String mimg, String muserId, String muserName, String muserPwd, String maddress,
			String mphone, String memail, String mgender, String mbirth) {
		super();
		this.mno = mno;
		this.mimg = mimg;
		this.muserId = muserId;
		this.muserName = muserName;
		this.muserPwd = muserPwd;
		this.maddress = maddress;
		this.mphone = mphone;
		this.memail = memail;
		this.mgender = mgender;
		this.mbirth = mbirth;
	}

	public Member(String mno, String mName, String mId, String mAddress, String mPhone,String email, String gender, String birth,
			String status, Date registerDate) {
		super();
		this.mno = mno;
		this.muserName = mName;
		this.muserId = mId;
		this.maddress = mAddress;
		this.mphone = mPhone;
		this.memail = email;
		this.mgender = gender;
		this.mbirth = birth;
		this.mStatus = status;
		this.mRegisterdate = registerDate;
		
	}

	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public String getMimg() {
		return mimg;
	}

	public void setMimg(String mimg) {
		this.mimg = mimg;
	}

	public String getMuserId() {
		return muserId;
	}

	public void setMuserId(String muserId) {
		this.muserId = muserId;
	}

	public String getMuserName() {
		return muserName;
	}

	public void setMuserName(String muserName) {
		this.muserName = muserName;
	}

	public String getMuserPwd() {
		return muserPwd;
	}

	public void setMuserPwd(String muserPwd) {
		this.muserPwd = muserPwd;
	}

	public String getMaddress() {
		return maddress;
	}

	public void setMaddress(String maddress) {
		this.maddress = maddress;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMphone() {
		return mphone;
	}

	public void setMphone(String mphone) {
		this.mphone = mphone;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public String getMgender() {
		return mgender;
	}

	public void setMgender(String mgender) {
		this.mgender = mgender;
	}

	public String getMbirth() {
		return mbirth;
	}

	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	public Date getmRegisterdate() {
		return mRegisterdate;
	}

	public void setmRegisterdate(Date mRegisterdate) {
		this.mRegisterdate = mRegisterdate;
	}

	@Override
	public String toString() {
		return "Member [mno=" + mno + ", mimg=" + mimg + ", muserId=" + muserId + ", muserName=" + muserName
				+ ", muserPwd=" + muserPwd + ", maddress=" + maddress + ", mphone=" + mphone + ", memail=" + memail
				+ ", mgender=" + mgender + ", mbirth=" + mbirth + ", mRegisterdate=" + mRegisterdate + ", mStatus="
				+ mStatus + "]";
	}

	

}
