package com.wd.service.imp;

import java.sql.Date;
import java.util.List;

import com.wd.bean.BuildingVO;
import com.wd.bean.BuildingsVO;
import com.wd.bean.EmployeeVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.BuildingDao;
import com.wd.service.BuildingService;

public class BuildingServiceImp implements BuildingService {

	private BuildingDao buildingDao;
	
	public BuildingDao getBuildingDao() {
		return buildingDao;
	}

	public void setBuildingDao(BuildingDao buildingDao) {
		this.buildingDao = buildingDao;
	}

	@Override
	public BuildingVO queryById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveOrUpdate(BuildingVO t) {
		int total_floor = Integer.valueOf(t.getTotal_floor()); //总层数
		int floor_rooms = Integer.valueOf(t.getFloor_rooms()); //每层多少户
		//计算总户数
		t.setTotal_room(total_floor*floor_rooms);
		t.setCreated_time(new Date(new java.util.Date().getTime()));
		t.setStatus("激活");
		buildingDao.saveOrUpdate(t);
	}

	@Override
	public void del(BuildingVO t) {
		// TODO Auto-generated method stub

	}

	@Override
	public PageByEasyUi<BuildingVO> queryByPage(PageByEasyUi<BuildingVO> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BuildingVO login(BuildingVO t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BuildingsVO> buildList(String agencyId) {
		return buildingDao.buildList(agencyId);
	}

	@Override
	public PageByEasyUi<BuildingVO> pageByid(PageByEasyUi<BuildingVO> page, String agencyId) {
		
		return buildingDao.pageByid(page, agencyId);
	}

	@Override
	public void inOractive(BuildingVO buildingVO) {
		buildingDao.inOractive(buildingVO);
	}

	@Override
	public void modifyBuilding(BuildingVO buildingVO) {
		int total_floor = Integer.valueOf(buildingVO.getTotal_floor()); //总层数
		int floor_rooms = Integer.valueOf(buildingVO.getFloor_rooms()); //每层多少户
		//计算总户数
		buildingVO.setTotal_room(total_floor*floor_rooms);
		buildingDao.saveOrUpdate(buildingVO);
	}

	@Override
	public PageByEasyUi<BuildingVO> pageByid(PageByEasyUi<BuildingVO> page, String agencyId, String buildingsName) {
		return buildingDao.pageByid(page, agencyId, buildingsName);
	}

	@Override
	public PageByEasyUi<BuildingVO> pageempid(PageByEasyUi<BuildingVO> page, String id) {
		
		return buildingDao.pageempid(page, id);
	}

	@Override
	public PageByEasyUi<BuildingVO> pageempid(PageByEasyUi<BuildingVO> page, String id, String buildingsName) {
		
		return buildingDao.pageempid(page, id, buildingsName);
	}

}
