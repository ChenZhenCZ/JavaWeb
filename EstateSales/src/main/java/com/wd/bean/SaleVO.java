package com.wd.bean;

import java.io.Serializable;
import java.util.Date;
//销售记录表
public class SaleVO implements Serializable{
	private static final long serialVersionUID = -2586109334425551267L;
	private String id;//编号,UUID
	private Date sale_time;//销售时间
	private double unit_price;//销售单价
	private double discount;//销售折扣
	private double total_cost;//销售总价
	private Date created_time;//创建时间
	private String status;//状态，激活或冻结
	private String emp_id;
	private String customer_id;
	private String room_id;
	private EmployeeVO emp;
	private CustomerVO customer;
	private RoomVO room;
	public EmployeeVO getEmp() {
		return emp;
	}
	public void setEmp(EmployeeVO emp) {
		this.emp = emp;
	}
	public CustomerVO getCustomer() {
		return customer;
	}
	public void setCustomer(CustomerVO customer) {
		this.customer = customer;
	}
	public RoomVO getRoom() {
		return room;
	}
	public void setRoom(RoomVO room) {
		this.room = room;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getSale_time() {
		return sale_time;
	}
	public void setSale_time(Date sale_time) {
		this.sale_time = sale_time;
	}
	public double getUnit_price() {
		return unit_price;
	}
	public void setUnit_price(double unit_price) {
		this.unit_price = unit_price;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public double getTotal_cost() {
		return total_cost;
	}
	public void setTotal_cost(double total_cost) {
		this.total_cost = total_cost;
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
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getRoom_id() {
		return room_id;
	}
	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}
	
}
