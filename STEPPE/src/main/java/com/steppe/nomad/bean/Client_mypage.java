package com.steppe.nomad.bean;

public class Client_mypage {
	private int p_num;
	private String p_title;
	private int v_num;
	private int v_bid;
	private double sales;
	
	public Client_mypage() {//기본 생성자 bean을 잘 활용하기 위해 꼭 필요

	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public int getV_num() {
		return v_num;
	}
	public void setV_num(int v_num) {
		this.v_num = v_num;
	}
	public int getV_bid() {
		return v_bid;
	}
	public void setV_bid(int v_bid) {
		this.v_bid = v_bid;
	}
	public double getSales() {
		return sales;
	}
	public void setSales(double sales) {
		this.sales = sales;
	}
	
	
	
}
