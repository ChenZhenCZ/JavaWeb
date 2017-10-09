package com.wd.controller;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.wd.bean.AddRoomVO;
import com.wd.bean.BuildingVO;
import com.wd.bean.HourseVO;
import com.wd.bean.RoomVO;
import com.wd.common.ControllerResult;
import com.wd.common.PageByEasyUi;
import com.wd.service.RoomService;

public class RoomAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private RoomService roomService;
	private RoomVO roomVO;
	private AddRoomVO room;
	private ControllerResult controllerResult;
	//房号分页
	private int total;
	private List<RoomVO>rows;
	private int pageNumber;
	private int pageSize;
	
	private BuildingVO building;	//楼栋
	private List<HourseVO> hourseList;	//户型集合
	
	private static String  buildingsId; //楼盘Id
	private static String  buildingId;  //楼栋Id
	
	private static String louDongId;	//查看楼栋id
	
	
	public String addRoom(){
		building = roomService.buildingInfo(buildingId);
		hourseList = roomService.houseList(buildingsId);
		return "addRoom";
	}
	//生成房号
	public String save(){
		if(roomService.isExistRoom(room)){ //已经生成房号返回true
			controllerResult = ControllerResult.getFailResult("房号已存在");
			building = roomService.buildingInfo(buildingId);
			hourseList = roomService.houseList(buildingsId);
			return "room";
		}else{
			roomService.saveRooms(room);
			controllerResult = ControllerResult.getSuccessResult("生成成功");
			building = roomService.buildingInfo(buildingId);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
			hourseList = roomService.houseList(buildingsId);
			return "room";
		}
	}
	//查看房号
	public String lookRooms(){
		System.out.println("楼栋id："+louDongId);
		return "lookRoomsPage";
	}
	//员工查看房号
	public String emplookRooms(){
		System.out.println("楼栋id："+louDongId);
		
		return"emplookRoomsPage";
	}
	//房号列表
	public String roomsList(){
		PageByEasyUi<RoomVO>page=new PageByEasyUi<RoomVO>();
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page=roomService.pageByid(page,louDongId);
		rows=page.getRows();
		total=page.getTotal();
		return "roomslist";
	}
	//修改房号状态
	public String modifyStatus(){
		System.out.println(roomVO);
		roomService.modifyRoomStatus(roomVO);
		controllerResult = ControllerResult.getSuccessResult("状态修改成功！");
		return "roomslist";
	}
	
	
	
	
	public RoomVO getRoomVO() {
		return roomVO;
	}
	public void setRoomVO(RoomVO roomVO) {
		this.roomVO = roomVO;
	}
	public void setRoomService(RoomService roomService) {
		this.roomService = roomService;
	}
	public void setBuildingsId(String buildingsId) {
		this.buildingsId = buildingsId;
	}
	public void setBuildingId(String buildingId) {
		this.buildingId = buildingId;
	}
	public BuildingVO getBuilding() {
		return building;
	}
	public List<HourseVO> getHourseList() {
		return hourseList;
	}
	public void setRoom(AddRoomVO room) {
		this.room = room;
	}
	public AddRoomVO getRoom() {
		return room;
	}
	public ControllerResult getControllerResult() {
		return controllerResult;
	}
	public void setLouDongId(String louDongId) {
		this.louDongId = louDongId;
	}
	public int getTotal() {
		return total;
	}
	public List<RoomVO> getRows() {
		return rows;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
}
