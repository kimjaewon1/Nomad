package com.steppe.nomad.bean;

public class Volunteer {
	private int rownum;
	private int v_num;
	private int v_ptteam;
	private int v_pnum;
	private String v_mid;
	private int v_bid;
	private String v_time;
	private String p_title;
	private String p_mid;
	
	public Volunteer(){
		
	}
	public Volunteer(int rownum, int v_num, String v_mid, int v_bid) {
		//this.rownum=rownum;
		this.v_num=v_num;
		this.v_mid=v_mid;
		this.v_bid=v_bid;
	}
	
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getV_num() {
		return v_num;
	}
	public void setV_num(int v_num) {
		this.v_num = v_num;
	}
	public int getV_ptteam() {
		return v_ptteam;
	}
	public void setV_ptteam(int v_ptteam) {
		this.v_ptteam = v_ptteam;
	}
	public int getV_pnum() {
		return v_pnum;
	}
	public void setV_pnum(int v_pnum) {
		this.v_pnum = v_pnum;
	}
	public String getV_mid() {
		return v_mid;
	}
	public void setV_mid(String v_mid) {
		this.v_mid = v_mid;
	}
	public int getV_bid() {
		return v_bid;
	}
	public void setV_bid(int v_bid) {
		this.v_bid = v_bid;
	}
	public String getV_time() {
		return v_time;
	}
	public void setV_time(String v_time) {
		this.v_time = v_time;

	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public String getP_mid() {
		return p_mid;
	}
	public void setP_mid(String p_mid) {
		this.p_mid = p_mid;
	}
	
	
}
