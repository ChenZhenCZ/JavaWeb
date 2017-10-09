package com.wd.bean;

import java.io.Serializable;
import java.util.Date;
//角色权限表
public class RolePermissionVO implements Serializable{
	private static final long serialVersionUID = -5681805698128861620L;
	private String id;//编号,UUID
	private String role_id;//角色编号
	private String permission_id;//权限编号
	private Date created_time;//创建时间

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRole_id() {
		return role_id;
	}
	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}
	public String getPermission_id() {
		return permission_id;
	}
	public void setPermission_id(String permission_id) {
		this.permission_id = permission_id;
	}
	public Date getCreated_time() {
		return created_time;
	}
	public void setCreated_time(Date created_time) {
		this.created_time = created_time;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

}
