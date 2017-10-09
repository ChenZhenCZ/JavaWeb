package com.wd.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.wd.bean.AgencyVO;
import com.wd.bean.BuildingsVO;
import com.wd.bean.CommentVO;
import com.wd.bean.HistoryVO;
import com.wd.bean.UsersVO;
import com.wd.common.ControllerResult;
import com.wd.common.PageByEasyUi;
import com.wd.service.BuildingsService;
import com.wd.service.CommentService;

public class CommentAction extends ActionSupport implements SessionAware{
	private static final long serialVersionUID = 1L;
	private CommentService commentService;
	private CommentVO comment;
	private UsersVO user;
	private Map session;
	private int pageSize;
	private int pageNumber;
	private int total;
	private List<CommentVO> rows;
	private ControllerResult controllerResult;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private String content;	
	private String buildsName;	//经销商通过楼盘查找评价
	
	public String userlist(){
		return "userlist";		
	}
	public String listPage(){
		UsersVO userid = (UsersVO) session.get("user");
		PageByEasyUi<CommentVO>page=new PageByEasyUi<CommentVO>();
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page=commentService.pageByUserid(page,userid.getId() );
		rows=page.getRows();
		total=page.getTotal();
		return "listPage";		
	}
	public String commentAdd() {
		comment.setComment_time(new Date());
		if(comment.getContent().equals("")||comment.getUser().getId().equals("")){
			return "errors";
		}
		commentService.saveOrUpdate(comment);
		return SUCCESS;
	}
	public String delete(){
		commentService.del(comment);
		return "delete";		
	}
	
	
	public String initAgencylookComment(){
		return "initAgencylookComment";
	}
	
	public String agencyLookCommentByBuildsName(){
		AgencyVO agencyVO = (AgencyVO)session.get("agencyVO");
		PageByEasyUi<CommentVO>page=new PageByEasyUi<CommentVO>();
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page=commentService.pageByAgencyId(page,agencyVO.getId(), buildsName);
		rows=page.getRows();
		total=page.getTotal();
		return "listPage";	
	}
	public String agencyLookComment(){
		if(buildsName!=null){
			return agencyLookCommentByBuildsName();
		}
		AgencyVO agencyVO = (AgencyVO)session.get("agencyVO");
		PageByEasyUi<CommentVO>page=new PageByEasyUi<CommentVO>();
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page=commentService.pageByAgencyId(page, agencyVO.getId());
		rows=page.getRows();
		total=page.getTotal();
		return "listPage";	
	}
	public int getTotal() {
		return total;
	}
	public List<CommentVO> getRows() {
		return rows;
	}
	public void setSession(Map session) {
		this.session = session;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public ControllerResult getControllerResult() {
		return controllerResult;
	}
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}
	public UsersVO getUser() {
		return user;
	}
	public void setUser(UsersVO user) {
		this.user = user;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public CommentVO getComment() {
		return comment;
	}
	public void setComment(CommentVO comment) {
		this.comment = comment;
	}
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	public void setBuildsName(String buildsName) {
		this.buildsName = buildsName;
	}
	
}
