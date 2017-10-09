package com.wd.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionSupport;
import com.wd.bean.BuildingsVO;
import com.wd.bean.LikeVO;
import com.wd.bean.UsersVO;
import com.wd.common.PageByEasyUi;
import com.wd.service.LikeService;

public class LikeAction extends ActionSupport implements SessionAware{
	private static final long serialVersionUID = -5445582745875528730L;
	private LikeVO like;
	private LikeService likeService;
	private UsersVO user;
	private BuildingsVO buildings;
	private Map session;
	private int pageSize;
	private int pageNumber;
	private int total;
	private List<LikeVO> rows;
	
	//用户点赞记录
	public String userlist(){
		return "userlist";		
	}
	public String userListPage(){
		UsersVO userid = (UsersVO) session.get("user");
		PageByEasyUi<LikeVO> page = new PageByEasyUi<LikeVO>();
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page = likeService.pageByUserid(page, userid.getId());
		rows = page.getRows();
		total = page.getTotal();
		return "userListPage";
	}  
	//用户点赞的删除
	public String delete(){
		likeService.del(like);
		return "delete";	
	}
	public String add() {
		like.setCreated_time(new Date());
		likeService.saveOrUpdate(like);
		return SUCCESS;
	}
	@Override
	public void setSession(Map session) {
		this.session = session;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotal() {
		return total;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public List<LikeVO> getRows() {
		return rows;
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
	public LikeVO getLike() {
		return like;
	}
	public void setLike(LikeVO like) {
		this.like = like;
	}
	public void setLikeService(LikeService likeService) {
		this.likeService = likeService;
	}
	public String list() {
		return "list";
	}
	public String buildList() {
		return "buildList";
	}

}
