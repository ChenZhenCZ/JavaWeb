package com.wd.bean;

import java.io.Serializable;
//绩效表
public class MissionVO implements Serializable{
	private static final long serialVersionUID = 3919652020922863582L;
	private String id;//编号,UUID，主键
	private int quantity;//员工任务量
	private int monthes;//月份
	private String emp_id;//员工编号
	private int bonus_percent;//销售提成百分比
	private EmployeeVO emp;
	public EmployeeVO getEmp() {
		return emp;
	}
	public void setEmp(EmployeeVO emp) {
		this.emp = emp;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getMonthes() {
		return monthes;
	}
	public void setMonthes(int monthes) {
		this.monthes = monthes;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public int getBonus_percent() {
		return bonus_percent;
	}
	public void setBonus_percent(int bonus_percent) {
		this.bonus_percent = bonus_percent;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

}
