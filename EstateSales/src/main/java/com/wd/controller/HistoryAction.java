package com.wd.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.wd.bean.ActivityVO;
import com.wd.bean.AgencyVO;
import com.wd.bean.BuildingsVO;
import com.wd.bean.HistoryVO;
import com.wd.bean.UsersVO;
import com.wd.common.ControllerResult;
import com.wd.common.PageByEasyUi;
import com.wd.service.HistoryService;

public class HistoryAction extends ActionSupport implements SessionAware,ServletRequestAware,ServletResponseAware{
	private static final long serialVersionUID = 1L;
	private List<HistoryVO> historyList;	
	private HistoryVO history;
	private HistoryService historyService;	
	private UsersVO user;
	private BuildingsVO buildings;
	private Map session;	
	
	private int pageSize;
	private int pageNumber;
	
	private int total;
	private List<HistoryVO> rows;
	
	private ControllerResult controllerResult;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private String msg;
	
	public String list(){
		return "list";	
	}
	//历史记录列表
	public String listPage(){
		UsersVO userid = (UsersVO)session.get("user");
		PageByEasyUi<HistoryVO>page=new PageByEasyUi<HistoryVO>();
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page=historyService.pageByid(page, userid.getId());
		rows=page.getRows();
		total=page.getTotal();
		return "listPage";		
	}
	//删除历史记录
	public String delete(){
		historyService.del(history);
		return "delete";
	}
	public List<HistoryVO> getHistoryList() {
		return historyList;
	}
	public void setHistoryList(List<HistoryVO> historyList) {
		this.historyList = historyList;
	}

	public HistoryVO getHistory() {
		return history;
	}
	public void setHistory(HistoryVO history) {
		this.history = history;
	}

	public UsersVO getUser() {
		return user;
	}

	public void setUser(UsersVO user) {
		this.user = user;
	}

	public BuildingsVO getBuildings() {
		return buildings;
	}

	public void setBuildings(BuildingsVO buildings) {
		this.buildings = buildings;
	}

	public ControllerResult getControllerResult() {
		return controllerResult;
	}
	public void setHistoryService(HistoryService historyService) {
		this.historyService = historyService;
	}

	public String getMsg() {
		return msg;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setSession(Map session) {
		this.session = session;
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}
	public int getTotal() {
		return total;
	}
	public List<HistoryVO> getRows() {
		return rows;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	
}
