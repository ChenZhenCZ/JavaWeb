package com.wd.bean;

import java.io.Serializable;

public class HouseNameVO implements Serializable{

	private static final long serialVersionUID = 1L;
	//户型下拉框
	private String shi;
	private String ting;
	private String chu;
	private String wei;
	
	public String getShi() {
		return shi;
	}
	public void setShi(String shi) {
		this.shi = shi;
	}
	public String getTing() {
		return ting;
	}
	public void setTing(String ting) {
		this.ting = ting;
	}
	public String getChu() {
		return chu;
	}
	public void setChu(String chu) {
		this.chu = chu;
	}
	public String getWei() {
		return wei;
	}
	public void setWei(String wei) {
		this.wei = wei;
	}
	
	
}
