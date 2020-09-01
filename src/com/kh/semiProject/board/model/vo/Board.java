package com.kh.semiProject.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4455023591016581023L;

	private int bNo;
	private String bTitle;
	private String bContent;
	private String bWriter;
	private String bImg;
	private Date bDate;
	private String Status;
	private String bUserImg;

	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Board(int bNo, String bTitle, String bContent, String bWriter, String bImg, Date bDate, String status,
			String bUserImg) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriter = bWriter;
		this.bImg = bImg;
		this.bDate = bDate;
		Status = status;
		this.bUserImg = bUserImg;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public String getbImg() {
		return bImg;
	}

	public void setbImg(String bImg) {
		this.bImg = bImg;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	public String getbUserImg() {
		return bUserImg;
	}

	public void setbUserImg(String bUserImg) {
		this.bUserImg = bUserImg;
	}

	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bWriter=" + bWriter
				+ ", bImg=" + bImg + ", Status=" + Status + ", bUserImg=" + bUserImg + "]";
	}

}
