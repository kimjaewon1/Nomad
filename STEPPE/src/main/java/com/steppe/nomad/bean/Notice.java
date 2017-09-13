package com.steppe.nomad.bean;

public class Notice {
	private int n_num;
	private String m_id;
	private String n_mid;
	private String n_title;
	private String n_content;
	private String n_date;
	private String n_mname;
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getN_mname() {
		return n_mname;
	}
	public String setN_mname(String n_mname) {
		return this.n_mname = n_mname;
	}
	public String getN_date() {
		return n_date;
	}
	public void setN_date(String n_date) {
		this.n_date = n_date;
	}
	public int getN_num() {
		return n_num;
	}
	public int setN_num(int n_num) {
		return this.n_num = n_num;
	}
	public String getN_title() {
		return n_title;
	}
	public String getN_mid() {
		return n_mid;
	}
	public void setN_mid(String n_mid) {
		this.n_mid = n_mid;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public int getNoticeNum() {
		return n_num;
	}
	
	

}
