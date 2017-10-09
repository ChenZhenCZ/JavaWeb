package com.wd.controller;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.BeanUtils;

import com.wd.bean.AgencyVO;
import com.wd.bean.AppointmentVO;
import com.wd.bean.CustomerVO;
import com.wd.bean.EmployeeVO;
import com.wd.bean.HourseVO;
import com.wd.bean.SaleVO;
import com.wd.bean.UsersVO;
import com.wd.common.ControllerResult;
import com.wd.common.PageByEasyUi;
import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionSupport;
import com.wd.service.AppointmentService;
import com.wd.service.CousService;
import com.wd.service.SalaryService;

public class AppointmentAction extends ActionSupport implements SessionAware{
	private static final long serialVersionUID = 1L;
	private  UsersVO user;
	private HourseVO hourse;
	private AppointmentVO appointment;
	private SaleVO sale;
	private EmployeeVO emp;
	private AppointmentService appointmentService;
	private CousService cousService;
	private Map session;
	private int total;
	private List<AppointmentVO> rows;
	private int pageNumber;
	private int pageSize;
	private ControllerResult controllerResult;
	private String empName;
	private String housName;//户型
	private String unpier;//预约值
	public ControllerResult getControllerResult() {
		return controllerResult;
	}
	public int getTotal() {
		return total;
	}
	public List<AppointmentVO> getRows() {
		return rows;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String init(){//员工查看预约表页面
		return"init";
	}
	//预约的新增
	public String addAppointment(){
			user = (UsersVO) session.get("user");
			if(user==null){
				return "errors";
			}else{
				CustomerVO c=new CustomerVO();
				BeanUtils.copyProperties(user,c);
				c.setEmp(appointment.getEmp());
				cousService.saveOrUpdate(c);
				appointment.setCustomer(c);
				appointmentService.saveOrUpdate(appointment);
				return "housedetail";
			}
	}
	public String adminAppointmentPage(){//管理员查看预约表
		return "adminAppointmentPage";
	}
	public String appointmentList(){
		PageByEasyUi<AppointmentVO> page=new PageByEasyUi<>();
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page=appointmentService.queryByPage(page);
		rows=page.getRows();
		total=page.getTotal();
		return "list";
	}
	public String agencyAppointmentPage(){//经销商查看预约表
		return "agencyAppointmentPage";
	}
	public String agencyList(){
		PageByEasyUi<AppointmentVO> page =new PageByEasyUi<>();
		AgencyVO agency=(AgencyVO)session.get("agencyVo");
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page=appointmentService.pageAgencyId(page, agency.getId());
		rows=page.getRows();
		total=page.getTotal();
		return"list";
	}
	public String employeeList(){
		PageByEasyUi<AppointmentVO> page=new PageByEasyUi<>();
		EmployeeVO employ= (EmployeeVO)session.get("emp");
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page=appointmentService.pageById(page, employ.getId());
		rows=page.getRows();
		total=page.getTotal();
		return"list";
	}
	//用户预约记录
	public String userlistPage(){//页面
		return "userlistPage";		
	}
	//用户预约记录
	public String userlist(){//数据
		UsersVO userid = (UsersVO) session.get("user");		
		PageByEasyUi<AppointmentVO> page = new PageByEasyUi<AppointmentVO>();
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page = appointmentService.pageByUserid(page, userid.getId());
		rows= page.getRows();
		total = page.getTotal();
		return "userlist";		
	}
	//用户修改预约信息
	public  String update(){
		appointmentService.updateUser(appointment);
		appointment.setApp_arrive_time(new Date(appointment.getApp_arrive_time().getTime()));
		return "update";		
	}
	//冻结或激活用户信息
	public String updateUserStatus(){
		appointmentService.updateUserStatus(appointment);
		controllerResult=ControllerResult.getSuccessResult("取消预约成功");
		return "update";
	}
	//员工修改预约记录状态
	public String saleAdd(){
		System.out.println(appointment.getId());
		//修改状态
		appointmentService.updateAppstatus(appointment);
		appointment=appointmentService.queryById(appointment.getId());
		if(appointment.getApp_status().equals("已购房")){//已购房
			appointmentService.saleadd(appointment);//新增销售记录
		}
		return"list";
	}
	//经销商查看预约
	public String initAgencyLookAppoint(){
		return "initAgencyAppoint";
	}
	//经销商预约列表
	public String AgencyLookAppoint(){
		AgencyVO agencyVO =(AgencyVO)session.get("agencyVO");
		PageByEasyUi<AppointmentVO> page = new PageByEasyUi<AppointmentVO>();
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		if(empName==null){
			page = appointmentService.pageAgencyId(page,agencyVO.getId());
		}else{
			page = appointmentService.pageByAgencyId(page, agencyVO.getId(), empName);
		}
		rows= page.getRows();
		total = page.getTotal();
		return "agencyAppoint";
	}
	//预约统计
	public String appointemenEiht(){
		EmployeeVO  emp=(EmployeeVO)session.get("emp");
		List<Object[]> app=appointmentService.pageEmpList(emp.getId());
		List a=new ArrayList<>();
		List p=new ArrayList<>();
		for (Object[] obj : app) {
			a.add(obj[1]);
			p.add(obj[2]);
		}
		housName=JSON.toJSONString(a);
		unpier=JSON.toJSONString(p);
		return"appointemenEiht";
	}
	
	
	
	public UsersVO getUser() {
		return user;
	}
	public void setUser(UsersVO user) {
		this.user = user;
	}
	public HourseVO getHourse() {
		return hourse;
	}
	public void setHourse(HourseVO hourse) {
		this.hourse = hourse;
	}
	public void setSession(Map session) {
		this.session = session;
	}

	public AppointmentVO getAppointment() {
		return appointment;
	}

	public void setAppointmentService(AppointmentService appointmentService) {
		this.appointmentService = appointmentService;
	}

	public void setAppointment(AppointmentVO appointment) {
		this.appointment = appointment;
	}
	public SaleVO getSale() {
		return sale;
	}
	public void setSale(SaleVO sale) {
		this.sale = sale;
	}
	public void setCousService(CousService cousService) {
		this.cousService = cousService;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getHousName() {
		return housName;
	}
	public void setHousName(String housName) {
		this.housName = housName;
	}
	public String getUnpier() {
		return unpier;
	}
	public void setUnpier(String unpier) {
		this.unpier = unpier;
	}
	
}
