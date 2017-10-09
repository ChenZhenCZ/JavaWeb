package com.wd.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;
//用户表
public class UsersVO implements Serializable{

	private static final long serialVersionUID = 5880978318825937002L;
	private String id;//编号,UUID，主键
	private String email;//用户邮箱,not null
	private String phone;//手机号,unique,not null
	private String pwd;//密码,md5加密，not null
	private String qq;//	qq号
	private String wechat;//微信号
	private String gender;//	性别
	private Date birthday;//生日
	private String nickname;//	昵称
	private String name;//	真实姓名
	private String headicon;//	用户头像，default
	private String address;//家庭地址
	private String introduction;
	private Set<AppointmentVO>appointment;//预约
	private Set<CommentVO> commentSet;//评论
	private Set<HistoryVO>historySet;//浏览记录
	private Set<LikeVO>likeSet;//点赞记录
	
	@JSON(serialize=false)
	public Set<LikeVO> getLikeSet() {
		return likeSet;
	}
	public void setLikeSet(Set<LikeVO> likeSet) {
		this.likeSet = likeSet;
	}
	@JSON(serialize=false)
	public Set<HistoryVO> getHistorySet() {
		return historySet;
	}
	public void setHistorySet(Set<HistoryVO> historySet) {
		this.historySet = historySet;
	}
	@JSON(serialize=false)
	public Set<CommentVO> getCommentSet() {
		return commentSet;
	}
	public void setCommentSet(Set<CommentVO> commentSet) {
		this.commentSet = commentSet;
	}
	@JSON(serialize=false)
	public Set<AppointmentVO> getAppointment() {
		return appointment;
	}
	public void setAppointment(Set<AppointmentVO> appointment) {
		this.appointment = appointment;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getWechat() {
		return wechat;
	}
	public void setWechat(String wechat) {
		this.wechat = wechat;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHeadicon() {
		return headicon;
	}
	public void setHeadicon(String headicon) {
		this.headicon = headicon;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
