package com.wd.service.imp;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.wd.bean.ArticleVO;
import com.wd.common.PageByEasyUi;
import com.wd.common.util.MakeHtml;
import com.wd.dao.ArticleDao;
import com.wd.service.ArticleService;

public class ArticleServiceImp implements ArticleService{
	private ArticleDao articleDao;
	public void setArticleDao(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}
	@Override
	public ArticleVO queryById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveOrUpdate(ArticleVO t) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void del(ArticleVO t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public PageByEasyUi<ArticleVO> queryByPage(PageByEasyUi<ArticleVO> page) {
		page=articleDao.queryByPage(page);
		return page;
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArticleVO login(ArticleVO t) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void save(ArticleVO t, String fileName,HttpServletRequest request,File logo) {
		int pos = fileName.lastIndexOf('.');
		String ext = fileName.substring(pos); 
		String newFileName = System.nanoTime()+ext;
		String savepath=request.getRealPath("/attached/logo/");//文件保存的真实路径
		String url=request.getContextPath()+"/attached/logo/";//文件在项目上的调用url
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
		t.setContent_url(url+contentName);
		t.setCreated_time(new Date(new java.util.Date().getTime()));
		t.setMsg_status("激活");
		articleDao.saveOrUpdate(t);
	}
	@Override
	public void updateStatus(ArticleVO article) {
		articleDao.updateStatus(article);
	}
	@Override
	public List<ArticleVO> listOrderBy() {
		return articleDao.listOrderBy();
	}
	
	@Override
	public PageByEasyUi<ArticleVO> queryByAllPage(PageByEasyUi<ArticleVO> page) {
		return articleDao.queryByAllPage(page);
	}
	@Override
	public int allCount() {
		return articleDao.allCount();
	}
	@Override
	public PageByEasyUi<ArticleVO> queryByPageByArticleTitle(PageByEasyUi<ArticleVO> page, String articleTile) {
		
		return articleDao.queryByPageByArticleTitle(page, articleTile);
	}
	@Override
	public int getCountByArticleTitle(String articleTile) {
		
		return articleDao.getCountByArticleTitle(articleTile);
	}
	@Override
	public List<ArticleVO> articleByTime() {
		return articleDao.articleByTime();
	}


}
