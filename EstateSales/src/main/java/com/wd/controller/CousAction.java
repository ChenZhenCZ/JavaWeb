package com.wd.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.json.JSONException;
import org.hibernate.engine.transaction.jta.platform.internal.SynchronizationRegistryBasedSynchronizationStrategy;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


import com.opensymphony.xwork2.ActionSupport;
import com.wd.bean.AgencyVO;
import com.wd.bean.CustomerVO;
import com.wd.bean.EmployeeVO;
import com.wd.common.PageByEasyUi;
import com.wd.service.CousService;

public class CousAction extends ActionSupport implements ServletRequestAware,SessionAware{
	private static final long serialVersionUID = 2081921981000841406L;
	private CustomerVO con;
	private EmployeeVO emp;
	private CousService cousService;
	private int total;
	private HttpServletRequest request;
	private Map session;
	private List<CustomerVO>rows;
	private int pageNumber;
	private int pageSize;
	private String logoFileName; //文件名
	private File logo; //文件

	public void setCousService(CousService cousService) {
		this.cousService = cousService;
	}

	public CustomerVO getCon() {
		return con;
	}


	public void setCon(CustomerVO con) {
		this.con = con;
	}


	public EmployeeVO getEmp() {
		return emp;
	}

	public void setEmp(EmployeeVO emp) {
		this.emp = emp;
	}

	public String coulist(){
		EmployeeVO employ= (EmployeeVO)session.get("emp");
		session.put("emp",employ); //保存session
		return "init";
	}
	public String savacou(){//新增
		EmployeeVO employ= (EmployeeVO)session.get("emp");
		System.out.println(employ.getId());
		con.setEmp(employ);
		con.setCreated_time(new Date());
		cousService.saveOrUpdate(con);
		return SUCCESS;
	}
	public String update(){	//员工修改客户信息
		EmployeeVO employ= (EmployeeVO)session.get("emp");
		AgencyVO agency= (AgencyVO)session.get("agencyVO");
		cousService.update(con);
		if(employ!=null){
			couslist();
		}else if(agency!=null){
			agencyList();
		}
		return "list";
	}
	
	public String agencyModifyCous(){  //经销商修改客户信息
		cousService.agencyModifyCous(con);
		return "list";
	}
	
	public String delcou(){	//冻结
		cousService.del(con);
		return "list";
	}
	public String Jihuo(){ //激活
		cousService.Jihuo(con.getId());
		return "list";
	}
	public String couslist(){//员工客户分页
		PageByEasyUi<CustomerVO>page=new PageByEasyUi<>();
		EmployeeVO employ= (EmployeeVO)session.get("emp");
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page=cousService.pageById(page, employ.getId());
		rows=page.getRows();
		total=page.getTotal();
		return "list";
	}
	public String allCousList(){//管理员客户分页
		PageByEasyUi<CustomerVO> page =new PageByEasyUi<>();
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page=cousService.queryByPage(page);
		rows=page.getRows();
		total=page.getTotal();
		return "list";
	}
	public String agencyList(){//经销商
		PageByEasyUi<CustomerVO> page =new PageByEasyUi<>();
		AgencyVO agency= (AgencyVO)session.get("agencyVO");
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page=cousService.pageAgencyId(page,agency.getId());
		rows=page.getRows();
		total=page.getTotal();
		return"list";
	}
	//员工客户列表
	public String cousfeng(){
		
		return SUCCESS;
	}
	//经销商
	public String customerList(){
		return"agency";
	}
	//上传电子合同
	public String contract(){
		String path = ServletActionContext.getRequest().getRealPath("/attached/agency");
		int pos = logoFileName.lastIndexOf(".");
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
		System.out.println(logoUrl);
		System.out.println(request.getParameter("conId"));
		cousService.contarct(logoUrl, request.getParameter("conId"));
		return"list";
	} 
	
	public List<CustomerVO> getRows() {
		return rows;
	}


	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotal() {
		return total;
	}
	public void setSession(Map session) {
		this.session = session;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
		
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
}


