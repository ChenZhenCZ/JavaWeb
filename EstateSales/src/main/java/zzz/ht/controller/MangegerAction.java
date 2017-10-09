package zzz.ht.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import zzz.ht.bean.ManagerVo;
import zzz.ht.bean.PageObject;
import com.opensymphony.xwork2.ActionSupport;

import zzz.ht.service.ManagerService;

public class MangegerAction extends ActionSupport implements ServletRequestAware,ServletResponseAware{

	private static final long serialVersionUID = 1L;
	
	private ManagerService managerService;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	
	public String manager(){
		String action = request.getParameter("action");
		if(action.equals("list")){
			//获取页面的参数
			String currentPage = request.getParameter("currentPage");
			String opr = request.getParameter("opr");
			//获取总记录数
			int cnt = managerService.getCount("select count(*) cnt from zzz");
			PageObject pager = new PageObject();
			//设置第一个参数
			pager.setRecordCount(cnt);
			//设置第二个参数
			if(currentPage==null || currentPage.equals("")){
				pager.setCurrentPage(1);
			}else{
				pager.setCurrentPage(Integer.parseInt(currentPage));
			}
			//设置第三个参数
			if(opr==null || opr.equals("")){
				pager.setOpr("first");
			}else{
				pager.setOpr(opr);
			}
			//获取当前页
			int currPage = pager.getCurrentPage();
			//获取数据库中所有的管理员数据
			List<ManagerVo> managerList = managerService.findManagerByPage(pager.getStartPos(),pager.getPageSize());
			//定义request变量，保存的是所以的管理员数据
			request.setAttribute("managerList", managerList);
			request.setAttribute("pager", pager);
		}
		return "managerList";
	}
	
	
	
	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}
}
