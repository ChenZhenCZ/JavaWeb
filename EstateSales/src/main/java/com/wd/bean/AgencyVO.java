package com.wd.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;
//经销商表
public class AgencyVO implements Serializable{
	private static final long serialVersionUID = -8535823873067440042L;
	private String id;//编号
	private String name;//经销商名称
	private String email;//邮件
	private String pwd;//密码
	private String leader;//负责人
	private String phone;//手机号码
	private String tel;//固定电话
	private String address;//地址
	private String logo;//商标图片
	private String intro;//简介
	private Date created_time;//创建时间
	private String status;//状态，激活或冻结
	private Set<BuildingsVO>buildingsSet;
	private Set<EmployeeVO>empSet;
	
	
	@JSON(serialize=false)
	public Set<BuildingsVO> getBuildingsSet() {
		return buildingsSet;
	}
	public void setBuildingsSet(Set<BuildingsVO> buildingsSet) {
		this.buildingsSet = buildingsSet;
	}
	@JSON(serialize=false)
	public Set<EmployeeVO> getEmpSet() {
		return empSet;
	}
	public void setEmpSet(Set<EmployeeVO> empSet) {
		this.empSet = empSet;
	}
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getLeader() {
		return leader;
	}
	public void setLeader(String leader) {
		this.leader = leader;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
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

}
