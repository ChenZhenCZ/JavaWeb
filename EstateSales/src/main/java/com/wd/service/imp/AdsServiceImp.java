package com.wd.service.imp;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;

import com.wd.bean.AdsVO;
import com.wd.common.PageByEasyUi;
import com.wd.common.util.MakeHtml;
import com.wd.dao.AdsDao;
import com.wd.service.AdsService;

public class AdsServiceImp implements AdsService{
	private AdsDao adsDao;
	public void setAdsDao(AdsDao adsDao) {
		this.adsDao = adsDao;
	}

	@Override
	public AdsVO queryById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveOrUpdate(AdsVO t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void del(AdsVO t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public PageByEasyUi<AdsVO> queryByPage(PageByEasyUi<AdsVO> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public AdsVO login(AdsVO t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void save(AdsVO t, String fileName, HttpServletRequest request, File logo) {
		int pos = fileName.lastIndexOf('.');
		String ext = fileName.substring(pos); 
		String newFileName = System.nanoTime()+ext;
		String savepath=request.getRealPath("/attached/ads/logo/");//文件保存的真实路径
		String url=request.getContextPath()+"/attached/ads/logo/";//文件在项目上的调用url
		String content="";
		String contentName=System.nanoTime()+".html";
		String contentPath=savepath+contentName;
		try {
			FileUtils.copyFile(logo, new File(savepath,newFileName));//保存文章图标
			content=MakeHtml.makeHtml(t.getContent(), contentPath);
		} catch (IOException e) {
			e.printStackTrace();
		}
		t.setLogo(url+newFileName);
		t.setContent(content);
		t.setAd_url(url+contentName);
		t.setCreated_time(new Date(new java.util.Date().getTime()));
		t.setStatus("激活");
		t.setShow_status("Y");
		adsDao.saveOrUpdate(t);
	}

}
