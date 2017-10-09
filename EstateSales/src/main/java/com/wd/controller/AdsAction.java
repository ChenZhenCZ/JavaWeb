package com.wd.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.wd.bean.AdsVO;
import com.wd.service.AdsService;

public class AdsAction extends ActionSupport{
	private AdsVO ads;
	private AdsService adsService;
	private String logoFileName;//文件名
	private File logo;//文件
	private String msg;
	private int total;
	private List rows;
	private int pageNumber;
	private int pageSize;
	public AdsVO getAds() {
		return ads;
	}
	public void setAds(AdsVO ads) {
		this.ads = ads;
	}
	public void setAdsService(AdsService adsService) {
		this.adsService = adsService;
	}
	public String getMsg() {
		return msg;
	}
	public int getTotal() {
		return total;
	}
	public List getRows() {
		return rows;
	}
	public void setLogoFileName(String logoFileName) {
		this.logoFileName = logoFileName;
	}
	public void setLogo(File logo) {
		this.logo = logo;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
}
