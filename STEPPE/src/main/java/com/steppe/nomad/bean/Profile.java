package com.steppe.nomad.bean;

public class Profile {
private int pro_num;
private String m_id;
private String m_name;
private String mf_sysname;
public String getMf_sysname() {
	return mf_sysname;
}
public void setMf_sysname(String mf_sysname) {
	this.mf_sysname = mf_sysname;
}
private String pro_content;

public String getM_name() {
	return m_name;
}
public void setM_name(String m_name) {
	this.m_name = m_name;
}
public int getPro_num() {
	return pro_num;
}
public void setPro_num(int pro_num) {
	this.pro_num = pro_num;
}
public String getM_id() {
	return m_id;
}
public void setM_id(String m_id) {
	this.m_id = m_id;
}
public String getPro_content() {
	return pro_content;
}
public void setPro_content(String pro_content) {
	this.pro_content = pro_content;
}


}
