package com.wd.dao;

import java.util.List;

import com.wd.bean.BuildingVO;
import com.wd.bean.BuildingsVO;
import com.wd.bean.EmployeeVO;
import com.wd.common.PageByEasyUi;

public interface BuildingDao extends BaseDao<Integer,BuildingVO>{

	//初始化新增楼栋页面的楼盘下拉框
	public List<BuildingsVO> buildList(String agencyId);
	//楼栋分页
	public PageByEasyUi<BuildingVO> pageByid(PageByEasyUi<BuildingVO> page, String agencyId);
	//楼栋冻结或激活
	public void inOractive(BuildingVO buildingVO);
	//通过条件查询楼栋
	public PageByEasyUi<BuildingVO> pageByid(PageByEasyUi<BuildingVO> page, String agencyId,String buildingsName);
	
	//员工楼栋分页
	public PageByEasyUi<BuildingVO> pageempid(PageByEasyUi<BuildingVO> page, String id);
	//员工通过条件查询楼栋
	public PageByEasyUi<BuildingVO> pageempid(PageByEasyUi<BuildingVO> page, String id,String buildingsName);
	//员工楼栋分页记录数
	public int countByEmpId(String id);
	//员工通过条件查询楼栋记录数
	public int countByEmpNameId(String id,String name);
}
