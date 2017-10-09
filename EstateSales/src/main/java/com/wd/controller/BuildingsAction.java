package com.wd.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionSupport;
import com.wd.bean.AgencyVO;
import com.wd.bean.AppointmentVO;
import com.wd.bean.ArticleVO;
import com.wd.bean.BuildingsVO;
import com.wd.bean.CommentVO;
import com.wd.bean.CustomerVO;
import com.wd.bean.EmployeeVO;
import com.wd.bean.FindObject;
import com.wd.bean.HistoryVO;
import com.wd.bean.HourseVO;
import com.wd.bean.PageObject;
import com.wd.bean.SalaryVO;
import com.wd.bean.UsersVO;
import com.wd.common.ControllerResult;
import com.wd.common.PageByEasyUi;
import com.wd.dao.CommentDao;
import com.wd.service.AgencyService;
import com.wd.service.AppointmentService;
import com.wd.service.ArticleService;
import com.wd.service.BuildingsService;
import com.wd.service.CommentService;
import com.wd.service.HistoryService;
import com.wd.service.HouseService;
import com.wd.service.LikeService;
import com.wd.service.SalaryService;

public class BuildingsAction extends ActionSupport implements SessionAware,ServletRequestAware{

	private static final long serialVersionUID = 1L;
	private BuildingsService buildingsService;
	private AgencyService agencyService;
	private CommentService commentService;
	private AppointmentService appointmentService;
	private HistoryService historyService;
	private LikeService likeService;
	private HouseService houseService;
	private SalaryService salaryService;
	private BuildingsVO buildingsVO;
	private CommentVO comment;
	private String list;//楼盘地图数据
	private List agencyList; //所有经销商数据
	private Map session;
	private HttpServletRequest request;
	private ControllerResult controllerResult;
	//省，市，县
	private String sheng;
	private String shi;
	private String xian;
	//单个上传楼盘图片
	private String logoFileName; //文件名
	private File logo; //文件
	
	private String agencyId;
	
	//经销商修改楼盘图片
	private String agnecyModifyImgFileName;
	private File agnecyModifyImg;
	private boolean checkLike=false;
	
	//批量上传楼盘图片
	private String[] batchImgFileName; //图片名称
	private File[] batchImg; //图片内容
	
	
	//楼盘分页
	private int total;
	private List rows;
	//首页数据
	private List<BuildingsVO>hotbuildsList;//热卖楼盘
	private List<BuildingsVO> newbuildsList;//最新楼盘
	private List<BuildingsVO> discountList;//优惠楼盘
	private List<SalaryVO>empBySalary;//金牌顾问
	private List<BuildingsVO>buildsListByTime;//最近开盘
	private String buildsAvg;//楼市走向
	private String buildTime;//楼市走向
	private List<HourseVO>houseList;//户型按面积取数据
	public List<AppointmentVO>appList;
	
	private FindObject find;
	private List<ArticleVO>aticleList;
	private ArticleService articleService;
	private List buildingList;

	public List getBuildingList() {
		return buildingList;
	}
	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}
	public List<ArticleVO> getAticleList() {
		return aticleList;
	}
	public FindObject getFind() {
		return find;
	}

	public void setFind(FindObject find) {
		this.find = find;
	}
	private PageObject p;
	public PageObject getP() {
		return p;
	}

	public void setP(PageObject p) {
		this.p = p;
	}
	private int pageNumber;
	private int pageSize;
	//跳到新增楼盘页面
	public String buildAdd(){
		System.out.println("跳到新增楼盘页面");
		return "buildAdd";
	}
	
	//新增楼盘
	public String addBuild(){
		//省市县
		buildingsVO.setArea(sheng+shi+xian); 	
		//创建日期
		buildingsVO.setCreated_time(new java.sql.Date(new Date().getTime()));
		//经销商Id
		AgencyVO agency=(AgencyVO)session.get("agencyVO");
		buildingsVO.setAgency(agency);
		//楼栋图片
		buildingsVO.setLogo(buildingsService.saveBuildUrl(logoFileName, logo));	
		//新增进数据库
		buildingsService.saveOrUpdate(buildingsVO);
		return "listPage";
	}
	public String list(){
		return "listPage";
	}
	public String agencyBuildsList(){
		PageByEasyUi<BuildingsVO>page=new PageByEasyUi<>();
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		AgencyVO a=(AgencyVO)session.get("agencyVO");
		page=buildingsService.pageByAgency(page, a.getId());
		rows=page.getRows();
		total=page.getTotal();
		return "list";
	}
	public String listByAgencyId(){//管理员通过经销商id查询楼盘
		PageByEasyUi<BuildingsVO>page=new PageByEasyUi<>();
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page=buildingsService.pageByAgency(page, agencyId);
		rows=page.getRows();
		total=page.getTotal();
		return "list";
	}
	public String allBuildsListPage(){//管理员楼盘页面
		agencyList=agencyService.agencyList();
		return "allBuildsListPage";
	}
	public String buildsMap(){//管理员楼盘地图
		List list1=buildingsService.buildsMapList();
		list=JSON.toJSONString(list1);
		return "buildsMap";
	}
	public String allBuildsList(){//管理员楼盘数据
		if(agencyId!=null&&!agencyId.equals("")){
			return listByAgencyId();
		}else{
			PageByEasyUi<BuildingsVO>page=new PageByEasyUi<>();
			page.setPageSize(pageSize);
			page.setPage(pageNumber);
			page=buildingsService.queryByPage(page);
			rows=page.getRows();
			total=page.getTotal();
			return "list";
		}
	}
	public String update(){
		buildingsService.saveOrUpdate(buildingsVO);
		controllerResult = ControllerResult.getSuccessResult("修改成功");
		return "update";
	}
	//楼盘冻结或激活
	public String inOractive(){
		buildingsService.inOractive(buildingsVO);
		controllerResult = ControllerResult.getSuccessResult("该状态已修改");
		return "update";
	}
	
	//批量上传图片
	public String batchUploadImg(){
		buildingsService.batchUploadImg(request.getParameter("buildId"), batchImgFileName, batchImg);;
		return "update";
	}
	public String history(){
		UsersVO user=(UsersVO)session.get("user");
		if(user==null){
			user=new UsersVO();
			user.setId("");
		}
		buildingsVO=buildingsService.queryById(buildingsVO.getId());
		HistoryVO history=new HistoryVO();
		history.setBuildings_id(buildingsVO.getId());
		history.setUser_id(user.getId());
		HistoryVO h=new HistoryVO();
		h.setBuildings(buildingsVO);
		h.setUser(user);
		if(user.getId().equals("")||historyService.queryBymsg(history)==false){
			historyService.saveOrUpdate(h);
			System.out.println("ok!");
		}
		return "history";
	}
	public String onebuild(){//前端评论分页操作
		aticleList=articleService.listOrderBy();
		buildingList=buildingsService.buildsListByTime();
		int cnt=0;
		if(p==null){
			p=new PageObject();
		}
		cnt = commentService.getCount("select count(id) cnt from t_comment where buildings_id='"+buildingsVO.getId()+"'");
		p.setRecordCount(cnt);
		//设置第二个参数
		if(p.getCurrentPage()==0){
			p.setCurrentPage(1);
		}else{
			p.setCurrentPage(p.getCurrentPage());
		}
		//设置第三个参数
		if(p.getOpr()==null || p.getOpr().equals("")){
			p.setOpr("first");
		}else{
			p.setOpr(p.getOpr());
		}
		UsersVO user=(UsersVO)session.get("user");
		if(user!=null){
			checkLike=likeService.isLike(buildingsVO.getId(),user.getId());
			System.out.println(checkLike);
		}
		rows=commentService.pageBysql(buildingsVO.getId(),p.getStartPos(),p.getPageSize());
		buildingsVO=buildingsService.queryById(buildingsVO.getId());
		return "onebuild";
	}
	
	public String pagebuild(){
		
		//获取总记录数
		int cnt=0;
		if(p==null){
			p=new PageObject();
		}
		if(find==null){
			find=new FindObject();
		}
		String str="select count(id) cnt from t_buildings where 1=1 ";
		if(find.getSosuo()!=null&&!find.getSosuo().equals("")){
			try{
		        //若是数字，则可以转换，否则会出现异常
				int a=Integer.parseInt(find.getSosuo());
				str+="and avg_price like '%"+find.getSosuo()+"%'";
			}catch(NumberFormatException e){
	    	   str+="and t_name like '%"+find.getSosuo()+"%'"+"or address like '%"+find.getSosuo()+"%' or area like '%"+find.getSosuo()+"%'";
			}
		}
		if(!(find.getArea()==null||find.getArea().equals("不限"))){
			str+=" and area like '%"+find.getArea()+"%'";
		}
		if(!(find.getHouse()==null||find.getHouse().equals("不限"))){
			str+=" and house_type like '%"+find.getHouse()+"%'";
		}
		if(!(find.getPrice()==null||find.getPrice().equals("不限"))){
			str+=" and avg_price "+find.getPrice();
		}
		cnt=commentService.getCount(str);
		p.setRecordCount(cnt);
		//设置第二个参数
		if(p.getCurrentPage()==0){
			p.setCurrentPage(1);
		}else{
			p.setCurrentPage(p.getCurrentPage());
		}
		//设置第三个参数
		if(p.getOpr()==null || p.getOpr().equals("")){
			p.setOpr("first");
		}else{
			p.setOpr(p.getOpr());
		}
		rows=buildingsService.pageBysql(find,p.getStartPos(),p.getPageSize());
		return "buildsListPage";
	}
	public String findBuildsList(){
		PageByEasyUi<BuildingsVO>page=new PageByEasyUi<>();
		page.setPage(1);
		page.setPageSize(5);
		page=buildingsService.queryByPage(page);
		rows=page.getRows();
		total=page.getTotal();
		return "buildsListPage";
	}
	//经销商查看楼盘详情
	public String lookBuildsDetail(){
		buildingsVO = buildingsService.lookBuildsDetail(buildingsVO.getId());
		return "lookBuildsDetail";
	}
	//管理员查看楼盘详情
	public String adminBuildsDetail(){
		buildingsVO = buildingsService.lookBuildsDetail(buildingsVO.getId());
		return "adminBuildsDetail";
	}
	//跳转到前端首页
	public String index(){
		newbuildsList=buildingsService.buildsListByTime();
		discountList=buildingsService.buildsListByactivity();
		empBySalary=salaryService.empListBySalary();
		hotbuildsList=buildingsService.hotBuilds();
		agencyList=agencyService.agencyBySale();
		buildsListByTime=buildingsService.buildsBySaleTIme();
		aticleList=articleService.articleByTime();
		houseList=houseService.houseByarea();
		appList=appointmentService.appListByUser();
		List price=new ArrayList<>();
		List time=new ArrayList<>();
		List<Object[]>list2=buildingsService.buildsAvgPrice();
		for (Object[] obj : list2) {
			price.add(obj[0]);
			time.add(obj[1]+"-"+obj[2]);
		}
		buildsAvg=JSON.toJSONString(price);
		buildTime=JSON.toJSONString(time);
		return "index";
	}
	//经销商修改楼盘图片
	public String modifyBuildingImg(){
		buildingsService.agencyModifyImg(request.getParameter("buildsId"), agnecyModifyImgFileName, agnecyModifyImg);
		return "update";
	}
	public List<AppointmentVO> getAppList() {
		return appList;
	}
	public List<HourseVO> getHouseList() {
		return houseList;
	}
	public void setHouseService(HouseService houseService) {
		this.houseService = houseService;
	}
	public void setLikeService(LikeService likeService) {
		this.likeService = likeService;
	}
	public void setAppointmentService(AppointmentService appointmentService) {
		this.appointmentService = appointmentService;
	}
	public BuildingsVO getBuildingsVO() {
		return buildingsVO;
	}
	public void setSalaryService(SalaryService salaryService) {
		this.salaryService = salaryService;
	}
	public void setBuildingsService(BuildingsService buildingsService) {
		this.buildingsService = buildingsService;
	}
	public void setBuildingsVO(BuildingsVO buildingsVO) {
		this.buildingsVO = buildingsVO;
	}
	public void setSheng(String sheng) {
		this.sheng = sheng;
	}
	public void setShi(String shi) {
		this.shi = shi;
	}
	public void setXian(String xian) {
		this.xian = xian;
	}
	public void setLogoFileName(String logoFileName) {
		this.logoFileName = logoFileName;
	}
	public void setLogo(File logo) {
		this.logo = logo;
	}
	@Override
	public void setSession(Map session) {
		this.session=session;
	}
	public int getTotal() {
		return total;
	}
	public List getRows() {
		return rows;
	}
	public List<SalaryVO> getEmpBySalary() {
		return empBySalary;
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

	public List<BuildingsVO> getDiscountList() {
		return discountList;
	}
	public void setBatchImgFileName(String[] batchImgFileName) {
		this.batchImgFileName = batchImgFileName;
	}
	public void setBatchImg(File[] batchImg) {
		this.batchImg = batchImg;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	public String getList() {
		return list;
	}
	public List getAgencyList() {
		return agencyList;
	}
	public void setAgencyService(AgencyService agencyService) {
		this.agencyService = agencyService;
	}
	public void setAgencyId(String agencyId) {
		this.agencyId = agencyId;
	}
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	public CommentVO getComment() {
		return comment;
	}
	public List<BuildingsVO> getBuildsListByTime() {
		return buildsListByTime;
	}
	public String getBuildsAvg() {
		return buildsAvg;
	}
	public String getBuildTime() {
		return buildTime;
	}
	public void setHistoryService(HistoryService historyService) {
		this.historyService = historyService;
	}
	public void setComment(CommentVO comment) {
		this.comment = comment;
	}
	public List<BuildingsVO> getNewbuildsList() {
		return newbuildsList;
	}
	public void setAgnecyModifyImgFileName(String agnecyModifyImgFileName) {
		this.agnecyModifyImgFileName = agnecyModifyImgFileName;
	}
	public List<BuildingsVO> getHotbuildsList() {
		return hotbuildsList;
	}
	public boolean isCheckLike() {
		return checkLike;
	}
	public void setAgnecyModifyImg(File agnecyModifyImg) {
		this.agnecyModifyImg = agnecyModifyImg;
	}
}
