package com.wd.service;

import com.wd.common.PageByEasyUi;

public interface BaseService <PK,T>{
	public T queryById(PK id);
	public void saveOrUpdate(T t);
	public void del(T t);
	public PageByEasyUi<T> queryByPage(PageByEasyUi<T> page);
	public int count();
	public T login(T t);
	
}
