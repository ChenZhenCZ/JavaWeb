package com.wd.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import com.wd.bean.AdsVO;

public interface AdsService extends BaseService<String,AdsVO>{
	public void save(AdsVO t,String fileName,HttpServletRequest request,File logo);
}
