package com.wd.bean;

import java.io.Serializable;

import org.apache.struts2.json.annotations.JSON;
//房号表
public class RoomVO implements Serializable{
	private static final long serialVersionUID = 6351104593464176633L;
	private String id;//编号,UUID，主键
	private String  name	;//房号名称
	private String  sale_status;//销售状态
	private String hourse_id;
	private String building_id;
	private HourseVO hourse;
	private BuildingVO building;
	
	public HourseVO getHourse() {
		return hourse;
	}
	public void setHourse(HourseVO hourse) {
		this.hourse = hourse;
	}
	@JSON(serialize=false)
	public BuildingVO getBuilding() {
		return building;
	}
	public void setBuilding(BuildingVO building) {
		this.building = building;
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
	public String getSale_status() {
		return sale_status;
	}
	public void setSale_status(String sale_status) {
		this.sale_status = sale_status;
	}
	public String getHourse_id() {
		return hourse_id;
	}
	public void setHourse_id(String hourse_id) {
		this.hourse_id = hourse_id;
	}
	public String getBuilding_id() {
		return building_id;
	}
	public void setBuilding_id(String building_id) {
		this.building_id = building_id;
	}
	
}
