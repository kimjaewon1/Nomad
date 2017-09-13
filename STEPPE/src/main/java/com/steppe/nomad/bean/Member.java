package com.steppe.nomad.bean;

public class Member {
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_email;
	private String m_kind;
	private String m_status;
	private String mf_file;
	private String mf_sysname;
	private String eid;//이메일의 아이디부분
	private String dotb;//이메일의 도메인 부분
	public String getMf_sysname() {
		return mf_sysname;
	}
	public void setMf_sysname(String mf_sysname) {
		this.mf_sysname = mf_sysname;
	}
	private String dota;//이메일의 도메인 부분

	public String getDotb() {
		return dotb;
	}
	public void setDotb(String dotb) {
		this.dotb = dotb;
	}
	public String getDota() {
		return dota;
	}
	public void setDota(String dota) {
		this.dota = dota;
	}
	public String getEid() {
		return eid;
	}
	public void setEid(String eid) {
		this.eid = eid;
	}
	
	public String getMf_file() {
		return mf_file;
	}
	public void setMf_file(String mf_file) {
		this.mf_file = mf_file;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_kind() {
		return m_kind;
	}
	public void setM_kind(String m_kind) {
		this.m_kind = m_kind;
	}
	public String getM_status() {
		return m_status;
	}
	public void setM_status(String m_status) {
		this.m_status = m_status;
	}
	
	
	
}
