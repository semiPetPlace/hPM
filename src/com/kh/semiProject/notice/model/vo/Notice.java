package com.kh.semiProject.notice.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Notice implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4738097225944567812L;
	
	private int nNo;
	private String nTitle;
	private String nContent;
	private String nWriter;
	private String nImg;
	private Date nDate;
	private String Status;
	private String nUserImg;
	public Notice() {
	}
	public Notice(int nNo, String nTitle, String nContent, String nWriter, String nImg, Date nDate, String status,
			String nUserImg) {
		super();
		this.nNo = nNo;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nWriter = nWriter;
		this.nImg = nImg;
		this.nDate = nDate;
		Status = status;
		this.nUserImg = nUserImg;
	}
	public int getnNo() {
		return nNo;
	}
	public void setnNo(int nNo) {
		this.nNo = nNo;
	}
	public String getnTitle() {
		return nTitle;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	public String getnContent() {
		return nContent;
	}
	public void setnContent(String nContent) {
		this.nContent = nContent;
	}
	public String getnWriter() {
		return nWriter;
	}
	public void setnWriter(String nWriter) {
		this.nWriter = nWriter;
	}
	public String getnImg() {
		return nImg;
	}
	public void setnImg(String nImg) {
		this.nImg = nImg;
	}
	public Date getnDate() {
		return nDate;
	}
	public void setnDate(Date nDate) {
		this.nDate = nDate;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public String getnUserImg() {
		return nUserImg;
	}
	public void setnUserImg(String nUserImg) {
		this.nUserImg = nUserImg;
	}
	@Override
	public String toString() {
		return "Notice [nNo=" + nNo + ", nTitle=" + nTitle + ", nContent=" + nContent + ", nWriter=" + nWriter
				+ ", nImg=" + nImg + ", nDate=" + nDate + ", Status=" + Status + ", nUserImg=" + nUserImg + "]";
	}
	
	
}
