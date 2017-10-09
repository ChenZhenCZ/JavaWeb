package com.wd.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;
//户型表
public class HourseVO implements Serializable{
	private static final long serialVersionUID = -4911036967998731496L;
	private String id;//编号,UUID
	private String name;//户型名称
	private String logo;	//户型图片
	private String intro;	//简介
	private double area;	//面积
	private double unit_price;	 //参考单价
	private Date created_time;  //创建时间
	private String status;	//状态，激活或冻结
	private String buildings_id;
	private BuildingsVO buildings;
	private Set<AppointmentVO>appointmentSet;
	private Set<RoomVO> roomSet;
	
	@JSON(serialize=false)
	 public Set<RoomVO> getRoomSet() {
		return roomSet;
	}
	public void setRoomSet(Set<RoomVO> roomSet) {
		this.roomSet = roomSet;
	}
	public BuildingsVO getBuildings() {
		return buildings;
	}
	public void setBuildings(BuildingsVO buildings) {
		this.buildings = buildings;
	}
	@JSON(serialize=false)
	public Set<AppointmentVO> getAppointmentSet() {
		return appointmentSet;
	}
	public void setAppointmentSet(Set<AppointmentVO> appointmentSet) {
		this.appointmentSet = appointmentSet;
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
	public double getArea() {
		return area;
	}
	public void setArea(double area) {
		this.area = area;
	}
	public double getUnit_price() {
		return unit_price;
	}
	public void setUnit_price(double unit_price) {
		this.unit_price = unit_price;
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
	public String getBuildings_id() {
		return buildings_id;
	}
	public void setBuildings_id(String buildings_id) {
		this.buildings_id = buildings_id;
	}
	
}
