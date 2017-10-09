package com.wd.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;
//员工表
public class EmployeeVO implements Serializable {
	private static final long serialVersionUID = -6880463925965731148L;
	private String id;//员工编号,UUID
	private String name;//员工名称
	private String email;//邮箱，unique
	private String pwd;//密码,自动生成，使用默认密码
	private String phone;//手机号,用于登录账号
	private String qq;//qq号
	private String wechat;//微信号
	private String gender;//性别
	private String exp;//工作经验描述
	private String des;//最多50个字的个人说明
	private String address;//地址
	private double basic_salary;//基本工资
	private String headicon;//头像
	private String intro;//简介
	private String building_id;//负责的楼盘
	private Date created_time;//创建时间
	private String percent; //提成百分比
	private String status;//状态，激活或冻结
	private String agency_id;
	private AgencyVO agency;
	private Set<AppointmentVO> appointmentSet;
	private Set<CustomerVO>customerSet;
	private Set<SaleVO>saleSet;
	private BuildingsVO buildings;
	
	public BuildingsVO getBuildings() {
		return buildings;
	}
	public void setBuildings(BuildingsVO buildings) {
		this.buildings = buildings;
	}
	@JSON(serialize=false)
	public Set<SaleVO> getSaleSet() {
		return saleSet;
	}
	public void setSaleSet(Set<SaleVO> saleSet) {
		this.saleSet = saleSet;
	}
	@JSON(serialize=false)
	public Set<CustomerVO> getCustomerSet() {
		return customerSet;
	}
	public void setCustomerSet(Set<CustomerVO> customerSet) {
		this.customerSet = customerSet;
	}
	@JSON(serialize=false)
	public AgencyVO getAgency() {
		return agency;
	}
	@JSON(serialize=false)
	public Set<AppointmentVO> getAppointmentSet() {
		return appointmentSet;
	}
	public void setAppointmentSet(Set<AppointmentVO> appointmentSet) {
		this.appointmentSet = appointmentSet;
	}
	public void setAgency(AgencyVO agency) {
		this.agency = agency;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	public String getExp() {
		return exp;
	}
	public void setExp(String exp) {
		this.exp = exp;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public double getBasic_salary() {
		return basic_salary;
	}
	public void setBasic_salary(double basic_salary) {
		this.basic_salary = basic_salary;
	}
	public String getHeadicon() {
		return headicon;
	}
	public void setHeadicon(String headicon) {
		this.headicon = headicon;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getBuilding_id() {
		return building_id;
	}
	public void setBuilding_id(String building_id) {
		this.building_id = building_id;
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
	public String getAgency_id() {
		return agency_id;
	}
	public void setAgency_id(String agency_id) {
		this.agency_id = agency_id;
	}
	public String getPercent() {
		return percent;
	}
	public void setPercent(String percent) {
		this.percent = percent;
	}
	
}
