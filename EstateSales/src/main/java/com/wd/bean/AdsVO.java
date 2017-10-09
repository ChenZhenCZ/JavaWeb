package com.wd.bean;

import java.io.Serializable;
import java.util.Date;

//广告表
public class AdsVO implements Serializable{
	private static final long serialVersionUID = 4447878291987195210L;
	private String id;//编号,UUID
	private String title;//广告标题
	private String content;//广告描述
	private String logo;//广告图片路径
	private String ad_url;//广告URL路径，可链接到单独的广告页面
	private String show_status;//是否显示，Y或N
	private int show_order;//显示顺序，按照主页，详情页的从左到右，从上到下的顺序规定广告位置
	private Date created_time;//创建时间
	private String status;//状态，激活或冻结
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getAd_url() {
		return ad_url;
	}
	public void setAd_url(String ad_url) {
		this.ad_url = ad_url;
	}
	public String getShow_status() {
		return show_status;
	}
	public void setShow_status(String show_status) {
		this.show_status = show_status;
	}
	public int getShow_order() {
		return show_order;
	}
	public void setShow_order(int show_order) {
		this.show_order = show_order;
	}
	public Date getCreated_time() {
		return created_time;
	}
	public void setCreated_time(Date created_time) {
		this.created_time = created_time;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
