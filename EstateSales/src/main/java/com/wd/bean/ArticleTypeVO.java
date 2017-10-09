package com.wd.bean;

import java.io.Serializable;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;
//文章类别表
public class ArticleTypeVO implements Serializable{
	private static final long serialVersionUID = -961848869859491130L;
	private String id;//编号,UUID
	private String name;//类别名称
	private String des;//类别描述
	private Set<ArticleVO>articles;
	
	@JSON(serialize=false)
	public Set<ArticleVO> getArticles() {
		return articles;
	}
	public void setArticles(Set<ArticleVO> articles) {
		this.articles = articles;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
}
