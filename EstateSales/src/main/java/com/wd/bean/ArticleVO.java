package com.wd.bean;

import java.io.Serializable;
import java.sql.Date;
//文章表
public class ArticleVO implements Serializable{
	private static final long serialVersionUID = 5565565140397673036L;
	private String id;//编号,UUID
	private String title;//文章标题
	private String abstracts;//文章摘要
	private String content;//文章内容
	private String content_url;//文章路径
	private String logo;//文章图片路径
	private int orderBy;//文章排序序号
	private Date created_time;//创建时间
	private String msg_status;//状态，激活或冻结
	private ArticleTypeVO articleType;
	public ArticleTypeVO getArticleType() {
		return articleType;
	}
	public void setArticleType(ArticleTypeVO articleType) {
		this.articleType = articleType;
	}
	public int getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(int orderBy) {
		this.orderBy = orderBy;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAbstracts() {
		return abstracts;
	}
	public void setAbstracts(String abstracts) {
		this.abstracts = abstracts;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getContent_url() {
		return content_url;
	}
	public void setContent_url(String content_url) {
		this.content_url = content_url;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public Date getCreated_time() {
		return created_time;
	}
	public void setCreated_time(Date created_time) {
		this.created_time = created_time;
	}
	public String getMsg_status() {
		return msg_status;
	}
	public void setMsg_status(String msg_status) {
		this.msg_status = msg_status;
	}
	
}
