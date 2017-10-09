package com.wd.dao;

import java.util.List;

import com.wd.bean.ActivityVO;
import com.wd.bean.AddRoomVO;
import com.wd.bean.BuildingVO;
import com.wd.bean.HourseVO;
import com.wd.bean.RoomVO;
import com.wd.common.PageByEasyUi;

public interface RoomDao extends BaseDao<String,RoomVO> {

	//查询该楼栋信息
	public BuildingVO buildingInfo(String buildingId);
	//查询该楼盘下的所有户型信息
	public List<HourseVO> houseList(String buildingsId);
	//保存房号
	public void saveRooms(RoomVO roomVO);
	//判断房号是否已生成
	public boolean isExistRoom(AddRoomVO addRoomVO);
	//房号分页
	public PageByEasyUi<RoomVO> pageByid(PageByEasyUi<RoomVO> page, String buildingId);
	//修该房号状态
	public void modifyRoomStatus(RoomVO roomVO);
	
	//经销商房屋销售报表
	public int empcount(String name,String id);
	//员工报表销售统计
	public int count(String name,String id);
	//销售记录添加房号
	public RoomVO empRoom(String name,String id);
	//户型销售情况
	public int allcount(String status,String name);
}
