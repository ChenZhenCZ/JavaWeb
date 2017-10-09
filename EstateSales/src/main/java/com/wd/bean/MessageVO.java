package com.wd.bean;

import java.io.Serializable;
import java.util.Date;
//留言表
public class MessageVO implements Serializable{
	private static final long serialVersionUID = 3333938256458197889L;
	private String id;//	编号,UUID
	private String content;//	留言内容
	private String buildings_id;//	楼盘编号
	private String reply;//	回复内容
	private Date leave_time;//	留言时间
	private Date reply_time;//回复时间
	private String user_id;//	用户编号
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
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public Date getLeave_time() {
		return leave_time;
	}
	public void setLeave_time(Date leave_time) {
		this.leave_time = leave_time;
	}
	public Date getReply_time() {
		return reply_time;
	}
	public void setReply_time(Date reply_time) {
		this.reply_time = reply_time;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

}
