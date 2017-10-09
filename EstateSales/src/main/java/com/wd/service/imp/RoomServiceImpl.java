package com.wd.service.imp;

import java.util.List;

import com.wd.bean.AddRoomVO;
import com.wd.bean.BuildingVO;
import com.wd.bean.HourseVO;
import com.wd.bean.RoomVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.RoomDao;

public class RoomServiceImpl implements com.wd.service.RoomService {

	private RoomDao roomDao;
	
	public void setRoomDao(RoomDao roomDao) {
		this.roomDao = roomDao;
	}

	@Override
	public RoomVO queryById(String id) {
		return roomDao.queryById(id);
	}

	@Override
	public void saveOrUpdate(RoomVO t) {
		// TODO Auto-generated method stub

	}

	@Override
	public void del(RoomVO t) {
		// TODO Auto-generated method stub

	}

	@Override
	public PageByEasyUi<RoomVO> queryByPage(PageByEasyUi<RoomVO> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public RoomVO login(RoomVO t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BuildingVO buildingInfo(String buildingId) {
		return roomDao.buildingInfo(buildingId);
	}
	@Override
	public List<HourseVO> houseList(String buildingsId) {
		return roomDao.houseList(buildingsId);
	}
	@Override
	public boolean isExistRoom(AddRoomVO addRoomVO) {
		return roomDao.isExistRoom(addRoomVO);
	}

	@Override
	public void saveRooms(AddRoomVO addRoomVO) {
		int first = Integer.valueOf(addRoomVO.getFirstFloor());
		int last = Integer.valueOf(addRoomVO.getLastFloor());
		for(int i=first;i<=last;i++){
			RoomVO roomVO = new RoomVO();
			//生成房号
			roomVO.setName(addRoomVO.getBuildingName()+i+addRoomVO.getHouseNumber());
			//户型Id
			HourseVO hourseVO = new HourseVO();
			hourseVO.setId(addRoomVO.getHouseId());
			roomVO.setHourse(hourseVO);
			//楼栋Id
			BuildingVO buildingVO = new BuildingVO();
			buildingVO.setId(addRoomVO.getBuildingId());
			roomVO.setBuilding(buildingVO);
			//状态
			roomVO.setSale_status("待售");
			roomDao.saveRooms(roomVO);
		}
	}

	@Override
	public PageByEasyUi<RoomVO> pageByid(PageByEasyUi<RoomVO> page, String buildingId) {
		return roomDao.pageByid(page, buildingId);
	}

	@Override
	public void modifyRoomStatus(RoomVO roomVO) {
		roomDao.modifyRoomStatus(roomVO);
	}

	@Override
	public int empcount(String name,String id) {
		
		return roomDao.empcount(name,id);
	}

	@Override
	public int count(String name, String id) {
		
		return roomDao.count(name, id);
	}

	@Override
	public RoomVO empRoom(String name, String id) {
	
		return roomDao.empRoom(name, id);
	}

	@Override
	public int allcount(String status, String name) {
		
		return roomDao.allcount(status, name);
	}

}
