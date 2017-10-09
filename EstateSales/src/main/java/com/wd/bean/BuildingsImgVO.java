package com.wd.bean;

import java.io.Serializable;
import java.util.Date;

import org.apache.struts2.json.annotations.JSON;
//楼盘图片表
public class BuildingsImgVO implements Serializable{
	private static final long serialVersionUID = -5994960186275792200L;
	private String id;//编号,UUID
	private String img_path;//图片路径
	private String img_des;//图片简单描述
	private Date created_time;//创建时间
	private String buildings_id;
	private BuildingsVO buildings;
	
	@JSON(serialize=false)
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
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	public String getImg_des() {
		return img_des;
	}
	public void setImg_des(String img_des) {
		this.img_des = img_des;
	}
	public Date getCreated_time() {
		return created_time;
	}
	public void setCreated_time(Date created_time) {
		this.created_time = created_time;
	}
	public String getBuildings_id() {
		return buildings_id;
	}
	public void setBuildings_id(String buildings_id) {
		this.buildings_id = buildings_id;
	}

}
