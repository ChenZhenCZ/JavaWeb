package com.wd.bean;

import java.io.Serializable;
import java.util.Date;
//角色表
public class RoleVO implements Serializable{
	private static final long serialVersionUID = 8795612222898914240L;
	private String id;//编号,UUID
	private String name;//角色名称
	private String des;//角色描述
	private Date created_time;//创建时间
	private String status;//状态，激活或冻结
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
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
