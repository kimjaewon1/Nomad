package com.steppe.nomad.bean;

public class Accounting {
	private int pu_num;
	private double pu_money;
	private String pu_mid;
	private int pu_pnum;
	private int pd_punum;
	private int pd_num;
	private String pd_mid;
	private double pd_money;
	private String pd_catagory;

	public Accounting() {//기본 생성자 bean을 잘 활용하기 위해 꼭 필요

	}
	public Accounting(int pu_num, double pu_money, String pu_mid, int pu_pnum) {
		this.pu_num=pu_num;
		this.pu_money=pu_money;
		this.pu_mid=pu_mid;
		this.pu_pnum=pu_pnum;
	}
	public Accounting(int pd_num, int pd_punum, String pd_mid, double pd_money, String pd_catagory) {
		this.pd_num=pd_num;
		this.pd_punum=pd_punum;
		this.pd_mid=pd_mid;
		this.pd_money=pd_money;
		this.pd_catagory=pd_catagory;
	}
	public int getPu_num() {
		return pu_num;
	}
	public void setPu_num(int pu_num) {
		this.pu_num = pu_num;
	}
	
	public double getPu_money() {
		return pu_money;
	}
	public void setPu_money(double pu_money) {
		this.pu_money = pu_money;
	}
	public String getPu_mid() {
		return pu_mid;
	}
	public void setPu_mid(String pu_mid) {
		this.pu_mid = pu_mid;
	}
	public int getPu_pnum() {
		return pu_pnum;
	}
	public void setPu_pnum(int pu_pnum) {
		this.pu_pnum = pu_pnum;
	}
	public int getPd_num() {
		return pd_num;
	}
	public void setPd_num(int pd_num) {
		this.pd_num = pd_num;
	}
	public int getPd_punum() {
		return pd_punum;
	}
	public void setPd_punum(int pd_punum) {
		this.pd_punum = pd_punum;
	}
	public String getPd_mid() {
		return pd_mid;
	}
	public void setPd_mid(String pd_mid) {
		this.pd_mid = pd_mid;
	}
	
	public double getPd_money() {
		return pd_money;
	}
	public void setPd_money(double pd_money) {
		this.pd_money = pd_money;
	}
	public String getPd_catagory() {
		return pd_catagory;
	}
	public void setPd_catagory(String pd_catagory) {
		this.pd_catagory = pd_catagory;
	}
	
}
