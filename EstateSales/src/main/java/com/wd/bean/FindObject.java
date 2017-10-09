package com.wd.bean;

import java.io.Serializable;

public class FindObject implements Serializable{
	private static final long serialVersionUID = -4423595454474128876L;
	private String sosuo;//搜索框
	private String area;//区域
	private String house;//房子用处
	private String price;//价格范围
	public String getSosuo() {
		return sosuo;
	}
	public void setSosuo(String sosuo) {
		this.sosuo = sosuo;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getHouse() {
		return house;
	}
	public void setHouse(String house) {
		this.house = house;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
}
