package com.wd.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;
//活动表
public class ActivityVO implements Serializable{
	private static final long serialVersionUID = -4423595454474128876L;
	private String id;//编号,UUID
	private String title;//活动标题
	private Date start_time;//	开始时间
	private Date end_time;//	结束时间
	private String address;//	活动地址
	private String content;//活动内容
	private String logo;//活动图片
	private String status;//状态
	private String buildings_id;
	private BuildingsVO buildings;
	
	public BuildingsVO getBuildings() {
		return buildings;
	}
	public void setBuildings(BuildingsVO buildings) {
		this.buildings = buildings;
	}
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
	public Date getStart_time() {
		return start_time;
	}
	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}
	public Date getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getBuildings_id() {
		return buildings_id;
	}
	public void setBuildings_id(String buildings_id) {
		this.buildings_id = buildings_id;
	}
	
}
