package com.wd.controller;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.wd.bean.AgencyVO;
import com.wd.bean.EmployeeVO;
import com.wd.bean.SalaryVO;
import com.wd.common.PageByEasyUi;
import com.wd.service.SalaryService;

public class SalaryAction extends ActionSupport implements SessionAware{
	private SalaryVO salary;
	private SalaryService salaryService;
	private Map session;
	private int pageNumber;
	private int pageSize;
	private int total;
	private List<SalaryVO>rows;
	private String yue;//月份
	
	//经销商条件查询
	private String empName;
	private String time;
	
	//通过员工id查询相关绩效提成
	public String empSalaryList(){
		EmployeeVO emp=(EmployeeVO)session.get("emp");
		PageByEasyUi<SalaryVO>page=new PageByEasyUi<>();
		page.setPage(pageNumber);
		page.setPageSize(pageSize);
		if(yue==null){
			page=salaryService.pageByEmpSalary(page, emp.getId());
		}else{
			page=salaryService.pageByEmpId(page, emp.getId(), yue);
		}
		rows=page.getRows();
		total=page.getTotal();
		return "list";
	}
	
	//经销商初始化页面
	public String initAgencyEmpSalaryList(){
		return "initAgencyEmpSalaryList";
	}
	//经销商按条件查询
	public String agencyByNameOrtimeLookEmp(){
		AgencyVO agencyVO = (AgencyVO) session.get("agencyVO");
		PageByEasyUi<SalaryVO>page=new PageByEasyUi<>();
		page.setPage(pageNumber);
		page.setPageSize(pageSize);
		page = salaryService.agencyLookEmpSalaryListByNameOrtTime(page,agencyVO.getId(),empName,time);
		rows=page.getRows();
		total=page.getTotal();
		return "agencyEmpSalaryList";
	}
	//经销商员工列表
	public String agencyEmpSalaryList(){
		if(empName!=null && time!=null){
			return agencyByNameOrtimeLookEmp();
		}else if(empName!=null && time==null){
			time="";
			return agencyByNameOrtimeLookEmp();
		}else if(empName==null && time!=null){
			empName="";
			return agencyByNameOrtimeLookEmp();
		}
		AgencyVO agencyVO = (AgencyVO) session.get("agencyVO");
		PageByEasyUi<SalaryVO>page=new PageByEasyUi<>();
		page.setPage(pageNumber);
		page.setPageSize(pageSize);
		page = salaryService.pageByAgencyEmpId(page,agencyVO.getId());
		rows=page.getRows();
		total=page.getTotal();
		return "agencyEmpSalaryList";
	}
	
	
	
	
	public SalaryVO getSalary() {
		return salary;
	}
	public void setSalary(SalaryVO salary) {
		this.salary = salary;
	}
	public int getTotal() {
		return total;
	}
	public List<SalaryVO> getRows() {
		return rows;
	}
	public void setSalaryService(SalaryService salaryService) {
		this.salaryService = salaryService;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	public void setYue(String yue) {
		this.yue = yue;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public void setTime(String time) {
		this.time = time;
	}
}
