package com.wd.bean;

import java.io.Serializable;

public class PageObject implements Serializable{
private int pageSize=5;
//记录总数
private int recordCount;
//页数
private int pageCount;
//当前页
private int currentPage;

//操作
private String opr;
//起始位置
private int startPos;
public int getPageSize() {
	return pageSize;
}
public void setPageSize(int pageSize) {
	this.pageSize = pageSize;
}
public int getRecordCount() {
	return recordCount;
}
public void setRecordCount(int recordCount) {
	this.recordCount = recordCount;
	pageCount=(int)Math.ceil((float)recordCount/(float)pageSize);
}
public int getPageCount() {
	return pageCount;
}
public void setPageCount(int pageCount) {
	this.pageCount = pageCount;
}
public int getCurrentPage() {
	return currentPage;
}
public void setCurrentPage(int currentPage) {
	this.currentPage = currentPage;
}
public String getOpr() {
	return opr;
}
//操作
public void setOpr(String opr) {
	this.opr = opr;
	if(opr.equals("first")){
		currentPage=1;
	}else if(opr.equals("last")){
		currentPage =pageCount;				
	}else if(opr.equals("piror")){
		if(currentPage>1){
			currentPage--;
		}else{
			currentPage=1;
		}
	}else if(opr.equals("next")){
		if(currentPage<pageCount){
			currentPage++;
		}else{
			
			currentPage=pageCount;
		}
	}else{
		currentPage=1;
	}
		
}

public int getStartPos() {
	startPos = (currentPage-1)*pageSize;
	return startPos;
}
public void setStartPos(int startPos) {
	this.startPos = startPos;
}
}
