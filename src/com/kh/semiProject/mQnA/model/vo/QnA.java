package com.kh.semiProject.mQnA.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class QnA implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2485935318523088546L;
	
	private int qno;
	private String clientName;
	private String clientId;
	private String qnaTitle;
	private String qnaText;
	private Date qnaDate;
	private String qnaCategory;
	private String clientEmail;
	private String requester;
	private String reText;
	private Date reDate;
	
	
	
	public QnA() {
		super();
	}

	
	
	public QnA(int qno, String clientName, String clientId, String qnaTitle, Date qnaDate, String qnaCategory) {
		super();
		this.qno = qno;
		this.clientName = clientName;
		this.clientId = clientId;
		this.qnaTitle = qnaTitle;
		this.qnaDate = qnaDate;
		this.qnaCategory = qnaCategory;
	}



	public QnA(String clientName, String qnaTitle, String qnaText, Date qnaDate, String qnaCategory,
			String clientEmail) {
		super();
		this.clientName = clientName;
		this.qnaTitle = qnaTitle;
		this.qnaText = qnaText;
		this.qnaDate = qnaDate;
		this.qnaCategory = qnaCategory;
		this.clientEmail = clientEmail;
	}

	public QnA(String clientName, String qnaTitle, String qnaText, Date qnaDate, String clientEmail, String requester,
			String reTitle,String reText, Date reDate) {
		super();
		this.clientName = clientName;
		this.qnaTitle = qnaTitle;
		this.qnaText = qnaText;
		this.qnaDate = qnaDate;
		this.clientEmail = clientEmail;
		this.requester = requester;
		this.reText = reText;
		this.reDate = reDate;
	}
	
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public String getClientId() {
		return clientId;
	}

	public void setClientId(String clientId) {
		this.clientId = clientId;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaText() {
		return qnaText;
	}

	public void setQnaText(String qnaText) {
		this.qnaText = qnaText;
	}

	public Date getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}

	public String getQnaCategory() {
		return qnaCategory;
	}

	public void setQnaCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
	}

	public String getClientEmail() {
		return clientEmail;
	}

	public void setClientEmail(String clientEmail) {
		this.clientEmail = clientEmail;
	}

	public String getRequester() {
		return requester;
	}

	public void setRequester(String requester) {
		this.requester = requester;
	}

	public String getReText() {
		return reText;
	}

	public void setReText(String reText) {
		this.reText = reText;
	}

	public Date getReDate() {
		return reDate;
	}

	public void setReDate(Date reDate) {
		this.reDate = reDate;
	}



	@Override
	public String toString() {
		return "QnA [qno=" + qno + ", clientName=" + clientName + ", clientId=" + clientId + ", qnaTitle=" + qnaTitle
				+ ", qnaText=" + qnaText + ", qnaDate=" + qnaDate + ", qnaCategory=" + qnaCategory + ", clientEmail="
				+ clientEmail + ", requester=" + requester + ", reText=" + reText + ", reDate=" + reDate + "]";
	}
	
	

	
	
}
