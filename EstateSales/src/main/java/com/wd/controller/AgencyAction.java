package com.wd.controller;


import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.wd.bean.AgencyVO;
import com.wd.bean.ArticleTypeVO;
import com.wd.common.ControllerResult;
import com.wd.common.PageByEasyUi;
import com.wd.common.util.sendsms;
import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionSupport;
import com.wd.service.AgencyService;
import com.wd.service.BuildingsService;

public class AgencyAction extends ActionSupport implements ServletRequestAware,SessionAware{
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private AgencyVO agencyVo;
	private String msg;
	private String buildsList;
	private AgencyService agencyService;
	private BuildingsService buildingsService;
	private ControllerResult controllerResult;
	private int phoneYzm; //得到手机验证码，用于发送到页面，验证用户输入的是否与该验证码一致
	private Map session;
	private String newPwd;
	private int pageSize;
	private int pageNumber;
	private int total;
	private List rows;
	//图片上传
	private String logoFileName; //文件名
	private File logo; //文件
	
	
	public String save(){//不拦截，后台验证
		if(agencyVo==null){
			return "errors";
		}else{
			agencyVo.setStatus("冻结");
			agencyVo.setCreated_time(new Date(new java.util.Date().getTime()));
			agencyService.saveOrUpdate(agencyVo);
			return "login";	//经销商入驻后跳到登陆页面
		}
	}
	
	//经销商入驻发送验证码
	public String phone(){//不拦截，后台验证
		String phone = request.getParameter("phone");
		if(phone==null||phone.equals("")){
			return "errors";
		}else{
			int cnt= agencyService.queryByPhone(phone); //返回1 则该邮箱已被注册过，0 则未注册过
			if(cnt==1){ // 1 已被注册过
				controllerResult = ControllerResult.getFailResult("该手机号已存在");
				System.out.println("该手机号已存在");
			}else if(cnt == 0){  //  0 未注册过
				//发送验证码到该手机
				phoneYzm = sendsms.send(phone);
				System.out.println("手机验证码为："+phoneYzm);
				controllerResult = ControllerResult.getSuccessResult("一分钟内有效");
			}
			return "phone";
		}
	}
	public String login(){//不拦截，后台验证
		if(agencyVo==null){
			return "errors";
		}else{
			AgencyVO agencyVO = agencyService.loginValidate(agencyVo.getPhone(), agencyVo.getPwd());
			if(agencyVO==null){
				msg="1"; //你的手机号或密码错误
				return "login";
			}else if(agencyVO.getStatus().equals("冻结")){
				msg="2"; //你的账号还未审核
				return "login";
			}else{
				session.put("agencyVO", agencyVO);
				return "agencyMain"; //登录   跳转到楼盘列表页面
			}
		}
	}
	//退出登录
	public String exit(){
		session.clear();
		return "mainPage";
	}
	
	//经销商忘记密码(密码修改)
	public String forgetPwd(){//不拦截，后台验证
		if(agencyVo==null){
			return "errors";
		}else{
			String phone = agencyVo.getPhone();
			String pwd = String.valueOf(sendsms.send(phone));
			agencyService.forgetPwd(phone, pwd);
			msg="密码已发送至您的手机";
			return "modifyPwdSuccess";
		}
	}
	//经销商修改密码
	public String modifyPwd(){//经销商拦截器拦截
		return "modifyPwd";
	}
	//修改密码后跳到这里
	public String modifySuccess(){//经销商拦截器拦截
		AgencyVO aVo = (AgencyVO)session.get("agencyVO");
		if(!aVo.getPwd().equals(agencyVo.getPwd())){  //旧密码与新密码不同
			msg="旧密码错误";
			return "modifyPwd"; //返回到修改密码页面
		}else{
			agencyService.forgetPwd(aVo.getPhone(),newPwd); //调用忘记密码函数修改密码
			session.clear();//修改完密码后清空session数据
			return "login"; //修改密码后跳入登录页面
		}
	}
	//经销商查看信息，(信息初始化)
	public String initInfo(){	//经销商拦截器拦截
		AgencyVO aVo = (AgencyVO)session.get("agencyVO");
		agencyVo = agencyService.lookImg(aVo.getId());
		return "modifyInfo";
	}
	//经销商修改信息
	public String modifyInfo(){	//经销商拦截器拦截
		AgencyVO aVo = (AgencyVO)session.get("agencyVO");
		agencyService.modifyImg(aVo.getId(), agencyVo);
		//修改完查看信息
		agencyVo = agencyService.lookImg(aVo.getId());
		session.clear();
		session.put("agencyVO",agencyVo);
		return "lookInfo";
	}
	//经销商资料查看
	public String lookInfo(){
		AgencyVO aVo = (AgencyVO)session.get("agencyVO");
		agencyVo = agencyService.lookImg(aVo.getId());
		request.setAttribute("agencyVo",agencyVo );
		return "lookInfo";
	}
	
	//上传图标
	public String uploadLogo(){//经销商拦截器拦截
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
		agencyVo=new AgencyVO();
		String logoUrl=ServletActionContext.getRequest().getContextPath()+"/attached/agency";
		System.out.println(logoUrl);
		
		agencyVo.setLogo(logoUrl+"/"+newFileName);
		
		//logoUrl保存到数据库
		AgencyVO aVo = (AgencyVO)session.get("agencyVO");
		agencyService.modifyLogo(aVo.getId(), logoUrl+"/"+newFileName);
		aVo.setLogo(logoUrl+"/"+newFileName);
		session.put("agencyVo",aVo); //保存session
		return "load"; 	//更改经销商图标之后调到主页面
	}
	public String buildingsMap(){//跳转到经销商楼盘地图
		AgencyVO aVo = (AgencyVO)session.get("agencyVO");
		aVo=agencyService.queryById(aVo.getId());
		List builds=buildingsService.buildsListMap(aVo.getId());
		buildsList=JSON.toJSONString(builds);
		return "map";
	}
	
	//页面中点击首页进入该函数
	public String main(){//经销商拦截器拦截
		return "main";
	}
	public String list(){//管理员查看经销商，配置管理员拦截器
		PageByEasyUi<AgencyVO>page=new PageByEasyUi<>();
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page=agencyService.queryByPage(page);
		rows=page.getRows();
		total=page.getTotal();
		return "list";
	}
	//经销商审核
	public String updateStatus(){//配置管理员拦截器
		agencyService.updateStatus(agencyVo);
		return "list";
	}
	//进入经销商列表
	public String agencyListPage(){//配置管理员拦截器
		return "listPage";
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public AgencyVO getAgencyVo() {
		return agencyVo;
	}
	public void setAgencyVo(AgencyVO agencyVo) {
		this.agencyVo = agencyVo;
	}
	
	public ControllerResult getControllerResult() {
		return controllerResult;
	}
	public void setAgencyService(AgencyService agencyService) {
		this.agencyService = agencyService;
	}
	public int getPhoneYzm() {
		return phoneYzm;
	}

	public String getMsg() {
		return msg;
	}
	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}
	
	
	@Override
	public void setSession(Map session) {
		this.session=session;
	}

	public void setLogoFileName(String logoFilenName) {
		this.logoFileName = logoFilenName;
	}
	
	public void setLogo(File logo) {
		this.logo = logo;
	}

	public int getTotal() {
		return total;
	}

	public List getRows() {
		return rows;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public String getBuildsList() {
		return buildsList;
	}

	public void setBuildingsService(BuildingsService buildingsService) {
		this.buildingsService = buildingsService;
	}
}
