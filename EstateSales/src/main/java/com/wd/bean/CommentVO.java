package com.wd.bean;

import java.io.Serializable;
import java.util.Date;

import org.apache.struts2.json.annotations.JSON;

//评价表
public class CommentVO implements Serializable{
	private static final long serialVersionUID = -7928431208010954602L;
	private String id;//编号,UUID
	private String content;//	评价内容
	private String buildings_id;//楼盘编号
	private Date comment_time;//评价时间
	private String user_id;//	用户编号
	private BuildingsVO buildings;
	private UsersVO user;
	
	public BuildingsVO getBuildings() {
		return buildings;
	}
	public void setBuildings(BuildingsVO buildings) {
		this.buildings = buildings;
	}
	
	public UsersVO getUser() {
		return user;
	}
	public void setUser(UsersVO user) {
		this.user = user;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getBuildings_id() {
		return buildings_id;
	}
	public void setBuildings_id(String buildings_id) {
		this.buildings_id = buildings_id;
	}
	public Date getComment_time() {
		return comment_time;
	}
	public void setComment_time(Date comment_time) {
		this.comment_time = comment_time;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
}
