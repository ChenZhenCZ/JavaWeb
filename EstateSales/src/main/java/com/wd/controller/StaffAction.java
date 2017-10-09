package com.wd.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.json.JSONResult;
import org.apache.struts2.json.JSONWriter;
import org.json.simple.JSONArray;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.JSONAwareSerializer;
import com.alibaba.fastjson.serializer.JSONSerializerMap;
import com.opensymphony.xwork2.ActionSupport;
import com.wd.bean.AgencyVO;
import com.wd.bean.BuildingsVO;
import com.wd.bean.EmployeeVO;
import com.wd.bean.HchartpieVO;
import com.wd.bean.PieVO;
import com.wd.common.PageByEasyUi;
import com.wd.service.RoomService;
import com.wd.service.StaffService;

public class StaffAction extends ActionSupport implements SessionAware{

	private static final long serialVersionUID = -9143124258816493154L;
	public EmployeeVO emp;
	public BuildingsVO buildings;
	private StaffService staffService;
	private RoomService roomService;
	private int total;
	private List<EmployeeVO>rows;
	private int pageNumber;
	private int pageSize;
	private Map session;
	private int p;//已售 
	private int n;//未售
	private int y;//待售
	private String msg;
	private List<BuildingsVO> buildsList;
	private List housName;//户型
	private List unpier;//销售值
	public void setBuildsList(List<BuildingsVO> buildsList) {
		this.buildsList = buildsList;
	}
	//图片上传
	private String logoFileName; //文件名
	private File logo; //文件
	
	public String loginPage(){
		return "loginPage";
	}
	//员工楼盘地图
	public String buildingsMap(){
		return "map";
	}
	public String employeetemd(){
		AgencyVO agencyVO = (AgencyVO)session.get("agencyVO");
		buildsList = staffService.buildList(agencyVO.getId());
		return"employee";
	}
	public String emplogin(){//登录
		if(null!=staffService.login(emp)){
			emp=staffService.login(emp);
			System.out.println(emp.getStatus());
			if(emp.getStatus().equals("激活")&&emp.getAgency().getStatus().equals("激活")){
				session.put("emp", emp);
	     		return SUCCESS;
			}else{
				msg="员工："+emp.getName()+"已被冻结！";
				return "login";
			}
		}else{
				msg="你输入的账号或密码有误！";
			return "login";
		}
	}
	public String empindex(){
		EmployeeVO employ= (EmployeeVO)session.get("emp");
		session.put("emp",employ); //保存session
		return SUCCESS;
	}
	public String updata(){//修改密码
		
		if(staffService.updata(emp).getPwd().equals(emp.getDes())){
			staffService.saveOrUpdate(emp);
			msg="密码修改成功！";
			return "login";
		}else{
			msg="密码修改失败！";
			return "login";
		}
	}
	public String savaStaff(){
		emp.setPwd("123456");//默认密码
		staffService.sava(emp);
		return "login";
	}
	public String updataStaff(){//新增
		AgencyVO agencyVO= (AgencyVO)session.get("agencyVO");
		emp.setAgency(agencyVO);
		staffService.xxupdate(emp);
		return "list";
	}
	public String updataindex(){//修改基本信息
		staffService.updataindex(emp);
		emp=staffService.login(emp);
		session.put("emp",emp);
		return SUCCESS;
	}
	public String updataSta(){//修改
		
		staffService.updateSta(emp);
	
		return "list";
	}
	public String staffList(){//分页
		PageByEasyUi<EmployeeVO>page=new PageByEasyUi<>();
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page=staffService.queryByPage(page);
		rows=page.getRows();
		total=page.getTotal();
		return "list";
	}
	public String agencyList(){//经销商
		PageByEasyUi<EmployeeVO>page=new PageByEasyUi<>();
		AgencyVO agencyVO= (AgencyVO)session.get("agencyVO");
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page=staffService.pageAgencyId(page, agencyVO.getId());
		rows=page.getRows();
		total=page.getTotal();
		return"list";
	}
	public String del(){//冻结
		emp.setStatus("冻结");
		staffService.del(emp);
		return "list";
	}
	public String Jihuo(){//激活
		emp.setStatus("激活");
		staffService.del(emp);
		return"list";
	}
	public String inpwd(){//初始化密码
		staffService.inpwd(emp);
		return "list";
	}
	
	public String init(){//员工分页
		EmployeeVO employ= (EmployeeVO)session.get("emp");
		session.put("emp",employ); //保存session
		return "init";
	}
	//上传图标
	public String uploadLogo(){
		String logoUrl=img();
		System.out.println(logoUrl);
		emp=new EmployeeVO();
		emp.setHeadicon(logoUrl);
		
		//logoUrl保存到数据库
		EmployeeVO employ= (EmployeeVO)session.get("emp");
		staffService.mylogo(employ.getId(),logoUrl);
		
		employ.setHeadicon(logoUrl);
		session.put("emp",employ); //保存session
		System.out.println("修改的logo保存到数据库");
		return "load"; 	//更改经销商图标之后调到主页面
	}
	public String img(){
		String path = ServletActionContext.getRequest().getRealPath("/attached/agency");
		int pos = logoFileName.lastIndexOf('.');
		String ext = logoFileName.substring(pos); 
		String newFileName = System.nanoTime()+ext;
		try {
			FileUtils.copyFile(logo, new File(path,newFileName));//保存楼栋图片
			System.out.println("绝对路径："+path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		String logoUrl=ServletActionContext.getRequest().getContextPath()+"/attached/agency";
		logoUrl=logoUrl+"/"+newFileName;
		return logoUrl;
	}
	public String empbuilding(){
		return"building";
	}
	//房屋销售报表
	public String highcharst(){
	EmployeeVO emp=(EmployeeVO)session.get("emp");
	System.out.println(emp.getBuildings().getId());
	 p=roomService.count("已售",emp.getBuildings().getId());
	 n=roomService.count("保留",emp.getBuildings().getId());
	 y=roomService.count("待售",emp.getBuildings().getId());
		return"highchra";
	}
	//经销商房屋销售报表
	public String agencyhighcharst(){
		AgencyVO agencyVO = (AgencyVO)session.get("agencyVO");
		 p=roomService.empcount("已售",agencyVO.getId());
		 n=roomService.empcount("保留",agencyVO.getId());
		 y=roomService.empcount("待售",agencyVO.getId());
		return"agencyhighchra";
	}
	//户型销售情况
	public String housList(){
		String sys[]={"三室两厅一厨一卫","三室一厅","二室一厅","六室二厅","四室二厅","二室二厅","三室二厅二卫","四室二厅一厨三卫",""};
		housName.add(JSON.toJSON(sys));
		for(int i=0;i<housName.size();i++){
			unpier.add(JSON.toJSON(roomService.allcount("已售", sys[i])));
		}
		return"housList";
	}
	public String exit(){
		session.clear();
		return "loginPage";
	}
		
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<EmployeeVO> getRows() {
		return rows;
	}
	public void setRows(List<EmployeeVO> rows) {
		this.rows = rows;
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public EmployeeVO getEmp() {
		return emp;
	}
	public void setEmp(EmployeeVO emp) {
		this.emp = emp;
	}
	public void setStaffService(StaffService staffService) {
		this.staffService = staffService;
	}
	
	public void setRoomService(RoomService roomService) {
		this.roomService = roomService;
	}
	public void setSession(Map session) {
		this.session = session;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getLogoFileName() {
		return logoFileName;
	}

	public void setLogoFileName(String logoFileName) {
		this.logoFileName = logoFileName;
	}

	public File getLogo() {
		return logo;
	}

	public void setLogo(File logo) {
		this.logo = logo;
	}
	public BuildingsVO getBuildings() {
		return buildings;
	}
	public void setBuildings(BuildingsVO buildings) {
		this.buildings = buildings;
	}
	public List<BuildingsVO> getBuildsList() {
		return buildsList;
	}
	public int getP() {
		return p;
	}
	public int getN() {
		return n;
	}
	public int getY() {
		return y;
	}
	public List getHousName() {
		return housName;
	}
	public void setHousName(List housName) {
		this.housName = housName;
	}
	public List getUnpier() {
		return unpier;
	}
	public void setUnpier(List unpier) {
		this.unpier = unpier;
	}
	
	
}
