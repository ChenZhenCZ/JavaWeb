package com.wd.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.lf5.LogLevel;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.engine.transaction.jta.platform.internal.SynchronizationRegistryBasedSynchronizationStrategy;

import com.opensymphony.xwork2.ActionSupport;
import com.wd.bean.ActivityVO;
import com.wd.bean.AgencyVO;
import com.wd.bean.BuildingsVO;
import com.wd.common.ControllerResult;
import com.wd.common.PageByEasyUi;
import com.wd.service.ActivityService;

public class ActivityAction extends ActionSupport implements ServletRequestAware,SessionAware{

	private static final long serialVersionUID = 1L;
	
	private ActivityService activityService;
	private ActivityVO activityVO;
	private List<BuildingsVO> buildList;
	private ControllerResult controllerResult;
	private Map session;
	//新增活动时,添加活动logo
	private String logoFileName; //文件名
	private File logo; //文件内容
	//修改活动logo
	private String activitylogoFileName; //文件名
	private File activitylogo; //文件内容
	//楼盘分页
	private int total;
	private List<ActivityVO>rows;
	
	private int pageNumber;
	private int pageSize;

	private HttpServletRequest request;
	
	public String activityAdd(){
		AgencyVO agencyVO = (AgencyVO)session.get("agencyVO");
		buildList = activityService.buildList(agencyVO.getId());
		return "activityAdd";
	}
	public String addActivitySuccess(){//新增经销商活动
		activityVO.setStatus("激活");
		activityVO.setLogo(activityService.saveActivityLogoUrl(logoFileName, logo));
		activityService.saveOrUpdate(activityVO);
		return "activityList";
	}
	public String addAdminActivityPage(){
		return "addAdminActivityPage";
	}
	public String addAdminActivity(){//管理员活动新增
		activityVO.setStatus("激活");
		activityVO.setLogo(activityService.saveActivityLogoUrl(logoFileName, logo));
		activityService.saveOrUpdate(activityVO);
		return "adminActivityListPage";
	}
	public String adminActiviList(){//管理员活动列表页面
		return "adminActivityListPage";
	}
	public String list(){//经销商活动列表页面
		return "activityList";
	}
	public String activityList(){//经销商活动列表数据
		AgencyVO agencyVO = (AgencyVO)session.get("agencyVO");
		PageByEasyUi<ActivityVO>page=new PageByEasyUi<ActivityVO>();
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page=activityService.pageByid(page,agencyVO.getId());
		rows=page.getRows();
		total=page.getTotal();
		return "list";
	}
	public String adminActivityList(){//管理员活动列表数据
		PageByEasyUi<ActivityVO>page=new PageByEasyUi<ActivityVO>();
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page=activityService.queryByPage(page);
		rows=page.getRows();
		total=page.getTotal();
		return "list";
	}
	//活动激活或冻结
	public String inOractive(){
		if(session.get("admin")==null&&session.get("agencyVO")==null){
			return "errors";
		}else{
			activityService.inOractive(activityVO);
			controllerResult = ControllerResult.getSuccessResult("冻结或激活成功");
			return "update";
		}
	}
	//活动修改
	public String update(){
		if(session.get("admin")==null&&session.get("agencyVO")==null){
			return "errors";
		}else{
			activityService.saveOrUpdate(activityVO);
			controllerResult = ControllerResult.getSuccessResult("修改成功");
			return "update";
		}
	}
	//修改活动图片
	public String modifyActivityLogo(){
		if(session.get("admin")==null&&session.get("agencyVO")==null){
			return "errors";
		}else{
			String id = request.getParameter("activityid");
			activityVO=new ActivityVO();
			String logoUrl= activityService.saveActivityLogoUrl(activitylogoFileName, activitylogo);
			activityVO.setId(id);
			activityVO.setLogo(logoUrl);
			activityService.modifyActivityLogo(activityVO);
			return "update";
		}
	}
	public void setActivityService(ActivityService activityService) {
		this.activityService = activityService;
	}
	public ActivityVO getActivityVO() {
		return activityVO;
	}
	public void setActivityVO(ActivityVO activityVO) {
		this.activityVO = activityVO;
	}
	public void setLogoFileName(String logoFileName) {
		this.logoFileName = logoFileName;
	}
	public void setLogo(File logo) {
		this.logo = logo;
	}
	public List<BuildingsVO> getBuildList() {
		return buildList;
	}
	public int getTotal() {
		return total;
	}
	public List<ActivityVO> getRows() {
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
	public void setActivitylogoFileName(String activitylogoFileName) {
		this.activitylogoFileName = activitylogoFileName;
	}
	public void setActivitylogo(File activitylogo) {
		this.activitylogo = activitylogo;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
		
	}
	
}
