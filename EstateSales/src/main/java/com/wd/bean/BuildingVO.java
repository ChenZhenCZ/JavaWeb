package com.wd.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;
//楼栋表
public class BuildingVO implements Serializable{
	private static final long serialVersionUID = -2041590068186212336L;
	private String id;//编号,UUID
	private String name;//楼栋名称
	private int total_floor;//总层数
	private int total_lift;//电梯数
	private int floor_rooms;//每层多少户
	private int total_room;//总户数
	private Date created_time;//创建时间
	private String status;//状态，激活或冻结
	private String buildings_id;
	private BuildingsVO buildings;
	private Set<RoomVO>roomSet;
	
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
	public int getTotal_floor() {
		return total_floor;
	}
	public void setTotal_floor(int total_floor) {
		this.total_floor = total_floor;
	}
	public int getTotal_lift() {
		return total_lift;
	}
	public void setTotal_lift(int total_lift) {
		this.total_lift = total_lift;
	}
	public int getFloor_rooms() {
		return floor_rooms;
	}
	public void setFloor_rooms(int floor_rooms) {
		this.floor_rooms = floor_rooms;
	}
	public int getTotal_room() {
		return total_room;
	}
	public void setTotal_room(int total_room) {
		this.total_room = total_room;
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
