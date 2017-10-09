package com.wd.controller;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.wd.bean.ActivityVO;
import com.wd.bean.AgencyVO;
import com.wd.bean.AppointmentVO;
import com.wd.bean.ArticleVO;
import com.wd.bean.BuildingsVO;
import com.wd.bean.HourseVO;
import com.wd.bean.HouseNameVO;
import com.wd.bean.PageObject;
import com.wd.bean.UsersVO;
import com.wd.common.ControllerResult;
import com.wd.common.PageByEasyUi;
import com.wd.service.AppointmentService;
import com.wd.service.ArticleService;
import com.wd.service.BuildingsService;
import com.wd.service.HouseService;

public class HouseAction extends ActionSupport implements SessionAware,ServletRequestAware{

	private static final long serialVersionUID = 1L;
	private AppointmentService appointmentService;
	private BuildingsService buildingsService;
	private ArticleService articleService;
	private HouseService houseService;
	private List<BuildingsVO> buildingList;
	private HourseVO houseVO;
	private Map session;
	private boolean checkApp=false;
	private ControllerResult controllerResult;
	private HttpServletRequest request;
	private String buildingsName;	//按楼盘名称查询户型
	//新增 户型时   图片上传
	private String houseImgFileName;
	private File houseImg;
	private Set<HourseVO>houseSet;
	//修改户型封面
	private String houselogoFileName;
	private File houselogo;
//	private PageObject poj;
	//户型分页
	private int total;
	private List<HourseVO> rows;
	private int pageNumber;
	private int pageSize;
	private List<ArticleVO>aticleList;
	

	//户型名称
	private HouseNameVO houseName;
	private String msg;
	

	

	private double price;

	//新增户型		初始化楼盘下拉框
	public String addHouse(){
		AgencyVO agency = (AgencyVO)session.get("agencyVO");
		buildingList = houseService.buildList(agency.getId());
		return "addHosue";
	}
	//新增户型
	public String save(){
		String shi = houseName.getShi();
		String ting = houseName.getTing();
		String chu = houseName.getChu();
		String wei = houseName.getWei();
		String houseName = shi+"室"+ting+"厅"+chu+"厨"+wei+"卫";
		if(houseService.isExistHouseName(houseName,houseVO.getBuildings().getId())){ //返回值为真，则数据库存在该户型
			AgencyVO agency = (AgencyVO)session.get("agencyVO");
			buildingList = houseService.buildList(agency.getId());
			msg="1";
			return "addHosue";
		}
		houseVO.setName(houseName);
		houseService.save(houseVO, houseImgFileName, houseImg);
		return "houseList";
	}
	public String list(){
		System.out.println("初始化户型列表");
		return "houseList";
	}
	public String queryHouseByBuildsName(){
		AgencyVO agencyVO = (AgencyVO)session.get("agencyVO");
		PageByEasyUi<HourseVO>page=new PageByEasyUi<HourseVO>();
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page=houseService.pageByid(page, agencyVO.getId(), buildingsName);
		rows=page.getRows();
		total=page.getTotal();
		return "initHouseList";
	}
	public String calc(){
		houseVO=houseService.queryById(houseVO.getId());
		price=houseVO.getArea()*houseVO.getUnit_price();
		return "calc";
	}
	public String houseList(){
		if(buildingsName!=null){
			return queryHouseByBuildsName();
		}
		AgencyVO agencyVO = (AgencyVO)session.get("agencyVO");
		PageByEasyUi<HourseVO>page=new PageByEasyUi<HourseVO>();
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page=houseService.pageByid(page,agencyVO.getId());
		rows=page.getRows();
		total=page.getTotal();
		return "initHouseList";
	}
	//户型冻结或激活
	public String inOractive(){
		houseService.inOractive(houseVO);
		controllerResult = ControllerResult.getSuccessResult("状态修改成功");
		return "initHouseList";
	}
	public String update(){
		houseService.saveOrUpdate(houseVO);
		controllerResult = ControllerResult.getSuccessResult("户型修改成功");
		return "initHouseList";
	}
	
	public String modifyHouseLogo(){
		houseService.modifyHouseImg(request.getParameter("houseId"), houselogoFileName, houselogo);
		controllerResult = ControllerResult.getSuccessResult("户型修改成功");
		return "initHouseList";
	}
	public String oneHourse(){//户型预约界面初始化
		UsersVO user=(UsersVO)session.get("user");
		if(houseVO!=null){
			session.put("houseVO",houseVO);
		}
		aticleList=articleService.listOrderBy();
		houseVO=(HourseVO)session.get("houseVO");
		if(user!=null){
			AppointmentVO app=new AppointmentVO();
			app.setCustomer_id(user.getId());
			app.setHouse_id(houseVO.getId());
			checkApp=appointmentService.checkApp(app);
		}
		houseVO=houseService.queryById(houseVO.getId());
		houseSet=houseVO.getBuildings().getHouseSet();
		buildingList=buildingsService.buildsListByagency(houseVO.getBuildings().getAgency().getId());
		return "houseDetil";
	}
	//经销商查看户型详情
	public String lookhouseDetail(){
		houseVO=houseService.queryById(houseVO.getId());
		return "agencyHouseDetail";
	}
	//前端户型列表页面
	public String allHouseList(){
		
		PageByEasyUi<HourseVO>page=new PageByEasyUi<>();
		String cur = request.getParameter("currentPage");
		String opr = request.getParameter("opr");
		PageObject poj = new PageObject();
		
		//设置记录总数，通过记录总数计算页数
		if(houseVO!=null && !houseVO.getName().equals("")){
			poj.setRecordCount(houseService.getCountByHouseName(houseVO.getName()));	
		}else{
			poj.setRecordCount(houseService.count());
		}
		//设置当前页
		if(cur==null){
			poj.setCurrentPage(1);
		}else {
			poj.setCurrentPage(Integer.valueOf(cur));
		}
		//为操作赋值
		if(opr==null){
			poj.setOpr("first");
		}else{
			poj.setOpr(opr);
		}
		page.setPage(poj.getCurrentPage());
		page.setPageSize(poj.getPageSize());
		//用户条件查询户型
		if(houseVO!=null && !houseVO.getName().equals("")){
			page=houseService.queryByPageByHouseName(page,houseVO.getName());
		}else{
			page=houseService.queryByPage(page);
		}
		rows=page.getRows();
		request.setAttribute("poj",poj);
 		//文章
		aticleList=articleService.listOrderBy(); 
		//楼盘详情
		buildingList=buildingsService.buildsListByTime(); 
		
		return "allHouseList";
	}
	public void setBuildingsService(BuildingsService buildingsService) {
		this.buildingsService = buildingsService;
	}
	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}
	public void setHouseService(HouseService houseService) {
		this.houseService = houseService;
	}
	@Override
	public void setSession(Map session) {
		this.session = session;
	}
	public List<BuildingsVO> getBuildingList() {
		return buildingList;
	}
	public HourseVO getHouseVO() {
		return houseVO;
	}
	public void setHouseVO(HourseVO houseVO) {
		this.houseVO = houseVO;
	}
	public void setHouseImgFileName(String houseImgFileName) {
		this.houseImgFileName = houseImgFileName;
	}
	public void setHouseImg(File houseImg) {
		this.houseImg = houseImg;
	}
	public int getTotal() {
		return total;
	}
	public List<HourseVO> getRows() {
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
	public void setHouselogoFileName(String houselogoFileName) {
		this.houselogoFileName = houselogoFileName;
	}
	public void setHouselogo(File houselogo) {
		this.houselogo = houselogo;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	public void setBuildingsName(String buildingsName) {
		this.buildingsName = buildingsName;
	}
	public void setAppointmentService(AppointmentService appointmentService) {
		this.appointmentService = appointmentService;
	}
	public boolean isCheckApp() {
		return checkApp;
	}
	public List<ArticleVO> getAticleList() {
		return aticleList;
	}
	public Set<HourseVO> getHouseSet() {
		return houseSet;
	}

	public void setHouseName(HouseNameVO houseName) {
		this.houseName = houseName;
	}
	public HouseNameVO getHouseName() {
		return houseName;
	}
	public String getMsg() {
		return msg;
	}
	public double getPrice() {
		return price;
	}

}
