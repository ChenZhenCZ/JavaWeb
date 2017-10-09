package com.wd.service;

import java.util.List;

import com.wd.bean.ActivityVO;
import com.wd.bean.AddRoomVO;
import com.wd.bean.BuildingVO;
import com.wd.bean.HourseVO;
import com.wd.bean.RoomVO;
import com.wd.common.PageByEasyUi;

public interface RoomService extends BaseService<String,RoomVO> {

	//查询该楼栋信息
	public BuildingVO buildingInfo(String buildingId);
	//查询该楼盘下的所有户型信息
	public List<HourseVO> houseList(String buildingsId);
	//判断房号是否已生成
	public boolean isExistRoom(AddRoomVO addRoomVO);
	//生成房号
	public void saveRooms(AddRoomVO addRoomVO);
	//房号分页
	public PageByEasyUi<RoomVO> pageByid(PageByEasyUi<RoomVO> page, String buildingId);
	//修该房号状态
	public void modifyRoomStatus(RoomVO roomVO);
	//报表销售统计
	public int empcount(String name,String id);
	//员工报表销售统计
	public int count(String name,String id);
	//销售记录添加房号
	public RoomVO empRoom(String name,String id);
	//户型销售情况
	public int allcount(String status,String name);
}
