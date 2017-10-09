package com.wd.bean;

import java.io.Serializable;

public class AdminVO implements Serializable{
	private static final long serialVersionUID = 6948794899774299821L;
	private int id;
	private String adminName;
	private String adminPwd;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminPwd() {
		return adminPwd;
	}
	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}
}
