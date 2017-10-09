package com.wd.bean;

import java.io.Serializable;
import java.util.Date;
//点赞记录表
public class LikeVO implements Serializable{
	private static final long serialVersionUID = -1592352337625946942L;
	private String id;//编号,UUID
	private Date created_time;//点赞创建时间
	private String user_id;
	private String buildings_id;
	private UsersVO user;
	private BuildingsVO buildings;
	
	public UsersVO getUser() {
		return user;
	}
	public void setUser(UsersVO user) {
		this.user = user;
	}
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
	public Date getCreated_time() {
		return created_time;
	}
	public void setCreated_time(Date created_time) {
		this.created_time = created_time;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBuildings_id() {
		return buildings_id;
	}
	public void setBuildings_id(String buildings_id) {
		this.buildings_id = buildings_id;
	}

}
