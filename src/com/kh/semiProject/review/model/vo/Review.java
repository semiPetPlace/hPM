package com.kh.semiProject.review.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Review implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2583474228614907937L;

	private int rvno;
	private int ctno;
	private String rvtype;
	private String rvwriter;
	private String rvtitle;
	private String rvcontent;
	private String rvimage;
	private int rvScore;
	private Date rvdate;
	private String rvstatus;

	public Review() {
	}

	public Review(int rvno, int ctno, String rvtype, String rvwriter, String rvtitle, String rvcontent, String rvimage,
			int rvScore, Date rvdate, String rvstatus) {
		super();
		this.rvno = rvno;
		this.ctno = ctno;
		this.rvtype = rvtype;
		this.rvwriter = rvwriter;
		this.rvtitle = rvtitle;
		this.rvcontent = rvcontent;
		this.rvimage = rvimage;
		this.rvScore = rvScore;
		this.rvdate = rvdate;
		this.rvstatus = rvstatus;
	}

	public int getRvno() {
		return rvno;
	}

	public void setRvno(int rvno) {
		this.rvno = rvno;
	}

	public int getCtno() {
		return ctno;
	}

	public void setCtno(int ctno) {
		this.ctno = ctno;
	}

	public String getRvtype() {
		return rvtype;
	}

	public void setRvtype(String rvtype) {
		this.rvtype = rvtype;
	}

	public String getRvwriter() {
		return rvwriter;
	}

	public void setRvwriter(String rvwriter) {
		this.rvwriter = rvwriter;
	}

	public String getRvtitle() {
		return rvtitle;
	}

	public void setRvtitle(String rvtitle) {
		this.rvtitle = rvtitle;
	}

	public String getRvcontent() {
		return rvcontent;
	}

	public void setRvcontent(String rvcontent) {
		this.rvcontent = rvcontent;
	}

	public String getRvimage() {
		return rvimage;
	}

	public void setRvimage(String rvimage) {
		this.rvimage = rvimage;
	}

	public int getRvScore() {
		return rvScore;
	}

	public void setRvScore(int rvScore) {
		this.rvScore = rvScore;
	}

	public Date getRvdate() {
		return rvdate;
	}

	public void setRvdate(Date rvdate) {
		this.rvdate = rvdate;
	}

	public String getRvstatus() {
		return rvstatus;
	}

	public void setRvstatus(String rvstatus) {
		this.rvstatus = rvstatus;
	}

	@Override
	public String toString() {
		return "Review [rvno=" + rvno + ", ctno=" + ctno + ", rvtype=" + rvtype + ", rvwriter=" + rvwriter
				+ ", rvtitle=" + rvtitle + ", rvcontent=" + rvcontent + ", rvimage=" + rvimage + ", rvScore=" + rvScore
				+ ", rvdate=" + rvdate + ", rvstatus=" + rvstatus + "]";
	}


	
	
}
