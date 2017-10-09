package com.wd.service;

import java.util.List;

import com.wd.bean.BuildingVO;
import com.wd.bean.BuildingsVO;
import com.wd.bean.EmployeeVO;
import com.wd.common.PageByEasyUi;

public interface BuildingService extends BaseService<Integer,BuildingVO>{
	//初始化新增活动页面的楼盘下拉框
	public List<BuildingsVO> buildList(String agencyId);
	//楼栋分页
	public PageByEasyUi<BuildingVO> pageByid(PageByEasyUi<BuildingVO> page, String agencyId);
	//楼栋冻结或激活
	public void inOractive(BuildingVO buildingVO);
	//楼栋修改
	public void modifyBuilding(BuildingVO buildingVO);
	//通过条件查询楼栋
	public PageByEasyUi<BuildingVO> pageByid(PageByEasyUi<BuildingVO> page, String agencyId,String buildingsName);
	
	//员工楼栋分页
	public PageByEasyUi<BuildingVO> pageempid(PageByEasyUi<BuildingVO> page, String id);
	//员工通过条件查询楼栋
	public PageByEasyUi<BuildingVO> pageempid(PageByEasyUi<BuildingVO> page, String id,String buildingsName);
}
