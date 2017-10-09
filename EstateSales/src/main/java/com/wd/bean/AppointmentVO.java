package com.wd.bean;

import java.io.Serializable;
import java.util.Date;
//购房预约表
public class AppointmentVO implements Serializable{
	private static final long serialVersionUID = 4027366690239723978L;
	private String id;//	编号,UUID
	private String customer_id;
	private String emp_id;
	private String house_id;
	private Date  app_arrive_time;//预约看房时间
	private String app_status;//预约状态
	private Date created_time;//	创建时间
	private String status;//状态，激活或冻结
	private CustomerVO customer;
	private EmployeeVO emp;
	private HourseVO house;
	
	
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public CustomerVO getCustomer() {
		return customer;
	}
	public void setCustomer(CustomerVO customer) {
		this.customer = customer;
	}
	public EmployeeVO getEmp() {
		return emp;
	}
	public void setEmp(EmployeeVO emp) {
		this.emp = emp;
	}
	public HourseVO getHouse() {
		return house;
	}
	public void setHouse(HourseVO house) {
		this.house = house;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getApp_arrive_time() {
		return app_arrive_time;
	}
	public void setApp_arrive_time(Date app_arrive_time) {
		this.app_arrive_time = app_arrive_time;
	}
	public String getApp_status() {
		return app_status;
	}
	public void setApp_status(String app_status) {
		this.app_status = app_status;
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
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getHouse_id() {
		return house_id;
	}
	public void setHouse_id(String house_id) {
		this.house_id = house_id;
	}
}
