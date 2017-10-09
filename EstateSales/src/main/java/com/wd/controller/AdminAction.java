package com.wd.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.http.HttpRequest;

import com.opensymphony.xwork2.ActionSupport;
import com.wd.bean.ActivityVO;
import com.wd.bean.AdminVO;
import com.wd.bean.AdsVO;
import com.wd.bean.ArticleTypeVO;
import com.wd.bean.ArticleVO;
import com.wd.bean.BuildingsVO;
import com.wd.bean.HourseVO;
import com.wd.bean.PageObject;
import com.wd.common.PageByEasyUi;
import com.wd.common.WebSocket;
import com.wd.service.ActivityService;
import com.wd.service.AdminService;
import com.wd.service.AdsService;
import com.wd.service.AgencyService;
import com.wd.service.ArticleService;
import com.wd.service.ArticleTypeService;
import com.wd.service.BuildingsService;
import com.wd.service.HouseService;
import com.wd.service.SaleService;
import com.wd.service.UserService;

public class AdminAction extends ActionSupport implements SessionAware,ServletRequestAware{
	private AdminService adminService;
	private ArticleTypeService articleTypeService;
	private AdsVO ads;
	private AdsService adsService;
	private AdminVO admin;
	private ArticleTypeVO articleType;
	private ArticleVO article;
	private ActivityVO activity;
	private ArticleService articleService;
	private ActivityService  activityService;
	private String logoFileName;//文件名
	private File logo;//文件
	private String msg;
	private Map session;
	private int total;
	private List rows;
	private int pageNumber;
	private int pageSize;
	private HttpServletRequest request;
	private AgencyService agencyService;
	private UserService userService;
	private SaleService saleService;
	private BuildingsService buildingsService;
	private List<BuildingsVO> buildingList;
	private List<HourseVO> houseList;
	private HouseService houseService;
	private int agencyCount;
	private int buildCount;
	private int userCount;
	private int saleCount;
	
	public String loginPage(){
		return "loginPage";
	}
	public String login(){
		if(admin==null){
			return "errors";
		}else{
			admin=adminService.login(admin);
			if(null!=admin){
				session.put("admin",admin);
				agencyCount=agencyService.count();
				userCount=userService.count();
				buildCount=buildingsService.count();
				saleCount=saleService.count();
				return SUCCESS;
			}else{
				msg="你输入的账号密码有误！";
				return "loginPage";
			}
		}
	}
	public String exit(){
		session.clear();
		return "loginPage";
	}
	public String index(){
		return SUCCESS;
	}
	public String article(){
		rows=articleTypeService.articleTypeList();
		return "article";
	}
	public String articleListPage(){
		return "articleList";
	}
	public String articleAdd(){
		HttpServletRequest req=ServletActionContext.getRequest();
		articleService.save(article,logoFileName,req,logo);
		return "articleList";
	}
	public String updateStatus(){
		articleService.updateStatus(article);
		return "list";
	}
	public String atricleType(){
		return "articleType";
	}
	public String addArticleType(){
		articleTypeService.saveOrUpdate(articleType);
		return "listPage";
	}
	public String articleTypeListPage(){
		return "listPage";
	}
	
	public String articleTypeList(){
		PageByEasyUi<ArticleTypeVO>page=new PageByEasyUi<>();
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page=articleTypeService.queryByPage(page);
		rows=page.getRows();
		total=page.getTotal();
		return "list";
	}
	public String updateArticleType(){
		System.out.println("update====");
		articleTypeService.saveOrUpdate(articleType);
		msg="success";
		return "list";
	}
	public String articleTypeDelte(){
		articleTypeService.del(articleType);
		return "list";
	}
	public String articleList(){
		PageByEasyUi<ArticleVO>page=new PageByEasyUi<>();
		page.setPage(pageNumber);
		page.setPageSize(pageSize);
		page=articleService.queryByPage(page);
		total=page.getTotal();
		rows=page.getRows();
		return "list";
	}
	
	//用户查看文章(资讯)
	public String allArticleList(){
		PageByEasyUi<ArticleVO>page=new PageByEasyUi<>();
		String cur = request.getParameter("currentPage");
		String opr = request.getParameter("opr");
		PageObject poj = new PageObject();
		//设置记录总数，通过记录总数计算页数
		if(article!=null && !article.getTitle().equals("")){
			poj.setRecordCount(articleService.getCountByArticleTitle(article.getTitle()));	
		}else{
			poj.setRecordCount(articleService.allCount());
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
		if(article!=null && !article.getTitle().equals("")){
			page=articleService.queryByPageByArticleTitle(page,article.getTitle());
		}else{
			page=articleService.queryByAllPage(page);
		}
		rows=page.getRows();
		request.setAttribute("poj",poj);
		
		//户型
		houseList = houseService.queryListByTime();
		//楼盘详情
		buildingList=buildingsService.buildsListByTime(); 
		return "allArticleList";
		
	}
	//活动查询
	public String allactivityList(){
		PageByEasyUi<ActivityVO>page=new PageByEasyUi<>();
		String cur = request.getParameter("currentPage");
		String opr = request.getParameter("opr");
		PageObject poj = new PageObject();
		//设置记录总数，通过记录总数计算页数
		if(activity!=null && !activity.getTitle().equals("")){
			poj.setRecordCount(activityService.getCountByArticleTitle(activity.getTitle()));	
		}else{
			poj.setRecordCount(activityService.allCount());
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
		if(activity!=null && !activity.getTitle().equals("")){
			page=activityService.queryByPageByArticleTitle(page,activity.getTitle());
		}else{
			page=activityService.allqueryByPage(page);
		}
		rows=page.getRows();
		request.setAttribute("poj",poj);
		
		//户型
		houseList = houseService.queryListByTime();
		//楼盘详情
		buildingList=buildingsService.buildsListByTime(); 
		return"allactivityList";
	}
	
	
	public String sendMsgPage(){
		return "sendMsgPage";
	}
	public String sendMsg(){
		new WebSocket().sendMessage(msg);
		return "msg";
	}
	
	public String adsAddPage(){
		return "addPage";
	}
	public String adsSave(){
		HttpServletRequest request=ServletActionContext.getRequest();
		adsService.save(ads, logoFileName, request, logo);
		return "addPage";
	}
	public void setAgencyService(AgencyService agencyService) {
		this.agencyService = agencyService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public void setSaleService(SaleService saleService) {
		this.saleService = saleService;
	}
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	public void setArticleTypeService(ArticleTypeService articleTypeService) {
		this.articleTypeService = articleTypeService;
	}
	public AdsVO getAds() {
		return ads;
	}
	public void setAds(AdsVO ads) {
		this.ads = ads;
	}
	public void setAdsService(AdsService adsService) {
		this.adsService = adsService;
	}
	public AdminVO getAdmin() {
		return admin;
	}
	public void setAdmin(AdminVO admin) {
		this.admin = admin;
	}
	public String getMsg() {
		return msg;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	public ArticleTypeVO getArticleType() {
		return articleType;
	}
	public void setArticleType(ArticleTypeVO articleType) {
		this.articleType = articleType;
	}
	public int getTotal() {
		return total;
	}
	public List getRows() {
		return rows;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public ArticleVO getArticle() {
		return article;
	}
	public void setArticle(ArticleVO article) {
		this.article = article;
	}
	public int getAgencyCount() {
		return agencyCount;
	}
	public int getBuildCount() {
		return buildCount;
	}
	public int getUserCount() {
		return userCount;
	}
	public int getSaleCount() {
		return saleCount;
	}
	public ActivityVO getActivity() {
		return activity;
	}
	public void setActivity(ActivityVO activity) {
		this.activity = activity;
	}
	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}
	
	public void setActivityService(ActivityService activityService) {
		this.activityService = activityService;
	}
	public void setLogoFileName(String logoFileName) {
		this.logoFileName = logoFileName;
	}
	public void setLogo(File logo) {
		this.logo = logo;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	public List<BuildingsVO> getBuildingList() {
		return buildingList;
	}
	public void setBuildingsService(BuildingsService buildingsService) {
		this.buildingsService = buildingsService;
	}
	public List<HourseVO> getHouseList() {
		return houseList;
	}
	public void setHouseService(HouseService houseService) {
		this.houseService = houseService;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
}
