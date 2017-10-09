package com.wd.common;

import java.util.List;

public class Pagination {
	//当前页
	private int pageNo;
	//每页数据量
	private int pageSize;
	//总数据量
	private int allCount;
	//总页数
	private int allPage;
	//每页开始
	private int recordStart;
	//每页结束
	private int recordEnd;
	//显示页数
	private int showCount;
	//显示开始
	private int showStart;
	//显示结束
	private int showEnd;
	/**
	 * 构造方法
	 * */
	/**
	 * 构造方法：缺省每页记录数为6，显示页码数为1,样式为空
	 * @param pageNo 当前页
	 * @param allCount 总记录数
	 * @param url  分页url 
	 * */
	public Pagination(int pageNo,int allCount,String url){
		this.pageNo=6;
		this.allCount=1;
		this.url="";
	} 
	/**
	 * 构造方法
	 *@param pageNo 当前页
	 *@param pageSize 每页记录数
	 *@param allCount 总记录数
	 *@param url 分页url
	 * */
	public Pagination(int pageNo,int pageSize,int allCount,String url){
		this.pageNo=pageNo;
		this.pageSize=pageSize;
		this.allCount = allCount;
		this.url=url;
	}
	/**
	 * 构造方法：缺省样式名字为空
	 * @param pageNo 当前页
	 * @param pageSize 每页记录数
	 * @param allCount 总记录数
	 * @param showCount 显示页码数
	 * @param url 分页url
	 * */
	public Pagination(int pageNo,int pageSize,int allCount,int showCount,String url){
		this.pageNo=pageNo;
		this.pageSize=pageSize;
		this.allCount=allCount;
		this.showCount=showCount;
		this.url=url;		
	}
	/**
	 * 构造方法
	 * @param pageNo 当前页
	 * @param pageSize 每页记录数
	 *@param allCount 总记录数
	 *@param showCount 显示页码数
	 *@param url 分页url
	 *@param styleClass 样式名字
	 * */
	public Pagination(int pageNo,int pageSize,int allCount,int showCount,String url,String styleClass){
		this.pageNo=pageNo;
		this.pageSize=pageSize;
		this.allCount=allCount;
		this.showCount=showCount;
		this.url=url;
		this.styleClass=styleClass;
	}
	/**
	 * 初始化各种分页参数
	 * */
	private void init(){
		allPage = allCount%pageSize==0?allCount/pageSize:allCount/pageSize+1;
		//末页，当前页大于总页数
		if(pageNo>allPage){
			pageNo=allPage;
		}
		//首页,当前页小于1
		if(pageNo<1){
			pageNo=1;
		}
		//每页开始
		recordStart =(pageNo-1)*pageSize;
		//每页结束
		recordEnd =Math.min(recordStart+pageSize, allCount);
		//显示页数
		showCount=Math.min(showCount, allPage);
		if(showCount>=allPage){
			showStart=1;
			showEnd = allPage;
		}else{
			if(pageNo<=(showCount+1)/2){
				showStart=1;
				showEnd=showCount;
			}else if(pageNo>allPage-(showCount+1)/2){
				showStart = allPage-showCount+1;
				showEnd= allPage;
			}else{
				showStart = pageNo-showCount/2;
				showEnd = showStart+showCount-1;
			}
		}
	}
	/**
	 * 获取分页数据
	 * @param <T> 范型参数
	 * @param list 需要分页的总数据集合
	 * @retur
	 * */
	public <T> List<T> getPageDate(List<T> list){
		return list.subList(recordStart,recordEnd);		
	}
	/**
	 * 生成页面的分页元素(分页html分页元素)
	 * */
	public String toString(){
		StringBuffer sb = new StringBuffer();
		sb.append("<div class='"+styleClass+"'>");
		if(pageNo>2){
			sb.append("<a>首页</a>&amp;nbsp;");
			sb.append("<a>上一页</a>&amp;nbsp;");
		}else{
			sb.append("<a href='"+url+"?pageNo=1'>首  页</a>&amp;nbsp;");
			sb.append("<a href='"+url+"?pageNo="+(pageNo-1)+"'>上一页</a>&amp;nbsp;");
		}
		for (int i = showStart; i < pageNo; i++) {
			sb.append("<a href='"+url+"?pageNo="+i+"'>" + i + "</a>&amp;nbsp;");
		}
		sb.append("<span>" + pageNo + "</span>&amp;nbsp;");
		for (int i = pageNo + 1; i <= showEnd; i++) {
			sb.append("<a href='"+url+"?pageNo="+i+"'>" + i + "</a>&amp;nbsp;");
		}
		if(pageNo>=allPage){
			sb.append("<a>下一页</a>&amp;nbsp;");
			sb.append("<a>尾  页</a>&amp;nbsp;");
		}else{
			sb.append("<a href='"+url+"?pageNo="+(pageNo+1)+"'>下一页</a>&amp;nbsp;");
			sb.append("<a href='"+url+"?pageNo="+allPage+"'>尾  页</a>&amp;nbsp;");
		}
			sb.append("</div>");
		return sb.toString();
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getAllCount() {
		return allCount;
	}
	public void setAllCount(int allCount) {
		this.allCount = allCount;
	}
	public int getAllPage() {
		return allPage;
	}
	public void setAllPage(int allPage) {
		this.allPage = allPage;
	}
	public int getRecordStart() {
		return recordStart;
	}
	public void setRecordStart(int recordStart) {
		this.recordStart = recordStart;
	}
	public int getRecordEnd() {
		return recordEnd;
	}
	public void setRecordEnd(int recordEnd) {
		this.recordEnd = recordEnd;
	}
	public int getShowCount() {
		return showCount;
	}
	public void setShowCount(int showCount) {
		this.showCount = showCount;
	}
	public int getShowStart() {
		return showStart;
	}
	public void setShowStart(int showStart) {
		this.showStart = showStart;
	}
	public int getShowEnd() {
		return showEnd;
	}
	public void setShowEnd(int showEnd) {
		this.showEnd = showEnd;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getStyleClass() {
		return styleClass;
	}
	public void setStyleClass(String styleClass) {
		this.styleClass = styleClass;
	}
	//URL地址
	private String url; 
	//样式名字
	private String styleClass;
}
