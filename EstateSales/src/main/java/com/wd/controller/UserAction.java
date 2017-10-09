package com.wd.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.wd.bean.AgencyVO;
import com.wd.bean.UsersVO;
import com.wd.common.ControllerResult;
import com.wd.common.PageByEasyUi;
import com.wd.common.util.MyMD5Util;
import com.wd.common.util.sendsms;
import com.wd.service.UserService;

public class UserAction extends ActionSupport implements SessionAware, ServletRequestAware, ServletResponseAware {
	private static final long serialVersionUID = 1L;
	private UsersVO user;
	private UserService userService;
	private Map session;
	private ControllerResult controllerResult;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private int appointmentCount;
	private int historyCount;
	private int likeCount;
	private int commentcount;
	private String msg;
	private int yzm;
	private int pageSize;
	private int pageNumber;
	private int total;
	private List rows;
	// 图片上传
	private String headiconFileName;
	private File headicon;
	private String buildId;
	// 手机发送验证码
	public String phone() {//不拦截，后台验证
		if(user==null){
			return "errors";
		}else{
			System.out.println("手机验证码后台=" + user.getPhone());
			String phone = user.getPhone();
			int cnt = userService.queryByPhone(phone);// 返回1 则该邮箱已被注册过，0 则未注册过
			if (cnt == 1) { // 1 已被注册过
				controllerResult = ControllerResult.getFailResult("该手机号已存在");
				System.out.println("该手机号已存在");
			} else if (cnt == 0) { // 0 未注册过
				// 发送验证码到该手机
				yzm = 467545;
				// yzm =sendsms.send(phone);
				System.out.println("手机验证码为：" + yzm);
				controllerResult = ControllerResult.getSuccessResult("一分钟内有效");
			}
			return "phone";
		}
	}

	// 新用户注册
	public String register() {
		if(user==null){
			return "errors";
		}else{
			userService.saveOrUpdate(user);
			return "registerSuccess";
		}
	}

	// 记住密码登录
	public String index() {//不拦截
		Cookie[] cookies = request.getCookies();
		user = new UsersVO();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie c = cookies[i];
				if (c.getName().equals("phone")) {
					String phone = c.getValue();
					System.out.println("cookie=" + phone);
					user.setPhone(phone);
				}
			}
		}
		return "index";
	}
	public String loginRecdirt(){
		return "home";
	}
	// 登录
	public String login() {
		if(user==null){
			return "errors";
		}else{
			UsersVO user2 = userService.login(user);
			if (null != user2) {
				user = user2;
				Cookie cookie1 = new Cookie("phone", user.getPhone());
				// 设置一个月的有效期,单位是秒
				cookie1.setMaxAge(24 * 60 * 60 * 30);
				response.addCookie(cookie1);
				// 设置保存路径
				cookie1.setPath(request.getContextPath());
				// 把用户信息保存到session
				session.put("user", user);
			} else {
				msg = "fail";
				System.out.println(msg);
			}
			return "load";
		}
	}
	public String appLogin(){//预约登陆
		if(user==null){
			return "errors";
		}else{
			UsersVO user2 = userService.login(user);
			if (null != user2) {
				user2.setPwd(user.getPwd());
				user = user2;
				Cookie cookie1 = new Cookie("phone", user.getPhone());
				Cookie cookie2 = new Cookie("pwd", user.getPwd());
				// 设置一个月的有效期,单位是秒
				cookie1.setMaxAge(24 * 60 * 60 * 30);
				cookie2.setMaxAge(24 * 60 * 60 * 30);
				response.addCookie(cookie1);
				response.addCookie(cookie2);
				// 设置保存路径
				cookie1.setPath(request.getContextPath());
				cookie2.setPath(request.getContextPath());
				// 把用户信息保存到session
				session.put("user", user);
			} else {
				msg = "账号或密码输入错误！";
				System.out.println(msg);
			}
			return "appointment";
		}
	}
	public String home() {//用户拦截器拦截
		UsersVO user=(UsersVO)session.get("user");
		user=userService.queryById(user.getId());
		appointmentCount=user.getAppointment().size();
		likeCount=user.getLikeSet().size();
		historyCount=user.getHistorySet().size();
		commentcount=user.getCommentSet().size();
		return "home";
	}
	public int getHistoryCount() {
		return historyCount;
	}

	public String homePage() {//用户拦截器拦截		
		return "homePage";
	}

	public String changePwdPage() {//用户拦截器拦截
		return "changePwdPage";
	}

	// 修改用户信息
	public String update() {//用户拦截器拦截
		UsersVO user2 = (UsersVO) session.get("user");
		user.setId(user2.getId());
		user.setPwd(user2.getPwd());
		user.setHeadicon(user2.getHeadicon());
		userService.update(user);
		user.setBirthday(new Date(user.getBirthday().getTime()));
		session.put("user", user);
		return home();
	}

	// 修改密码
	public String changePwd() {//用户拦截器拦截
		UsersVO user2 = (UsersVO) session.get("user");
		user2.getPwd();		//旧密码 需要更改的密码
		user.getQq(); 		//新密码
		user.setId(user2.getId()); //获取当前用户Id
		boolean validate = false;
		try {
			validate = MyMD5Util.validPassword(user.getPwd(),user2.getPwd());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		if (validate) {
			userService.changePwd(user);	//修改密码
			session.put("user", user2);
			return "changePwdSuccess";
		} else {
			msg = "原密码输入错误，请重新输入！";
			System.out.println(msg);
			return "changePwd";
		}
	}
	// 忘记密码
	public String forgetPwd() {
		if(user==null){
			return "errors";
		}else{
			String phone = user.getPhone();
			String pwd = "111111";
			// String pwd = String.valueOf(sendsms.send(phone));
			userService.forgetPwd(phone, pwd);
			msg = "密码已发送至您的手机";
			return "index";
		}
	}
	// 修改头像
	public String uploadHeadicon() {//用户拦截器拦截
		String path = ServletActionContext.getRequest().getRealPath("/attached/user");
		int pos = headiconFileName.lastIndexOf('.');
		String ext = headiconFileName.substring(pos);
		String newFileName = System.nanoTime() + ext;
		try {
			FileUtils.copyFile(headicon, new File(path, newFileName));// 保存头像
			System.out.println("绝对路径：" + path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		user = new UsersVO();
		String logoUrl = ServletActionContext.getRequest().getContextPath() + "/attached/user";
		System.out.println(logoUrl);
		user.setHeadicon(logoUrl + "/" + newFileName);
		// logoUrl保存到数据库
		UsersVO user2 = (UsersVO) session.get("user");
		userService.modifyHeadicon(user2.getId(), logoUrl + "/" + newFileName);
		user2.setHeadicon(logoUrl + "/" + newFileName);
		session.put("user", user2); // 保存session
		System.out.println("修改的logo保存到数据库");
		user = user2;
		return "load"; // 更改图标之后调到主页面
	}
	public String pageByEasy() {
		return "page";
	}

	public String listPage() {//管理员拦截器拦截
		return "listPage";
	}
	public String userDetail(){//管理员查看用户详情信息
		user=userService.queryById(user.getId());
		return "userDetail";
	}
	public String userList() {//管理员拦截器拦截
		PageByEasyUi<UsersVO> page = new PageByEasyUi<>();
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page = userService.queryByPage(page);
		rows = page.getRows();
		total = page.getTotal();
		return "list";
	}

	// 安全退出
	public String exit() {
		session.clear();
		Cookie cookie1 = new Cookie("phone", "");
		Cookie cookie2 = new Cookie("pwd", "");
		// 设置一个月的有效期,单位是秒
		cookie1.setMaxAge(0);
		cookie2.setMaxAge(0);
		response.addCookie(cookie1);
		response.addCookie(cookie2);
		// 设置保存路径
		cookie1.setPath(request.getContextPath());
		cookie2.setPath(request.getContextPath());
		return "index";

	}
	public void setHeadiconFileName(String headiconFileName) {
		this.headiconFileName = headiconFileName;
	}
	public void setHeadicon(File headicon) {
		this.headicon = headicon;
	}
	public UsersVO getUser() {
		return user;
	}
	public void setUser(UsersVO user) {
		this.user = user;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	public String getMsg() {
		return msg;
	}
	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;

	}
	public int getYzm() {
		return yzm;
	}
	public ControllerResult getControllerResult() {
		return controllerResult;
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
	public int getAppointmentCount() {
		return appointmentCount;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setBuildId(String buildId) {
		this.buildId = buildId;
	}
	public int getCommentcount() {
		return commentcount;
	}

}
