package com.kh.semiProject.comment.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Comment implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7740891907609396014L;
	
	private int cmno;
	private int bnno;
	private String cmtype;
	private String cmcontent;
	private String cmwriter;
	private Date cmdate;
	private int ref_cno;
	private int cm_level;
	
	public Comment() {
	}
	
	
	public Comment(int bnno, String cmtype, String cmcontent, String cmwriter, int ref_cno, int cm_level) {
		super();
		this.bnno = bnno;
		this.cmtype = cmtype;
		this.cmcontent = cmcontent;
		this.cmwriter = cmwriter;
		this.ref_cno = ref_cno;
		this.cm_level = cm_level;
	}


	public Comment(int cmno, int bnno, String cmtype, String cmcontent, String cmwriter, Date cmdate, int ref_cno,
			int cm_level) {
		super();
		this.cmno = cmno;
		this.bnno = bnno;
		this.cmtype = cmtype;
		this.cmcontent = cmcontent;
		this.cmwriter = cmwriter;
		this.cmdate = cmdate;
		this.ref_cno = ref_cno;
		this.cm_level = cm_level;
	}


	public int getCmno() {
		return cmno;
	}


	public void setCmno(int cmno) {
		this.cmno = cmno;
	}


	public int getBnno() {
		return bnno;
	}


	public void setBnno(int bnno) {
		this.bnno = bnno;
	}


	public String getCmtype() {
		return cmtype;
	}


	public void setCmtype(String cmtype) {
		this.cmtype = cmtype;
	}


	public String getCmcontent() {
		return cmcontent;
	}


	public void setCmcontent(String cmcontent) {
		this.cmcontent = cmcontent;
	}


	public String getCmwriter() {
		return cmwriter;
	}


	public void setCmwriter(String cmwriter) {
		this.cmwriter = cmwriter;
	}


	public Date getCmdate() {
		return cmdate;
	}


	public void setCmdate(Date cmdate) {
		this.cmdate = cmdate;
	}


	public int getRef_cno() {
		return ref_cno;
	}


	public void setRef_cno(int ref_cno) {
		this.ref_cno = ref_cno;
	}


	public int getCm_level() {
		return cm_level;
	}


	public void setCm_level(int cm_level) {
		this.cm_level = cm_level;
	}


	@Override
	public String toString() {
		return "Comment [cmno=" + cmno + ", bnno=" + bnno + ", cmtype=" + cmtype + ", cmcontent=" + cmcontent
				+ ", cmwriter=" + cmwriter + ", cmdate=" + cmdate + ", ref_cno=" + ref_cno + ", cm_level=" + cm_level
				+ "]";
	}

	
	
	
}
