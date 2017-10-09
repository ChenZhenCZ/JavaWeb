package com.wd.controller;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.engine.transaction.jta.platform.internal.SynchronizationRegistryBasedSynchronizationStrategy;

import com.opensymphony.xwork2.ActionSupport;
import com.wd.bean.ActivityVO;
import com.wd.bean.AgencyVO;
import com.wd.bean.BuildingVO;
import com.wd.bean.BuildingsVO;
import com.wd.bean.EmployeeVO;
import com.wd.common.ControllerResult;
import com.wd.common.PageByEasyUi;
import com.wd.service.BuildingService;

public class BuildingAction extends ActionSupport implements SessionAware{

	private static final long serialVersionUID = 1L;
	private BuildingService buildingService;
	private BuildingVO buildingVO;
	private List<BuildingsVO> buildList;
	private Map session;
	private ControllerResult controllerResult;
	private String buildingsName;	//通过楼盘名称查询楼栋
	
	//楼栋分页
	private int total;
	private List<BuildingVO> rows;
	
	private int pageNumber;
	private int pageSize;

	
	//新增楼栋        初始化楼盘下拉列表
	public String addBuilding(){
		AgencyVO agency = (AgencyVO)session.get("agencyVO");
		buildList = buildingService.buildList(agency.getId());
		return "addBuilding";
	}
	//楼栋新增
	public String save(){
		buildingService.saveOrUpdate(buildingVO);
		return "buildingPage";
	}
	//左菜单楼栋管理点击进入
	public String buildingPage(){
		return "buildingPage";
	}
	public String empbuildingPage(){
		EmployeeVO emp= (EmployeeVO)session.get("emp");
		return"employeePage";
	}
	public String queryBuildByBuildsName(){
		AgencyVO agencyVO = (AgencyVO)session.get("agencyVO");
		PageByEasyUi<BuildingVO>page=new PageByEasyUi<BuildingVO>();
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page=buildingService.pageByid(page, agencyVO.getId(), buildingsName);
		rows=page.getRows();
		total=page.getTotal();
		return "listPage";
	}
	
	//楼栋列表初始化
	public String buildingList(){
		if(buildingsName!=null){
			return queryBuildByBuildsName();
		}
		AgencyVO agencyVO = (AgencyVO)session.get("agencyVO");
		PageByEasyUi<BuildingVO>page=new PageByEasyUi<BuildingVO>();
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page=buildingService.pageByid(page,agencyVO.getId());
		rows=page.getRows();
		total=page.getTotal();
		return "listPage";
	}
	public String queryBuildEmpBuildsName(){
		EmployeeVO emp = (EmployeeVO)session.get("emp");
		PageByEasyUi<BuildingVO>page=new PageByEasyUi<BuildingVO>();
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page=buildingService.pageempid(page, emp.getBuildings().getId(), buildingsName);
		rows=page.getRows();
		total=page.getTotal();
		return "listPage";
	}
	//员工楼栋表初始化
	public String empbuildingList(){
		if(buildingsName!=null){
			return queryBuildEmpBuildsName();
		}
		EmployeeVO emp= (EmployeeVO)session.get("emp");
		PageByEasyUi<BuildingVO>page=new PageByEasyUi<BuildingVO>();
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page=buildingService.pageempid(page, emp.getBuildings().getId());
		rows=page.getRows();
		total=page.getTotal();
		return"listPage";
	}
	//冻结或激活
	public String inOractive(){
		buildingService.inOractive(buildingVO);
		controllerResult = ControllerResult.getSuccessResult("状态修改成功");
		return "listPage";
	}
	//楼栋修改
	public String update(){
		buildingService.modifyBuilding(buildingVO);
		controllerResult = ControllerResult.getSuccessResult("修改成功");
		return "listPage";
	}
	
	
	
	public void setBuildingService(BuildingService buildingService) {
		this.buildingService = buildingService;
	}
	public BuildingVO getBuildingVO() {
		return buildingVO;
	}
	public void setBuildingVO(BuildingVO buildingVO) {
		this.buildingVO = buildingVO;
	}
	@Override
	public void setSession(Map session) {
		this.session = session;
	}
	public List<BuildingsVO> getBuildList() {
		return buildList;
	}
	public int getTotal() {
		return total;
	}
	public List<BuildingVO> getRows() {
		return rows;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public ControllerResult getControllerResult() {
		return controllerResult;
	}
	public void setBuildingsName(String buildingsName) {
		this.buildingsName = buildingsName;
	}
	
}
