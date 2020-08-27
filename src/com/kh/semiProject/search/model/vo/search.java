package com.kh.semiProject.search.model.vo;

import java.io.Serializable;

public class search implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7747192174885818206L;
	
	private int H_no;
	private String H_name;
	private String H_score;
	private String H_address;
	private String H_price;
	private String H_promotion;
	public search() {
		super();
		// TODO Auto-generated constructor stub
	}
	public search(int h_no, String h_name, String h_score, String h_address, String h_price, String h_promotion) {
		super();
		H_no = h_no;
		H_name = h_name;
		H_score = h_score;
		H_address = h_address;
		H_price = h_price;
		H_promotion = h_promotion;
	}
	public int getH_no() {
		return H_no;
	}
	public void setH_no(int h_no) {
		H_no = h_no;
	}
	public String getH_name() {
		return H_name;
	}
	public void setH_name(String h_name) {
		H_name = h_name;
	}
	public String getH_score() {
		return H_score;
	}
	public void setH_score(String h_score) {
		H_score = h_score;
	}
	public String getH_address() {
		return H_address;
	}
	public void setH_address(String h_address) {
		H_address = h_address;
	}
	public String getH_price() {
		return H_price;
	}
	public void setH_price(String h_price) {
		H_price = h_price;
	}
	public String getH_promotion() {
		return H_promotion;
	}
	public void setH_promotion(String h_promotion) {
		H_promotion = h_promotion;
	}
	@Override
	public String toString() {
		return "search [H_no=" + H_no + ", H_name=" + H_name + ", H_score=" + H_score + ", H_address=" + H_address
				+ ", H_price=" + H_price + ", H_promotion=" + H_promotion + "]";
	}
	
	
}
